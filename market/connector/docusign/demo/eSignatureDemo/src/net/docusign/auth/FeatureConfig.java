package net.docusign.auth;

import java.util.Optional;

import javax.ws.rs.core.Configuration;

public class FeatureConfig
{
  private final Configuration config;
  private final Class<?> feature;

  public FeatureConfig(Configuration config, Class<?> feature)
  {
    this.config = config;
    this.feature = feature;
  }
  
  public String readMandatory(String key)
  {
    return read(key).orElseThrow(()->
      new IllegalStateException("Missing property '" + key + "' for " + feature.getName() + ".")
    );
  }
  
  public Optional<String> read(String key)
  {
    Object value = config.getProperty(key);
    if (value instanceof String)
    {
      return Optional.of((String) value)
        .filter(val -> !val.isBlank());
    }
    return Optional.empty();
  }
}