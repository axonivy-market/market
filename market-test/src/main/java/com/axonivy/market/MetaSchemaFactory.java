package com.axonivy.market;

import static com.github.victools.jsonschema.module.javax.validation.JavaxValidationOption.INCLUDE_PATTERN_EXPRESSIONS;
import static com.github.victools.jsonschema.module.javax.validation.JavaxValidationOption.NOT_NULLABLE_FIELD_IS_REQUIRED;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.github.victools.jsonschema.generator.Option;
import com.github.victools.jsonschema.generator.OptionPreset;
import com.github.victools.jsonschema.generator.SchemaGenerator;
import com.github.victools.jsonschema.generator.SchemaGeneratorConfigBuilder;
import com.github.victools.jsonschema.generator.SchemaVersion;
import com.github.victools.jsonschema.module.jackson.JacksonModule;
import com.github.victools.jsonschema.module.javax.validation.JavaxValidationModule;
import com.networknt.schema.JsonSchema;
import com.networknt.schema.JsonSchemaFactory;
import com.networknt.schema.SpecVersion.VersionFlag;

public class MetaSchemaFactory {

  public static ObjectNode metaJsonSchema() {
    var config = new SchemaGeneratorConfigBuilder(SchemaVersion.DRAFT_2019_09, OptionPreset.PLAIN_JSON)
      .with(Option.DEFINITIONS_FOR_ALL_OBJECTS)
      .with(new JacksonModule())
      .with(new JavaxValidationModule(INCLUDE_PATTERN_EXPRESSIONS, NOT_NULLABLE_FIELD_IS_REQUIRED))
      .with(new MarketModule())
      .build();
    return new SchemaGenerator(config).generateSchema(MarketMetaSchema.class);
  }

  public static JsonSchema validator(ObjectNode schema) {
    return JsonSchemaFactory.getInstance(VersionFlag.V201909).getSchema(schema);
  }

}