package com.microsoft.graph;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.security.ISession;

@IvyProcessTest
public class TestToDoDemo
{
  @Test
  public void readList(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365ToDo/myToDo.ivp")
      .as().session(session)
      .execute();
    assertThat(result.http().redirectLocation()).isNotEmpty();

    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resume("f3"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    ms.graph.demo.ToDoDemo toDo = result2.data().last();
    assertThat(toDo.getTodo()).hasSize(1);
    MicrosoftGraphTodoTask reviewTask = toDo.getTodo().get(0);
    assertThat(reviewTask.getTitle()).startsWith("Digitalize your business");
  }
  
  @Test
  public void createTask(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    
    System.err.println("test session: "+session);
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365ToDo/createTask.ivp")
      .as().session(session)
      .execute();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resume("f12"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    ms.graph.demo.ToDoDemo toDo = result2.data().last();
    assertThat(toDo.getTodo()).hasSize(1);
    MicrosoftGraphTodoTask reviewTask = toDo.getTodo().get(0);
    assertThat(reviewTask.getTitle()).startsWith("Digitalize your business");
  }

  private static String resume(String restActivityFieldId)
  {
    return "176F208BF8721ECC/176F208BF8721ECC-"+restActivityFieldId+"/resume.ivp";
  }
}
