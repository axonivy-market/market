package com.microsoft.graph;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.annotation.security.PermitAll;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.io.IOUtils;

import io.swagger.v3.oas.annotations.Hidden;

@Path("graphAuthMock")
@PermitAll
@Hidden
public class GraphAuthMock
{
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("authorize")
  public Response auth()
  {
    return Response.status(301)
            .build();
  }
  
  @POST
  @Path("token")
  @Produces(MediaType.APPLICATION_JSON)
  @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
  public Response token()
  {
    return Response.status(200)
      .entity(load("json/accessToken.json"))
      .build();
  }
  
  private static String load(String path)
  {
    try(InputStream is = GraphAuthMock.class.getResourceAsStream(path))
    {
      return IOUtils.toString(is, StandardCharsets.UTF_8);
    }
    catch (IOException ex)
    {
      throw new RuntimeException("Failed to read resource: "+path);
    }
  }
}
