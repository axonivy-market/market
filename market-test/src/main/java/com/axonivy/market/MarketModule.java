package com.axonivy.market;

import io.github.axonivy.json.schema.ExpressiveSchemaModule;

public class MarketModule extends ExpressiveSchemaModule {

  public MarketModule() {
    super(ExpressiveSchemaOption.USE_ADDITIONAL_PROPERTIES_ANNOTATION); // wrapper; that works in pom invocatoin
  }

}
