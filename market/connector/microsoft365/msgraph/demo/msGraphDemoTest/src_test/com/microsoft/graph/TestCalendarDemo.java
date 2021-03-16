package com.microsoft.graph;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.security.ISession;

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

  private static String resume(String restClientActivityFieldId)
  {
    return "176D21535A8FEE20/176D21535A8FEE20-"+restClientActivityFieldId+"/resume.ivp";
  }
}
