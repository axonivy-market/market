package net.docusign.test;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.security.ISession;
import ch.ivyteam.ivy.workflow.ITask;
import ch.ivyteam.ivy.workflow.WorkflowNavigationUtil;

@IvyProcessTest
public class TestDocuSignDemo
{
  @Test
  public void main(BpmClient bpmClient, ISession session, AppFixture fixture, IApplication app)
  {
    fixture.environment("dev-axonivy");
    
    ExecutionResult result = userFlow(bpmClient, session);
    net.docusign.esignature.demo.Data docuSign = result.data().last();
    assertThat(docuSign.getEnvelopes()).hasSize(1);
    
    ITask wait4Signing = result.workflow().activeTasks().get(0);
    fireIntermediateEvent(app, wait4Signing, docuSign.getEnvelopeId());
    
    ExecutionResult endResult = bpmClient.start().task(wait4Signing).as().systemUser().execute();
    assertThat(endResult.bpmError()).isNull();
//    ICase activeCase = endResult.workflow().activeCase();
//    assertThat(activeCase.documents().getAll()).isNotEmpty();
  }

  private ExecutionResult userFlow(BpmClient bpmClient, ISession session)
  {
    ExecutionResult result = bpmClient.start()
      .process("Demo/eSign/start.ivp")
      .as().session(session)
      .execute();
    assertThat(result.http().redirectLocation()).containsSubsequence(
            "http://localhost:",
            "/test/api/docuSignMock/oauth/auth?response_type=code&scope=signature+impersonation&client_id=test-key&redirect_uri=http%3A%2F%2Flocalhost%3A", 
            "%2Ftest%2Fauth%2Fcallback");

    ExecutionResult result2 = bpmClient.start()
            .webPage(result.workflow().executedTask(), "17651A0FB6AFB366/17651A0FB6AFB366-f6/resume.ivp")
            .withParam("code", "a-test-code")
            .as().session(session)
            .execute();

    return result2;
  }
  
  private void fireIntermediateEvent(IApplication app, ITask waitTask, String envelopeId)
  {
    String eventId = waitTask.getIntermediateEvent().getEventIdentifier();
    var element = waitTask.getIntermediateEvent().getIntermediateEventElement();
    var workflowContext = WorkflowNavigationUtil.getWorkflowContext(app);
    workflowContext.fireIntermediateEvent(element, eventId, envelopeId, "test-event");
  }
  
}
