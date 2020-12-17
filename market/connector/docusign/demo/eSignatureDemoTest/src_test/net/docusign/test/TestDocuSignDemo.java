package net.docusign.test;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.security.ISession;

@IvyProcessTest
public class TestDocuSignDemo
{
  @Test
  public void main(BpmClient bpmClient, ISession session)
  {
    session.setActiveEnvironment("dev-axonivy");
    
    ExecutionResult result2 = bpmClient.start()
      .process("Demo/eSign/authenticated.ivp")
      .as().session(session)
      .withParam("code", "a-test-code")
      .execute();
    
    net.docusign.esignature.demo.Data docuSign = result2.data().last();
    assertThat(docuSign.getEnvelopes()).hasSize(1);
  }
}
