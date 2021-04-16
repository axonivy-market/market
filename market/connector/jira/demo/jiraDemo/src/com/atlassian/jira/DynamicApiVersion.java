package com.atlassian.jira;

import java.io.IOException;
import java.net.URI;
import java.util.Optional;

import javax.ws.rs.client.ClientRequestContext;
import javax.ws.rs.client.ClientRequestFilter;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.ext.Provider;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.rest.client.FeatureConfig;

/**
 * Patches the static REST API path-version to be compliant with earlier versions. 
 * See Rest Client property <code>API.version</code>
 */
public class DynamicApiVersion implements Feature
{
  @Override
  public boolean configure(FeatureContext context)
  {
    context.register(new PathVersionFilter());
    return true;
  }

  @Provider
  public static class PathVersionFilter implements ClientRequestFilter
  {
    private static final String PROPERTY_API_VERSION = "API.version";
    private static final String REST_API_3 = "rest/api/3/";

    @Override
    public void filter(ClientRequestContext context) throws IOException
    {
      FeatureConfig config = new FeatureConfig(context.getConfiguration(), PathVersionFilter.class);
      URI uri = context.getUri();
      Optional<String> apiVersion = config.read(PROPERTY_API_VERSION);
      if (apiVersion.isEmpty())
      { // not set
        return;
      }
      String version = apiVersion.get();
      if (version.equals("3"))
      { // default
        return;
      }
      
      if (uri.toString().contains(REST_API_3))
      {
        String dynamic = uri.toString().replace(REST_API_3, "rest/api/{apiVersion}/");
        URI patchedURI = UriBuilder.fromUri(dynamic)
          .resolveTemplate("apiVersion", version)
          .build();
        Ivy.log().info("patching URI to " + patchedURI);
        context.setUri(patchedURI);
      }
    }
  }
}
