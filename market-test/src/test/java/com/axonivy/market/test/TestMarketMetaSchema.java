package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.InputStream;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.networknt.schema.JsonSchema;
import com.networknt.schema.ValidationMessage;

class TestMarketMetaSchema {

  private static final ObjectMapper MAPPER = new ObjectMapper();

  @Test
  void validatesRealWorldModel() {
    ObjectNode schema = MetaSchemaFactory.metaJsonSchema();
    JsonSchema validator = MetaSchemaFactory.validator(schema);

    var meta = load("jira.meta.json");

    assertThat(validator.validate(meta))
      .as("schema is strictly validated")
      .isEmpty();
  }

  @Test
  void nonNull() {
    ObjectNode schema = MetaSchemaFactory.metaJsonSchema();
    JsonSchema validator = MetaSchemaFactory.validator(schema);
    ObjectNode impl = JsonNodeFactory.instance.objectNode();

    List<String> messages = validator.validate(impl)
      .stream().map(ValidationMessage::getMessage).toList();
    assertThat(messages)
      .as("schema is strictly validated")
      .isNotEmpty();
    assertThat(messages.toString())
      .contains("id: is missing but it is required");
  }

  @Test
  void lengthConstraints() {
    ObjectNode schema = MetaSchemaFactory.metaJsonSchema();
    JsonSchema validator = MetaSchemaFactory.validator(schema);
    ObjectNode impl = JsonNodeFactory.instance.objectNode();
    impl.put("id", "mini"); // too short

    List<String> messages = validator.validate(impl)
      .stream().map(ValidationMessage::getMessage).toList();
    assertThat(messages)
      .as("schema is strictly validated")
      .isNotEmpty();
    assertThat(messages.toString())
      .contains("id: must be at least 5 characters");
  }

  private JsonNode load(String resource) {
    try(InputStream json = TestMarketMetaSchema.class.getResourceAsStream(resource)) {
      return MAPPER.readValue(json, JsonNode.class);
    } catch (Exception ex) {
      throw new RuntimeException("Failed to parse "+resource, ex);
    }
  }

}
