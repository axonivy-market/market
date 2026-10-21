package com.axonivy.market;

import static com.github.victools.jsonschema.module.javax.validation.JavaxValidationOption.INCLUDE_PATTERN_EXPRESSIONS;
import static com.github.victools.jsonschema.module.javax.validation.JavaxValidationOption.NOT_NULLABLE_FIELD_IS_REQUIRED;
import static com.networknt.schema.SpecificationVersion.DRAFT_2019_09;

import com.github.victools.jsonschema.generator.Option;
import com.github.victools.jsonschema.generator.OptionPreset;
import com.github.victools.jsonschema.generator.SchemaGenerator;
import com.github.victools.jsonschema.generator.SchemaGeneratorConfigBuilder;
import com.github.victools.jsonschema.generator.SchemaVersion;
import com.github.victools.jsonschema.module.jackson.JacksonSchemaModule;
import com.github.victools.jsonschema.module.javax.validation.JavaxValidationModule;
import com.networknt.schema.Schema;
import com.networknt.schema.SchemaRegistry;

import tools.jackson.databind.node.ObjectNode;

public class MetaSchemaFactory {

  public static ObjectNode metaJsonSchema() {
    var config = new SchemaGeneratorConfigBuilder(SchemaVersion.DRAFT_2019_09, OptionPreset.PLAIN_JSON)
      .with(Option.DEFINITIONS_FOR_ALL_OBJECTS)
      .with(new JacksonSchemaModule())
      .with(new JavaxValidationModule(INCLUDE_PATTERN_EXPRESSIONS, NOT_NULLABLE_FIELD_IS_REQUIRED))
      .with(new MarketModule())
      .build();
    return new SchemaGenerator(config).generateSchema(MarketMetaSchema.class);
  }

  public static Schema validator(ObjectNode schema) {
    return SchemaRegistry.withDefaultDialect(DRAFT_2019_09).getSchema(schema);
  }

}