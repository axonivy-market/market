package net.docusign.auth;

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
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.Response.Status.Family;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.ext.Provider;

import org.apache.commons.lang3.StringUtils;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.bpm.error.BpmPublicErrorBuilder;
import ch.ivyteam.ivy.environment.Ivy;
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
    String CLIENT_ID = "AUTH.integrationKey";
    String USER_KEY = "AUTH.secretKey";
    
    String CALLBACK = "AUTH.callback";
    String AUTH_BASE_URI = "AUTH.oauthBaseUri";
  }
  
  public static final String SESSION_TOKEN = "docu.sign.authCode";
  
  public static interface DocuSignAuthUri
  {
    String DEV_BASE_URI = "https://account-d.docusign.com/oauth";
    
    public static String get(FeatureConfig config)
    {
      return config.read(Property.AUTH_BASE_URI).orElse(DEV_BASE_URI);
    }
  }
  
  @Override
  public boolean configure(FeatureContext context)
  {
    context.register(new AuthorizationFilter(Ivy.session(), Ivy.log()), Priorities.AUTHORIZATION);
    context.register(new UserUriFilter(Ivy.session()), Priorities.AUTHORIZATION+10);
    return true;
  }

  @Provider
  private static class AuthorizationFilter implements javax.ws.rs.client.ClientRequestFilter
  {
    private static final String AUTHORIZATION = "Authorization";

    private Function<String, TokenStore> tokenStore;
    private Function<String, String> sessionAttr;
    
    public AuthorizationFilter(ISession session, Logger log)
    {
      tokenStore = service -> new TokenStore(session, service, log);
      sessionAttr = name -> (String)session.getAttribute(name);
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
        String authCode = sessionAttr.apply(SESSION_TOKEN);
        if (StringUtils.isBlank(authCode))
        {
          authError(config).withMessage("missing permission from user to act in his name.").throwError();
        }
        
        token = getNewAccessToken(context.getClient(), config, authCode);
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

    private static Map<String, Object> getNewAccessToken(Client client, FeatureConfig config, String authToken)
    {
      Function<String, String> read = prop -> config.read(prop).orElseThrow(()->
        authError(config).withMessage("Missing property '" + prop + "' in RestClient.").build()
      );
      
      var authRequest = new DocuSignAuthRequest(authToken);
      
      GenericType<Map<String, Object>> map = new GenericType<>(Map.class);
      var response = client
        .target(DocuSignAuthUri.get(config)).path("token")
        .register(HttpBasicAuthenticationFeature.basic(
          read.apply(Property.CLIENT_ID), 
          read.apply(Property.USER_KEY))
        )
        .request()
        .post(Entity.json(authRequest));
      if (response.getStatusInfo().getFamily() == Family.SUCCESSFUL)
      {
        return response.readEntity(map);
      }
      throw authError(config)
        .withMessage("Failed to refresh accessToken:"+ response)
        .withAttribute("status", response.getStatus()).build();
    }
    
    @SuppressWarnings("unused")
    public static class DocuSignAuthRequest
    {
      public String grant_type;
      public String code;
      
      public DocuSignAuthRequest(String code)
      {
        this.grant_type = "authorization_code";
        this.code = code;
      }
    }
    
    private static BpmPublicErrorBuilder authError(FeatureConfig config)
    {
      var uri = UriBuilder.fromUri(DocuSignAuthUri.get(config)).path("auth")
        .queryParam("response_type", "code")
        .queryParam("scope", "signature impersonation")
        .queryParam("client_id", config.readMandatory(Property.CLIENT_ID))
        .queryParam("redirect_uri", config.readMandatory(Property.CALLBACK))
        .build();
      Ivy.log().debug("created oauth URI: "+uri);
      
      return BpmError.create("docusign:login")
        .withAttribute("authUri", uri);
    }
  }
  
  public static void analyzeAuth(Response response) throws BpmError
  {
    if (response.getStatus() == Status.FORBIDDEN.getStatusCode() ||
        response.getStatus() == Status.UNAUTHORIZED.getStatusCode())
    {
      AuthorizationFilter.authError(null)
        .withAttribute("status", response.getStatus()).throwError();
    }
  }
  
  public static boolean isAuthRequest(FeatureConfig config, URI target)
  {
    return StringUtils.startsWith(target.toASCIIString(), DocuSignAuthUri.get(config));
  }
}
