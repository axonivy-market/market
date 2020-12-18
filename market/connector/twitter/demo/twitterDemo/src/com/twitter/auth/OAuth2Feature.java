package com.twitter.auth;

import java.io.IOException;
import java.net.URI;
import java.util.Map;
import java.util.function.Function;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientRequestContext;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response.Status.Family;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.ext.Provider;

import org.apache.commons.lang3.StringUtils;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.bpm.error.BpmPublicErrorBuilder;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.request.EngineUriResolver;
import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.authentication.HttpBasicAuthenticationFeature;
import ch.ivyteam.ivy.security.ISession;
import ch.ivyteam.log.Logger;


/**
 * @since 9.2
 */
public class OAuth2Feature implements Feature
{
  public static interface Property
  {
    String CLIENT_ID = "API.key";
    String USER_KEY = "API.secretKey";
    String AUTH_BASE_URI = "AUTH.baseUri";
  }
  
  public static interface TwitterAuthUri
  {
    String BASE_URI = "https://api.twitter.com/oauth2";
    
    public static URI get(FeatureConfig config)
    {
      URI external = EngineUriResolver.instance().external();
      return UriBuilder.fromUri(config.read(Property.AUTH_BASE_URI).orElse(BASE_URI))
        .resolveTemplate("ivy.engine.host", external.getHost())
        .resolveTemplate("ivy.engine.http.port", external.getPort())
        .resolveTemplate("ivy.request.application", IApplication.current().getName())
        .build();
    }
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

    private Function<String, TokenStore> tokenStore;
    
    public AuthorizationFilter(ISession session, Logger log)
    {
      tokenStore = service -> new TokenStore(session, service, log);
    }

    @Override
    public void filter(ClientRequestContext context) throws IOException
    {
      FeatureConfig config = new FeatureConfig(context.getConfiguration(), OAuth2Feature.class);
      if (isAuthRequest(config, context.getUri()))
      { // already in token request: avoid stackOverflow
        return;
      }
      
      TokenStore store = tokenStore.apply(context.getUri().getHost());
      var token = store.getToken();
      if (token == null)
      {
        token = getNewAccessToken(context.getClient(), config);
        store.setToken(token); // keep for following requests
      }
      
      String accessToken = (String) token.get("access_token");
      if (accessToken == null || accessToken.isBlank())
      {
        store.setToken(null);
        authError(config).withMessage("Failed to read 'access_token' from " + token).throwError();
      }
      
      if (!context.getHeaders().containsKey(AUTHORIZATION))
      {
        context.getHeaders().add(AUTHORIZATION, "Bearer " + accessToken);
      }
    }

    private static Map<String, Object> getNewAccessToken(Client client, FeatureConfig config)
    {
      GenericType<Map<String, Object>> map = new GenericType<>(Map.class);
      Form f = new Form();
      f.param("grant_type", "client_credentials");
      var response = client
        .target(TwitterAuthUri.get(config)).path("token")
        .register(HttpBasicAuthenticationFeature.basic(
          config.readMandatory(Property.CLIENT_ID), 
          config.readMandatory(Property.USER_KEY))
        )
        .request()
        .post(Entity.form(f));
      if (response.getStatusInfo().getFamily() == Family.SUCCESSFUL)
      {
        return response.readEntity(map);
      }
      throw authError(config)
        .withMessage("Failed to refresh accessToken:"+ response)
        .withAttribute("status", response.getStatus()).build();
    }
    
    private static BpmPublicErrorBuilder authError(@SuppressWarnings("unused") FeatureConfig config)
    {
      return BpmError.create("twitter:login")
        .withAttribute("authUri", "https://developer.twitter.com/en/portal/register/keys");
    }
  }
  
  public static boolean isAuthRequest(FeatureConfig config, URI target)
  {
    return StringUtils.startsWith(target.toASCIIString(), TwitterAuthUri.get(config).toASCIIString());
  }
}
