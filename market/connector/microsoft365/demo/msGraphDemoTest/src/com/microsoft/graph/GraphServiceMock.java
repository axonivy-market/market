package com.microsoft.graph;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.annotation.security.PermitAll;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.io.IOUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.common.base.Objects;

import ch.ivyteam.ivy.bpm.error.BpmError;
import io.swagger.v3.oas.annotations.Hidden;

@Path("graphMock")
@PermitAll
@Hidden
public class GraphServiceMock
{
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("me")
  public String me()
  {
    return load("json/me.json");
  }
  
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("me/messages")
  public String messages()
  {
    return load("json/messages.json");
  }
  
  @GET
  @Path("users/{user-id}/calendar/calendarView")
  @Produces(MediaType.APPLICATION_JSON)
  public Response createEnvelope(
    @PathParam("user-id") String userId,
    @QueryParam("startDateTime") String start, 
    @QueryParam("endDateTime") String end)
  {
    return Response.status(200)
      .entity(load("json/calendarView.json"))
      .build();
  }
  
  @POST
  @Path("me/microsoft.graph.sendMail")
  @Consumes(MediaType.APPLICATION_JSON)
  public Response sendMail(JsonNode json)
  {
    String mailSubject = json.get("Message").get("subject").asText();
    String expect = "Meet for Lunch?";
    if (!Objects.equal(mailSubject, expect))
    {
      BpmError.create("test:assertion")
      .withAttribute("expected", "subject:"+mailSubject+" \n:toBe:"+expect)
      .throwError();
    }
    return Response.status(202).build();
  }
  
  public static JsonNode lastMessage;
  
  private static String load(String path)
  {
    try(InputStream is = GraphServiceMock.class.getResourceAsStream(path))
    {
      return IOUtils.toString(is, StandardCharsets.UTF_8);
    }
    catch (IOException ex)
    {
      throw new RuntimeException("Failed to read resource: "+path);
    }
  }
}
