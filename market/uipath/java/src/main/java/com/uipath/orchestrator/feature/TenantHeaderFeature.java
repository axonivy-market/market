package com.uipath.orchestrator.feature;

import java.io.IOException;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.ClientRequestContext;
import javax.ws.rs.client.ClientRequestFilter;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;


public class TenantHeaderFeature implements Feature
{
  public static final String PROPERTY_NAME = "tenant";

  @Override
  public boolean configure(FeatureContext context)
  {
    var config = new FeatureConfig(context.getConfiguration(), TenantHeaderFeature.class);
    String tenant = config.readMandatory(PROPERTY_NAME);
    context.register(new OrechstratorTenantFilter(tenant), Priorities.HEADER_DECORATOR);
    return true;
  }

  private static class OrechstratorTenantFilter implements ClientRequestFilter
  {
    private final String tenant;

    private OrechstratorTenantFilter(String tenant)
    {
      this.tenant = tenant;
    }

    @Override
    public void filter(ClientRequestContext context) throws IOException 
    {
      context.getHeaders().add("X-UIPATH-TenantName", tenant);
    }
  }

}
