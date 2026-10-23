package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.InputStream;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.axonivy.market.MetaSchemaFactory;
import com.networknt.schema.Schema;
import com.networknt.schema.Error;

import tools.jackson.databind.JsonNode;
import tools.jackson.databind.ObjectMapper;
import tools.jackson.databind.node.JsonNodeFactory;
import tools.jackson.databind.node.ObjectNode;

class TestMarketMetaSchema {

  private static final ObjectMapper MAPPER = new ObjectMapper();

  ObjectNode schema = MetaSchemaFactory.metaJsonSchema();
  Schema validator = MetaSchemaFactory.validator(schema);

  @Test
  void validatesRealWorldModel() {
    var meta = load("jira.meta.json");

    assertThat(validator.validate(meta))
      .as("schema is strictly validated")
      .isEmpty();
  }

  @Test
  void nonNull() {
    ObjectNode impl = JsonNodeFactory.instance.objectNode();

    List<String> messages = validator.validate(impl)
      .stream().map(com.networknt.schema.Error::getMessage).toList();
    assertThat(messages)
      .as("schema is strictly validated")
      .isNotEmpty();
    assertThat(messages.toString())
      .contains("required property 'id' not found");
  }

  @Test
  void lengthConstraints() {
    ObjectNode impl = JsonNodeFactory.instance.objectNode();
    impl.put("id", "mini"); // too short
    assertMessage(impl, "must be at least 5 characters long");
  }

  @Test
  void maximumLengthIdConstraints() {
    ObjectNode impl = JsonNodeFactory.instance.objectNode();
    impl.put("id", "azure-servicebus-product-connector"); // too long
    assertMessage(impl, "must be at most 30 characters long");
  }

  @Test
  void validLengthOfIdConstraints() {
    ObjectNode impl = JsonNodeFactory.instance.objectNode();
    impl.put("id", "azure-servicebus-connector"); // too long
    List<String> messages = validator.validate(impl).stream().map(Error::getMessage).toList();
    assertThat(messages.toString()).doesNotContain("id: may only be 30 characters long");
    assertThat(messages.toString()).doesNotContain("id: must be at least 5 characters");
  }

  @Test
  void examplified() {
    JsonNode sourceUrl = schema.get("properties").get("sourceUrl");
    assertThat(sourceUrl.get("examples").toPrettyString())
      .contains("github.com");
  }
  
  private void assertMessage(ObjectNode node, String neededContentMessage) {
    List<String> messages = validator.validate(node).stream().map(Error::getMessage).toList();
    assertThat(messages).as("schema is strictly validated").isNotEmpty();
    assertThat(messages.toString()).contains(neededContentMessage);
  }

  private JsonNode load(String resource) {
    try(InputStream json = TestMarketMetaSchema.class.getResourceAsStream(resource)) {
      return MAPPER.readValue(json, JsonNode.class);
    } catch (Exception ex) {
      throw new RuntimeException("Failed to parse "+resource, ex);
    }
  }

}
