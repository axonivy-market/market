package com.twitter.test;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.security.ISession;

/**
 * Service functionality is mocked out here: {@link TwitterMock}
 */
@IvyProcessTest
public class TestTwitterDemo
{
  @Test
  public void readTweets(BpmClient bpmClient, ISession session)
  {
    bpmClient.mock().element(BpmElement.pid("1767526B51BD56CB-f7")).withNoAction();
    session.setActiveEnvironment("dev-axonivy");
    ExecutionResult result = bpmClient.start()
      .process("Demo/twitter/recentTweets.ivp")
      .as().session(session)
      .execute();
    
    com.twitter.demo.Data data = result.data().last();
    assertThat(data.getUser().getName()).isEqualTo("AXON IVY");
  }
}
