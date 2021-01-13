package net.docusign.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.security.PrivateKey;
import java.util.Properties;

import javax.ws.rs.core.Configuration;

import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.rest.client.FeatureConfig;
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
    FeatureConfig config = new FeatureConfig(configMock(p), TestJwtBuilder.class);
    
    String jwtToken = new JwtFactory(config).createToken();
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

  private static Configuration configMock(Properties props)
  {
    Configuration proxyElement = (Configuration) Proxy.newProxyInstance(Configuration.class.getClassLoader(), 
    new Class[]{Configuration.class}, 
    new InvocationHandler()
    {
      @Override
      public Object invoke(Object proxy, Method method, Object[] args) throws Throwable
      {
        return props.getProperty((String) args[0]);
      }
    });
    return proxyElement;
  }
}
