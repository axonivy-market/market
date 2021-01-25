package net.docusign.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Path;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.scripting.objects.File;
import ch.ivyteam.ivy.security.ISession;
import ch.ivyteam.ivy.workflow.ICase;
import ch.ivyteam.ivy.workflow.ITask;
import ch.ivyteam.ivy.workflow.TaskState;
import ch.ivyteam.ivy.workflow.WorkflowNavigationUtil;
import net.docusign.event.EnvelopeCompleted;

@IvyProcessTest
public class TestDocuSignDemo
{
  @Test
  public void main(BpmClient bpmClient, ISession session, AppFixture fixture, IApplication app) throws URISyntaxException, IOException
  {
    fixture.environment("dev-axonivy");
    setupPrivateKey(app);
    
    ExecutionResult result = userFlow(bpmClient, session);
    net.docusign.esignature.demo.Data docuSign = result.data().last();
    assertThat(docuSign.getEnvelopes()).hasSize(1);
    
    ITask signTask = result.workflow().activeTasks().get(0);
    assertThat(signTask.getState()).isEqualTo(TaskState.SUSPENDED);
    
    ITask system2Signing = result.workflow().activeTasks().get(1);
    assertThat(system2Signing.getState()).isEqualTo(TaskState.SUSPENDED);
    bpmClient.start().task(system2Signing).as().systemUser().execute();    
    
    ITask wait4Signing = result.workflow().activeTasks().get(1);
    assertThat(wait4Signing.getState()).isEqualTo(TaskState.WAITING_FOR_INTERMEDIATE_EVENT);    
    fireIntermediateEvent(app, wait4Signing, docuSign.getEnvelopeId());
    
    assertThat(wait4Signing.getState()).isEqualTo(TaskState.SUSPENDED);
    ExecutionResult endResult = bpmClient.start().task(wait4Signing).as().systemUser().execute();
    
    assertThat(endResult.bpmError()).isNull();
    assertThat(result.http().redirectLocation()).contains("?endedTaskId=");
    assertThat(wait4Signing.getState()).isEqualTo(TaskState.DONE);
    
    ITask completedTask = result.workflow().activeTasks().get(1);
    assertThat(completedTask.getState()).isEqualTo(TaskState.SUSPENDED);
    
    ICase activeCase = endResult.workflow().activeCase();
    assertThat(activeCase.documents().getAll()).isNotEmpty();
  }

  @SuppressWarnings("all")
  private static void setupPrivateKey(IApplication app) throws URISyntaxException 
  {
    var tata = ch.ivyteam.ivy.application.restricted.rest.RestClientDao.forApp(app)
      .findById(EnvelopeCompleted.DOCU_SIGN_CLIENT_ID, app.getActualEnvironment());
    Path testKeyFile = Path.of(TestDocuSignDemo.class.getResource("testKey.pem").toURI());
    tata.addProperty("AUTH.systemKeyFile", 
      testKeyFile.toAbsolutePath().toString());
  }

  private ExecutionResult userFlow(BpmClient bpmClient, ISession session) throws IOException
  {  
	File doc = new File("sampledDoc.pdf", false);
	doc.createNewFile();
    
	bpmClient
      .mock()
      .uiOf(BpmProcess.name("eSign").elementName("Upload Document"))
      .with((params, results) -> results.set("file", doc));
	  
    ExecutionResult result = bpmClient.start()
      .process("Demo/eSign/startWf.ivp")
      .as().session(session)
      .execute();
    assertThat(result.http().redirectLocation()).containsSubsequence("http://localhost:",
      "/test/api/docuSignMock/oauth/auth?response_type=code&scope=signature+impersonation&client_id=test-key&redirect_uri=http%3A%2F%2Flocalhost%3A",
      "%2Ftest%2Fauth%2Fcallback");
    
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), "17651A0FB6AFB366/17651A0FB6AFB366-f6/resume.ivp")
      .withParam("code", "a-test-code").as().session(session).execute();
    
    return result2;
  }
  
  private void fireIntermediateEvent(IApplication app, ITask waitTask, String envelopeId)
  {
    var element = waitTask.getIntermediateEvent().getIntermediateEventElement();
    var workflowContext = WorkflowNavigationUtil.getWorkflowContext(app);
    workflowContext.fireIntermediateEvent(element, envelopeId, envelopeId, "test-event");
  }
  
}
