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
import ms.graph.NewEvent;

@IvyProcessTest
public class TestCalendarDemo
{
  @Test
  public void readPersonal(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365Calendar/readCalendar.ivp")
      .as().session(session)
      .execute();
    assertThat(result.http().redirectLocation()).containsSubsequence(
      "http://localhost:",
      "scope=user.read");

    bpmClient.mock()
      .element(BpmElement.pid("176D21535A8FEE20-f20"))
      .withNoAction();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resume("f3"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    ms.graph.demo.CalendarDemo cal = result2.data().last();
    assertThat(cal.getEvents()).hasSize(1);
    MicrosoftGraphEvent wfUiReview = cal.getEvents().get(0);
    assertThat(wfUiReview.getSubject())
      .contains("Workflow UI: Review");
  }
  
  @Test
  public void createMeeting(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    
    mockMeetingUi(bpmClient);
    
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365Calendar/meet.ivp")
      .as().session(session)
      .execute();
    
    
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resume("f14"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    ms.graph.demo.CalendarDemo cal = result2.data().last();
    assertThat(cal.getEvents()).hasSize(1);
    MicrosoftGraphEvent wfUiReview = cal.getEvents().get(0);
    assertThat(wfUiReview.getSubject())
      .isEqualTo("Define digitalization roadmap");
  }

  private void mockMeetingUi(BpmClient bpmClient)
  {
    NewEvent meet = new NewEvent();
    meet.setParticipants(List.of("me@mailinator.com"));
    meet.setSubject("Define digitalization roadmap");
    meet.setDescription("go for more");
    bpmClient.mock()
    .element(BpmElement.pid("176D21535A8FEE20-f13"))
    .with((in,out) -> { 
      try
      {
        out.set("newEvent", meet);
      }
      catch (NoSuchFieldException ex)
      {
      }});
    
    
    BpmElement calViewer = BpmElement.pid("176D21535A8FEE20-f11");
    bpmClient.mock().element(calViewer).withNoAction();
  }

  private static String resume(String restClientActivityFieldId)
  {
    return "1783A266998C4015/1783A266998C4015-"+restClientActivityFieldId+"/resume.ivp";
  }
}
