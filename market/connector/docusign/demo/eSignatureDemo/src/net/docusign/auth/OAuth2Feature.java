package net.docusign.auth;

import java.util.function.Function;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import org.apache.commons.lang3.StringUtils;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.bpm.error.BpmPublicErrorBuilder;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.authentication.HttpBasicAuthenticationFeature;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2BearerFilter;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2TokenGet.AuthContext;
import ch.ivyteam.ivy.rest.client.oauth2.uri.OAuth2UriProperty;
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
    
    String CALLBACK = "AUTH.callback";
    String AUTH_BASE_URI = "AUTH.baseUri";
  }
  
  public static final String SESSION_TOKEN = "docu.sign.authCode";
  
  @Override
  public boolean configure(FeatureContext context)
  {
    var config = new FeatureConfig(context.getConfiguration(), OAuth2Feature.class);
    var docuSignUri = new OAuth2UriProperty(config, Property.AUTH_BASE_URI, "https://account-d.docusign.com/oauth");
    var oauth2 = new OAuth2BearerFilter(
      ctxt -> requestToken(ctxt, Ivy.session(), docuSignUri), 
      docuSignUri
    );
    context.register(oauth2, Priorities.AUTHORIZATION);
    context.register(new UserUriFilter(Ivy.session(), docuSignUri), Priorities.AUTHORIZATION+10);
    return true;
  }
  
  private static Response requestToken(AuthContext ctxt, ISession session, OAuth2UriProperty uriFactory)
  {
    String authCode = (String)session.getAttribute(SESSION_TOKEN);
    if (StringUtils.isBlank(authCode))
    {
      authError(ctxt.config, uriFactory)
        .withMessage("missing permission from user to act in his name.").throwError();
    }
    
    Function<String, String> read = prop -> ctxt.config.read(prop).orElseThrow(()->
      authError(ctxt.config, uriFactory)
        .withMessage("Missing property '" + prop + "' in RestClient.").build()
    );
    
    var authRequest = new DocuSignAuthRequest(authCode);
    
    var response = ctxt.target
      .register(HttpBasicAuthenticationFeature.basic(
        read.apply(Property.CLIENT_ID), 
        read.apply(Property.USER_KEY))
      )
      .request()
      .post(Entity.json(authRequest));
    return response;
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
  
  private static BpmPublicErrorBuilder authError(FeatureConfig config, OAuth2UriProperty uriFactory)
  {
    var uri = UriBuilder.fromUri(uriFactory.getUri("auth"))
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
