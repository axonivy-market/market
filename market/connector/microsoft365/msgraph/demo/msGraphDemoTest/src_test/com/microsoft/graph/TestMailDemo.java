package com.microsoft.graph;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.security.ISession;
import ms.graph.NewMail;

@IvyProcessTest
public class TestMailDemo
{
  @Test
  public void readInbox(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365Mail/inbox.ivp")
      .as().session(session)
      .execute();
    assertThat(result.http().redirectLocation()).containsSubsequence(
      "http://localhost:",
      "scope=user.read");

    BpmElement inboxViewer = BpmElement.pid("176DD02137AD2F50-f12");
    bpmClient.mock().element(inboxViewer).withNoAction();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resume("f3"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    ms.graph.demo.MailDemo mail = result2.data().last();
    assertThat(mail.getMails()).hasSize(1);
    MicrosoftGraphMessage githubMail = mail.getMails().get(0);
    assertThat(githubMail.getSubject()).startsWith("Re:");
  }
  
  @Test
  public void writeMail(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    mockMailUi(bpmClient);
    
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365Mail/writeMail.ivp")
      .as().session(session)
      .execute();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resumeSub("f7"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    assertThat(result2.bpmError()).isNull();
  }
  
  private void mockMailUi(BpmClient bpmClient)
  {
    NewMail mail = new NewMail();
    mail.setReceivers(List.of("me@mailinator.com"));
    mail.setSubject("Meet for Lunch?");
    mail.setBody("the new cafeteria is open");
    bpmClient.mock()
    .element(BpmElement.pid("176DD02137AD2F50-f14"))
    .with((in,out) -> { 
      try
      {
        in.set("mail", mail);
      }
      catch (NoSuchFieldException ex)
      {
      }});
  }

  private static String resume(String restActivityFieldId)
  {
    return "176DD02137AD2F50/176DD02137AD2F50-"+restActivityFieldId+"/resume.ivp";
  }
  
  private static String resumeSub(String restActivityFieldId)
  {
    return "1783B782896F7AC3/1783B782896F7AC3-"+restActivityFieldId+"/resume.ivp";
  }
}
