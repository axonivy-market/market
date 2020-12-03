package com.uipath.orchestrator.feature;

import java.util.Map;

import org.apache.log4j.Logger;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.security.ISession;

public class TokenStore
{
  private final ISession session;
  private final String service;
  private final Logger log;
  
  public static TokenStore get(String service)
  {
    return new TokenStore(Ivy.session(), service, Ivy.log());
  }
  
  public TokenStore(ISession session, String service, Logger log)
  {
    this.session = session;
    this.service = service;
    this.log = log;
  }

  public boolean hasToken()
  {
    return getToken() != null;
  }
  
  public void setToken(Map<String, Object> token)
  {
    log.debug("storing service-token for '"+service+"' on session '"+session+"' value: "+token);
    session.setAttribute(service, token);
  }
  
  public Map<String, Object> getToken()
  {
    @SuppressWarnings("unchecked")
    var token = (Map<String, Object>) session.getAttribute(service);
    log.debug("reading service-token for '"+service+"' on session '"+session+"' value: "+token);
    return token;
  }
  
}
