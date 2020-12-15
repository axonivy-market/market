package net.docusign.test;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.annotation.security.PermitAll;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.IOUtils;

import io.swagger.v3.oas.annotations.Hidden;

@Path("docuSignMock/restapi/v2.1/accounts/test-account-id")
@PermitAll
@Hidden
public class DocuSignServiceMock
{
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  @Path("envelopes")
  public String envelopes()
  {
    return load("json/envelopes.json");
  }
  
  private static String load(String path)
  {
    try(InputStream is = DocuSignServiceMock.class.getResourceAsStream(path))
    {
      return IOUtils.toString(is, StandardCharsets.UTF_8);
    }
    catch (IOException ex)
    {
      throw new RuntimeException("Failed to read resource: "+path);
    }
  }
}
