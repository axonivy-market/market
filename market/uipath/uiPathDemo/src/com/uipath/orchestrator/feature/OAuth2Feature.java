package com.uipath.orchestrator.feature;

import java.io.IOException;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientRequestContext;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.Response.Status.Family;
import javax.ws.rs.ext.Provider;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.bpm.error.BpmPublicErrorBuilder;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.security.ISession;
import ch.ivyteam.log.Logger;


/**
 * Authentication feature that authorizes request against uipath orchestrator
 * with a 'Bearer' token. 
 * 
 * https://docs.uipath.com/orchestrator/reference/consuming-cloud-api
 * 
 * @since 9.2
 */
public class OAuth2Feature implements Feature
{
  public static interface Property
  {
    // the given clientId+userKey combination is valid until revocation on the orchestrator web-ui.
    // so refreshing the token after 24h hours should be possible without any restrictions.
    String CLIENT_ID = "AUTH.clientId";
    String USER_KEY = "AUTH.userKey";
    
    String ACCESS_TOKEN_URI = "AUTH.accessTokenUri";
  }

  @Override
  public boolean configure(FeatureContext context)
  {
    context.register(new AuthorizationFilter(Ivy.session(), Ivy.log()), Priorities.AUTHORIZATION);
    return true;
  }

  @Provider
  private static class AuthorizationFilter implements javax.ws.rs.client.ClientRequestFilter
  {
    private static final String AUTHORIZATION = "Authorization";
    private static final String DEFAULT_ACCESS_TOKEN_URI = "https://account.uipath.com/oauth/token";

    private Function<String, TokenStore> tokenStore;
    
    public AuthorizationFilter(ISession session, Logger log)
    {
      tokenStore = service -> new TokenStore(session, service, log);
    }

    @Override
    public void filter(ClientRequestContext context) throws IOException
    {
      FeatureConfig config = new FeatureConfig(context.getConfiguration(), OAuth2Feature.class);
      String accessUri = config.read(Property.ACCESS_TOKEN_URI).orElse(DEFAULT_ACCESS_TOKEN_URI);
      if (Objects.equals(context.getUri().toASCIIString(), accessUri))
      { // already in token request: avoid stackOverflow
        return;
      }
      
      TokenStore store = tokenStore.apply(context.getUri().getHost());
      var token = store.getToken();
      if (token == null)
      {
        token = getNewAccessToken(context.getClient(), config, accessUri);
        store.setToken(token); // keep for following requests
      }
      
      String accessToken = (String) token.get("access_token");
      if (accessToken == null || accessToken.isBlank())
      {
        store.setToken(null);
        authError().withMessage("Failed to read 'access_token' from " + token).throwError();
      }
      if (!context.getHeaders().containsKey(AUTHORIZATION))
      {
        context.getHeaders().add(AUTHORIZATION, "Bearer " + accessToken);
      }
    }

    
    private static Map<String, Object> getNewAccessToken(Client client, FeatureConfig config, String accessUri)
    {
      Function<String, String> read = prop -> config.read(prop).orElseThrow(()->
        authError().withMessage("Missing property '" + prop + "' in RestClient.").build()
      );
      
      TokenRequest request = new TokenRequest(
        read.apply(Property.CLIENT_ID),
        read.apply(Property.USER_KEY)
      );
      
      GenericType<Map<String, Object>> map = new GenericType<>(Map.class);
      var response = client
        .target(accessUri)
        .request()
        .post(Entity.json(request));
      if (response.getStatusInfo().getFamily() == Family.SUCCESSFUL)
      {
        return response.readEntity(map);
      }
      throw authError()
        .withMessage("Failed to refresh accessToken:"+ response)
        .withAttribute("status", response.getStatus()).build();
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
  
  public static void analyzeAuth(Response response) throws BpmError
  {
    if (response.getStatus() == Status.FORBIDDEN.getStatusCode() ||
        response.getStatus() == Status.UNAUTHORIZED.getStatusCode())
    {
      authError().withAttribute("status", response.getStatus()).throwError();
    }
  }
  
  private static BpmPublicErrorBuilder authError()
  {
    return BpmError.create("uipath:login")
      .withAttribute("authUri", "https://platform.uipath.com/account/login");
  }

}
