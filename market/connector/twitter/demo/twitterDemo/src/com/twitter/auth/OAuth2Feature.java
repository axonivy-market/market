package com.twitter.auth;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.Response;

import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.authentication.HttpBasicAuthenticationFeature;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2BearerFilter;
import ch.ivyteam.ivy.rest.client.oauth2.OAuth2TokenRequester.AuthContext;
import ch.ivyteam.ivy.rest.client.oauth2.uri.OAuth2UriProperty;

public class OAuth2Feature implements Feature
{
  public static interface Property
  {
    String CLIENT_ID = "API.key";
    String USER_KEY = "API.secretKey";
    String AUTH_BASE_URI = "AUTH.baseUri";
  }
  
  @Override
  public boolean configure(FeatureContext context)
  {
    var config = new FeatureConfig(context.getConfiguration(), OAuth2Feature.class);
    var oauth2 = new OAuth2BearerFilter(
      OAuth2Feature::requestToken, 
      new OAuth2UriProperty(config, Property.AUTH_BASE_URI, "https://api.twitter.com/oauth2")
    );
    context.register(oauth2, Priorities.AUTHORIZATION);
    return true;
  }
  
  private static Response requestToken(AuthContext ctxt)
  {
    Form authForm = new Form("grant_type", "client_credentials");
    var response = ctxt.target
      .register(HttpBasicAuthenticationFeature.basic(
         ctxt.config.readMandatory(Property.CLIENT_ID), 
         ctxt.config.readMandatory(Property.USER_KEY))
      )
      .request()
      .post(Entity.form(authForm));
    return response;
  }
}
