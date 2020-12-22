package com.uipath.orchestrator.feature;

import java.util.function.Function;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.bpm.error.BpmPublicErrorBuilder;
import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2BearerFilter;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2TokenGet.AuthContext;
import ch.ivyteam.ivy.rest.client.oauth2.uri.OAuth2UriProperty;


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
    
    String AUTH_BASE_URI = "AUTH.baseUri";
  }
  
  @Override
  public boolean configure(FeatureContext context)
  {
    var config = new FeatureConfig(context.getConfiguration(), OAuth2Feature.class);
    var oauth2 = new OAuth2BearerFilter(
      OAuth2Feature::requestToken, 
      new OAuth2UriProperty(config, Property.AUTH_BASE_URI, "https://account.uipath.com/oauth")
    );
    context.register(oauth2, Priorities.AUTHORIZATION);
    return true;
  }
  
  private static Response requestToken(AuthContext ctxt)
  {
    Function<String, String> read = prop -> ctxt.config.read(prop).orElseThrow(()->
      authError().withMessage("Missing property '" + prop + "' in RestClient.").build()
    );
  
    TokenRequest request = new TokenRequest(
      read.apply(Property.CLIENT_ID),
      read.apply(Property.USER_KEY)
    );
    
    var response = ctxt.target
      .request()
      .post(Entity.json(request));
    return response;
  }
  
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
