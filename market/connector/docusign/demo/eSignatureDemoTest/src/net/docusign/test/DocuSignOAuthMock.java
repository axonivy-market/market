package net.docusign.test;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;

import javax.annotation.security.PermitAll;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import ch.ivyteam.ivy.application.IApplication;
import io.swagger.v3.oas.annotations.Hidden;

@Path("docuSignMock/oauth")
@PermitAll
@Hidden
public class DocuSignOAuthMock
{
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("auth")
  public Response authCode_1(@QueryParam("redirect_uri") String redirectUri)
  { // redirect
    URI bpmEngineContinue = UriBuilder.fromUri(URI.create(redirectUri))
      .queryParam("code", "my-test-code")
      .build();
    return Response.seeOther(bpmEngineContinue).build();
  }
  
  @POST
  @Produces(MediaType.APPLICATION_JSON)
  @Consumes(MediaType.APPLICATION_JSON)
  @Path("token")
  public String accessToken_2(String payload)
  {
    return load("json/token.json");
  }
  
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("userinfo")
  public String userInfo_3()
  {
    String info = load("json/userinfo.json");
    URI myUri = ch.ivyteam.ivy.request.EngineUriResolver.instance().local();
    info = StringUtils.replace(info, "http://localhost:!port!/mock", 
        myUri.toASCIIString()+"/"+IApplication.current().getName()+"/api/docuSignMock");
    return info;
  }
  
  private static String load(String path)
  {
    try(InputStream is = DocuSignOAuthMock.class.getResourceAsStream(path))
    {
      return IOUtils.toString(is, StandardCharsets.UTF_8);
    }
    catch (IOException ex)
    {
      throw new RuntimeException("Failed to read resource: "+path);
    }
  }
}
