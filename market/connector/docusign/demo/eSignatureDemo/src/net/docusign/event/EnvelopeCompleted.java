package net.docusign.event;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.eclipse.core.runtime.IProgressMonitor;

import com.docusign.esign.model.Envelope;
import com.docusign.esign.model.EnvelopesInformation;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.persistence.PersistencyException;
import ch.ivyteam.ivy.process.intermediateevent.AbstractProcessIntermediateEventBean;
import ch.ivyteam.ivy.service.ServiceException;
import ch.ivyteam.ivy.workflow.ITask;
import ch.ivyteam.ivy.workflow.TaskState;
import ch.ivyteam.ivy.workflow.query.CaseQuery;
import ch.ivyteam.ivy.workflow.query.TaskQuery;

public class EnvelopeCompleted extends AbstractProcessIntermediateEventBean
{
  public EnvelopeCompleted()
  {
    super("WaitForEnvelope", "Waits until envelopes are completed (signed by all participants)", String.class);
  }

  @Override
  public void start(IProgressMonitor monitor) throws ServiceException
  {
    super.start(monitor);
    getEventBeanRuntime().setPollTimeInterval(TimeUnit.SECONDS.toMillis(30));
  }
  
  @Override
  public void poll()
  {
    String additionalInformation = "";
    String resultObject = "";
    
    List<String> envelopes = getEnvelopeIdsOfPendingCases();
    getEventBeanRuntime().getRuntimeLogLogger().info("pending envelopes "+envelopes);
    if (envelopes.isEmpty())
    {
      return;
    }
    
    List<String> completedIds = getDocuSignEnvelope(envelopes);
    if (!completedIds.isEmpty())
    {
      getEventBeanRuntime().getRuntimeLogLogger().debug("envelopes have been signed: "+completedIds);
      try
      {
        for(String envelopeId : completedIds)
        {
          getEventBeanRuntime().fireProcessIntermediateEventEx(envelopeId, resultObject, additionalInformation);
        }
      }
      catch (PersistencyException ex)
      {
      }
    }
  }

  private static List<String> getEnvelopeIdsOfPendingCases()
  {
    TaskQuery query = TaskQuery.create();
    CaseQuery withEnvelope = CaseQuery.create().where()
      .customField().stringField("envelopeId").isNotNull();
    query = query.where().state().isEqual(TaskState.WAITING_FOR_INTERMEDIATE_EVENT)
      .and().cases(withEnvelope);
    List<ITask> tasks = query.executor().results();
    List<String> envelopes = tasks.stream()
      .map(task -> task.getCase().customFields().stringField("envelopeId").getOrNull())
      .collect(Collectors.toList());
    return envelopes;
  }

  private static List<String> getDocuSignEnvelope(List<String> envelopeIds)
  {
    UUID docuSignClientId = UUID.fromString("17e5dc27-5699-4717-ae6c-e2c8f1e2a30f");
    EnvelopesInformation info = Ivy.rest().client(docuSignClientId)
      .path("/v2.1/accounts/{accountId}/envelopes")
      .resolveTemplate("accountId", "placeholder")
      .queryParam("status", "completed")
      .queryParam("envelope_ids", envelopeIds.stream().collect(Collectors.joining(",")))
      .request()
      .get()
      .readEntity(EnvelopesInformation.class);
    List<Envelope> envelopes = info.getEnvelopes();
    if (envelopes == null)
    {
      return Collections.emptyList();
    }
    return envelopes.stream()
      .map(Envelope::getEnvelopeId)
      .filter(Objects::nonNull)
      .collect(Collectors.toList());
  }

}
