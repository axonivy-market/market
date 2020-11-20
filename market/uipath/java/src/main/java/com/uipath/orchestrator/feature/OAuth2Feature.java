package com.uipath.orchestrator.feature;

import java.io.IOException;
import java.util.Map;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.ClientRequestContext;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Configurable;
import javax.ws.rs.core.Configuration;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.ext.Provider;

public class OAuth2Feature implements Feature
{
  public static final String TOKEN_MISSING = "rest:client:token:missing";

  public static interface Property
  {
    String CLIENT_ID = "clientId";
    String USER_KEY = "userKey";
  }

  @Override
  public boolean configure(FeatureContext context)
  {
    context.register(new AuthorizationFilter(), Priorities.AUTHORIZATION);
    return true;
  }

  @Provider
  private static class AuthorizationFilter implements javax.ws.rs.client.ClientRequestFilter
  {
    private static final String AUTHORIZATION = "Authorization";

    @Override
    public void filter(ClientRequestContext context) throws IOException
    {
      var token = getNewAccessToken(context);
      String accessToken = (String) token.get("access_token");
      if (accessToken == null || accessToken.isBlank())
      {
        throw new IllegalStateException("Failed to read 'access_token' from " + token);
      }
      if (!context.getHeaders().containsKey(AUTHORIZATION))
      {
        context.getHeaders().add(AUTHORIZATION, "Bearer " + accessToken);
      }
    }

    private Map<String, Object> getNewAccessToken(ClientRequestContext context)
    {
      var client = newTenantClient();
      copy(context.getConfiguration(), client, TenantHeaderFeature.PROPERTY_NAME);
      TokenRequest request = new TokenRequest(
        readMandatory(context.getConfiguration(), Property.CLIENT_ID),
        readMandatory(context.getConfiguration(), Property.USER_KEY)
      );
      
      GenericType<Map<String, Object>> map = new GenericType<>(Map.class);
      var result = client
              .target("https://account.uipath.com/oauth/token")
              .request()
              .post(Entity.json(request))
              .readEntity(map);
      return result;
    }

    private static String readMandatory(Configuration config, String key)
    {
      Object value = config.getProperty(key);
      if (value instanceof String)
      {
        String tenant = (String) value;
        if (!tenant.isBlank())
        {
          return tenant;
        }
      }
      throw new IllegalStateException("Missing property '" + key + "' on for " + OAuth2Feature.class.getName() + ".");
    }

    private static void copy(Configuration source, Configurable<?> target, String name)
    {
      target.property(name, source.getProperty(name));
    }

    private Client newTenantClient()
    {
      return ClientBuilder.newClient().register(TenantHeaderFeature.class);
    }

    @SuppressWarnings("unused")
    public static class TokenRequest
    {
      public final String grant_type = "refresh_token";
      public final String client_id;
      public final String refresh_token;

      public TokenRequest(String clientId, String userKey)
      {
        this.client_id = clientId;
        this.refresh_token = userKey;
      }
    }
  }

}
