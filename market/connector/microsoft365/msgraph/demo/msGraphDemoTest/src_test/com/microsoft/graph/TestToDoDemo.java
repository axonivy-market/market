package com.microsoft.graph;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.security.ISession;
import ms.graph.NewToDo;

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
    
    bpmClient.mock()
      .element(BpmElement.pid("176F208BF8721ECC-f6"))
      .withNoAction();

    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resumeSub("f3"))
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
    mockTaskUi(bpmClient);
    
    System.err.println("test session: "+session);
    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365ToDo/createTask.ivp")
      .as().session(session)
      .execute();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resumeSub("f12"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();
    
    ms.graph.demo.ToDoDemo toDo = result2.data().last();
    assertThat(toDo.getTodo()).hasSize(1);
    MicrosoftGraphTodoTask reviewTask = toDo.getTodo().get(0);
    assertThat(reviewTask.getTitle()).isEqualTo("Test task");
  }
  
  private void mockTaskUi(BpmClient bpmClient)
  {
    NewToDo task = new NewToDo();
    task.setTitle("Test task");
    task.setContent("This is a test task");
    bpmClient.mock()
    .element(BpmElement.pid("176F208BF8721ECC-f11"))
    .with((in,out) -> { 
      try
      {
        in.set("task", task);
      }
      catch (NoSuchFieldException ex)
      {
      }});
  }

  private static String resumeSub(String restActivityFieldId)
  {
    return "17844DC635AF15F4/17844DC635AF15F4-"+restActivityFieldId+"/resume.ivp";
  }
}
