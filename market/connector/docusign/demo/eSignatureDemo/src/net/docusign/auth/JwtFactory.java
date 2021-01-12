package net.docusign.auth;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.URI;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.EncodedKeySpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;

import org.apache.commons.io.IOUtils;

import ch.ivyteam.ivy.rest.client.FeatureConfig;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

/**
 * Builds a docuSign compliant JSON Web Token (JWT)
 * 
 * https://developers.docusign.com/platform/auth/jwt/jwt-get-token
 * @since 9.2.0
 */
public class JwtFactory
{
  private final FeatureConfig conf;

  public JwtFactory(FeatureConfig conf)
  {
    this.conf = conf;
  }
  
  public String createToken()
  {
    return build()
      .signWith(SignatureAlgorithm.RS256, getPrivateKey())
      .compact();
  }

  private JwtBuilder build()
  {
    URI authUri = URI.create(conf.readMandatory(OAuth2Feature.Property.AUTH_BASE_URI));
    return Jwts.builder()
      .setIssuer(conf.readMandatory(OAuth2Feature.Property.CLIENT_ID))
      .setSubject(conf.readMandatory(OAuth2Feature.Property.USER_ID))
      .setAudience(authUri.getHost())
      .claim("scope", OAuth2Feature.getScope(conf))
      .setIssuedAt(Date.from(Instant.now()))
      .setExpiration(Date.from(Instant.now().plus(1l, ChronoUnit.HOURS)))
      .setHeaderParam("typ", "JWT");
  }

  private static byte[] getKey()
  {
    try(InputStream is = JwtFactory.class.getResourceAsStream("sign-rew.pem");
        ByteArrayOutputStream os = new ByteArrayOutputStream())
    {
      IOUtils.copy(is, os);
      return os.toByteArray();
    }
    catch (IOException ex)
    {
      throw new RuntimeException("can not read key", ex);
    }
  }
  
  public static PrivateKey readPrivateKeyFromByteArray(byte[] rawPkcsKeyContent, String algorithm)
  {
    try
    {
      KeyFactory kf = KeyFactory.getInstance(algorithm);
      byte[] enyKey = readPemBody(rawPkcsKeyContent);
      EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(enyKey);
      return kf.generatePrivate(keySpec);
    }
    catch (NoSuchAlgorithmException | InvalidKeySpecException | IOException ex)
    {
      throw new RuntimeException("Failed to read private key", ex);
    }
  }

  private static byte[] readPemBody(byte[] privateKeyBytes) throws IOException
  {
    try(BufferedReader buffer = new BufferedReader(new StringReader(new String(privateKeyBytes))))
    {
      StringBuffer buf = new StringBuffer();
      String line = null;
      while ((line = buffer.readLine()) != null)
      {
        if (line.startsWith("-----"))
        {
          continue;
        }
        buf.append(line.trim());
      }
      return Base64.getDecoder().decode(buf.toString());
    }
  }
  
  private static PrivateKey getPrivateKey() 
  {
    return readPrivateKeyFromByteArray(getKey(), "RSA");
  }
}
