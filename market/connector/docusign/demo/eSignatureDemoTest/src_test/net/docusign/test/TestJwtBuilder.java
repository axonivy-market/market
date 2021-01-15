package net.docusign.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.security.PrivateKey;
import java.util.Properties;

import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.oauth2.uri.OAuth2UriProperty;
import net.docusign.auth.JwtFactory;
import net.docusign.auth.OAuth2Feature.Property;

public class TestJwtBuilder
{
  @Test
  void build() throws URISyntaxException
  {
    Path testKeyFile = Path.of(TestJwtBuilder.class.getResource("testKey.pem").toURI());
    Properties p = new Properties();
    p.setProperty(Property.AUTH_BASE_URI, "https://account-d.docusign.com/oauth");
    p.setProperty(Property.CLIENT_ID, "24adbf4f-");
    p.setProperty(Property.SYSTEM_USER_ID, "ee1e53b6-");
    p.setProperty(Property.SYSTEM_KEY_FILE, testKeyFile.toAbsolutePath().toString());
    p.setProperty(Property.SCOPE, "signature impersonation");
    FeatureConfig config = new FeatureConfig(key -> p.getProperty(key), TestJwtBuilder.class);
    
    var docuSignUri = new OAuth2UriProperty(config, Property.AUTH_BASE_URI, "https://account-d.docusign.com/oauth");
    docuSignUri.setResolveIvyUriTemplates(false);
    String jwtToken = new JwtFactory(config, docuSignUri).createToken();
    assertThat(jwtToken).isNotNull();
    System.out.println(jwtToken);
  }
  
  @Test
  void pemRead() throws IOException
  {
    // generator:
    // ssh-keygen -t rsa -b 2048 -m PKCS8 -f testKey.pem
    byte[] raw = read("testKey.pem");
    PrivateKey secret = JwtFactory.readPrivateKeyFromByteArray(raw, "RSA");
    assertThat(secret.getEncoded()).startsWith(48,-126);
  }
  
  private static byte[] read(String resource) throws IOException
  {
    try(InputStream is = TestJwtBuilder.class.getResourceAsStream(resource);
        ByteArrayOutputStream bos = new ByteArrayOutputStream())
    {
      IOUtils.copy(is, bos);
      return bos.toByteArray();
    }
  }
  
  @Test
  void pemReadKeyFile() throws URISyntaxException
  {
    Path testKeyFile = Path.of(TestJwtBuilder.class.getResource("testKey.pem").toURI());
    byte[] raw = JwtFactory.getKey(testKeyFile);
    PrivateKey secret = JwtFactory.readPrivateKeyFromByteArray(raw, "RSA");
    assertThat(secret.getEncoded()).startsWith(48,-126);
  }
}
