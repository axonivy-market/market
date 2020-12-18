package com.twitter.test;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.annotation.security.PermitAll;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.IOUtils;

@Path("twitterMock")
@PermitAll
public class TwitterMock
{
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("2/users/by/username/{name}")
  public String users(@PathParam("name") String name)
  {
    return load("json/user.json");
  }
  
  
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("2/tweets/search/recent")
  public String recent(@QueryParam("query") String query)
  {
    return load("json/tweets.json");
  }
  
  private static String load(String path)
  {
    try(InputStream is = TwitterMock.class.getResourceAsStream(path))
    {
      return IOUtils.toString(is, StandardCharsets.UTF_8);
    }
    catch (IOException ex)
    {
      throw new RuntimeException("Failed to read resource: "+path);
    }
  }
}
