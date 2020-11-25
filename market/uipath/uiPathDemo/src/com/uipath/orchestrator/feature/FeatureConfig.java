package com.uipath.orchestrator.feature;

import java.util.Optional;

import javax.ws.rs.core.Configuration;
import javax.ws.rs.core.Feature;

public class FeatureConfig
{
  private final Configuration config;
  private final Class<? extends Feature> feature;

  public FeatureConfig(Configuration config, Class<? extends Feature> feature)
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