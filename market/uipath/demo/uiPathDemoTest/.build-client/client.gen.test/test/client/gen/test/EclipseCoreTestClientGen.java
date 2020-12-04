package client.gen.test;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.jaxrs.client.openapi.codegen.OpenApiClientJarGenerator;

public class EclipseCoreTestClientGen
{
  @Test
  public void createClient() throws IOException
  {
    URI openApi = URI.create(property("openapi.url"));
    System.out.println("creating client for "+openApi);
    
    var generator = new OpenApiClientJarGenerator(openApi);
    generator.setModelPackage(property("openapi.namespace"));
    
    Path outDir = Path.of(property("openapi.build"));
    Files.createDirectories(outDir);
	generator.setClientBuildDir(outDir);
	
    Path clientJar = generator.createJar(new SystemOutProgressMonitor());
    Path builtJar = Path.of(property("openapi.jar"));
    Files.createDirectories(builtJar.getParent());
    Files.move(clientJar, builtJar, StandardCopyOption.REPLACE_EXISTING);
    System.out.println(builtJar);
  }

  private static String property(String key)
  {
    String url = System.getProperty(key);
    if (url == null)
    {
      throw new IllegalStateException("mandatory property '"+key+"' is missing.");
    }
    return url;
  }
}
