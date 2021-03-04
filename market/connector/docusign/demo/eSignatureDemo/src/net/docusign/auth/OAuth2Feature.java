package net.docusign.auth;

import java.net.URI;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import ch.ivyteam.ivy.bpm.error.BpmPublicErrorBuilder;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.authentication.HttpBasicAuthenticationFeature;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2BearerFilter;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2RedirectErrorBuilder;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2TokenRequester.AuthContext;
import ch.ivyteam.ivy.rest.client.oauth2.uri.OAuth2CallbackUriBuilder;
import ch.ivyteam.ivy.rest.client.oauth2.uri.OAuth2UriProperty;
import ch.ivyteam.ivy.security.ISecurityConstants;
import ch.ivyteam.ivy.security.ISession;

/**
 * @since 9.2
 */
public class OAuth2Feature implements Feature
{
  public static interface Property
  {
    String CLIENT_ID = "AUTH.integrationKey";
    String USER_KEY = "AUTH.secretKey";
    String SCOPE = "AUTH.scope";
    
    String SYSTEM_USER_ID = "AUTH.systemUserId";
    String SYSTEM_KEY_FILE = "AUTH.systemKeyFile";
    
    String AUTH_BASE_URI = "AUTH.baseUri";
  }
  
  public static final String SESSION_TOKEN = "docu.sign.authCode";
  
  @Override
  public boolean configure(FeatureContext context)
  {
    var config = new FeatureConfig(context.getConfiguration(), OAuth2Feature.class);
    var docuSignUri = new OAuth2UriProperty(config, Property.AUTH_BASE_URI, "https://account-d.docusign.com/oauth");
    var oauth2 = new OAuth2BearerFilter(
      ctxt -> requestToken(ctxt, docuSignUri), 
      docuSignUri
    );
    context.register(oauth2, Priorities.AUTHORIZATION);
    context.register(new UserUriFilter(ISession.current(), docuSignUri), Priorities.AUTHORIZATION+10);
    return true;
  }
  
  private static Response requestToken(AuthContext ctxt, OAuth2UriProperty uriFactory)
  {
    ISession current = ISession.current();
    if (current.getIdentifier() == ISecurityConstants.SYSTEM_USER_SESSION_ID)
    {
      return jwtGrantToken(ctxt, uriFactory);
    }
    return webUserGrantToken(ctxt, uriFactory);
  }

  private static Response webUserGrantToken(AuthContext ctxt, OAuth2UriProperty uriFactory)
  {
    var authCode = ctxt.authCode();
    if (authCode.isEmpty())
    {
      authRedirectError(ctxt.config, uriFactory).throwError();
    }
    
    var clientId = ctxt.config.readMandatory(Property.CLIENT_ID);
    var userKey = ctxt.config.readMandatory(Property.USER_KEY); 
    var basicAuth = HttpBasicAuthenticationFeature.basic(clientId, userKey); 
    var authRequest = new DocuSignAuthRequest(authCode.get());
    
    var response = ctxt.target
        .register(basicAuth)
        .request()
        .post(Entity.json(authRequest));
    return response;
  }
  
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
  
  private static BpmPublicErrorBuilder authRedirectError(FeatureConfig config, OAuth2UriProperty uriFactory)
  {
    URI redirectUri = OAuth2CallbackUriBuilder.create().toUri();
    var uri = UriBuilder.fromUri(uriFactory.getUri("auth"))
        .queryParam("response_type", "code")
        .queryParam("scope", getScope(config))
        .queryParam("client_id", config.readMandatory(Property.CLIENT_ID))
        .queryParam("redirect_uri", redirectUri)
        .build();
    Ivy.log().debug("created oauth URI: "+uri);
    
    return OAuth2RedirectErrorBuilder
        .create(uri)
        .withMessage("Missing permission from user to act in his name.");
  }

  private static Response jwtGrantToken(AuthContext ctxt, OAuth2UriProperty uriFactory)
  {
    String token = new JwtFactory(ctxt.config, uriFactory).createToken();
    var authRequest = new DocuSignJwtRequest(token);
    var response = ctxt.target
        .request()
        .post(Entity.json(authRequest));
    return response;
  }

  public static class DocuSignJwtRequest
  {
    public String grant_type;
    public String assertion;
    
    public DocuSignJwtRequest(String jwtToken)
    {
      this.grant_type = "urn:ietf:params:oauth:grant-type:jwt-bearer";
      this.assertion = jwtToken;
    }
  }

  static String getScope(FeatureConfig config)
  {
    return config.read(Property.SCOPE).orElse("signature impersonation");
  }

}
