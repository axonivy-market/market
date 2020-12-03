package com.uipath.connector.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Map;

import org.apache.log4j.Logger;
import org.junit.jupiter.api.Test;

import com.uipath.connector.UiPathData;
import com.uipath.orchestrator.feature.TokenStore;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.security.ISession;

/**
 * Service functionality is mocked out here: {@link UiPathMock}
 */
@IvyProcessTest
public class TestUiPathRPA
{
  private static final BpmElement UI_PATH_END = BpmElement.pid("175F58F3612E10B1-f15");
  
  private static final Logger LOGGER = Logger.getLogger(TestUiPathRPA.class);
  
  @Test
  public void rpaDemo(BpmClient bpmClient, ISession session)
  {
    TokenStore store = new TokenStore(session, "localhost", LOGGER);
    Map<String, Object> oauthToken = Map.of("access_token", (Object)"notMyToken");
    store.setToken(oauthToken);
    session.setActiveEnvironment("dev-axonivy");
    
    ExecutionResult result = bpmClient.start()
      .process("RPA/uiPathDemo/robotGetOrders.ivp")
      .as().session(session)
      .execute();
    
    UiPathData data = result.data().lastOnElement(UI_PATH_END);
    assertThat(data.getLicense()).isNotNull();
    assertThat(data.getReleases()).isNotEmpty();
    assertThat(data.getRobots()).isNotEmpty();
  }
}
