package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpClient.Redirect;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse.BodyHandlers;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import javax.imageio.ImageIO;

import org.junit.jupiter.api.Test;

import com.axonivy.market.MetaSchemaFactory;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.networknt.schema.JsonSchema;
import com.networknt.schema.ValidationMessage;

class ValidateRepoTest
{
  private static final ObjectMapper MAPPER = new ObjectMapper();

  @Test
  void everyProductHasAValidMetaJson_schemaDriven()
  {
    assertThat(productDirs()).allSatisfy(path -> assertValidMetaJsonSchema(path));
  }

  private void assertValidMetaJsonSchema(Path path)
  {
    var metaPath = path.resolve("meta.json");
    var metaImpl = load(metaPath);
    ObjectNode rawSchema = MetaSchemaFactory.metaJsonSchema();
    JsonSchema metaSchema = MetaSchemaFactory.validator(rawSchema);
    List<String> messages = metaSchema.validate(metaImpl).stream().map(ValidationMessage::getMessage).toList();
    assertThat(messages).as("meta.json must be valid for product "+path).isEmpty();
  }

  private JsonNode load(Path metaPath) {
    try {
      return MAPPER.readTree(metaPath.toFile());
    } catch (IOException ex) {
      throw new RuntimeException(ex);
    }
  }

  @Test
  void everyProductHasAValidMetaJson()
  {
    assertThat(productDirs()).allSatisfy(path -> assertValidMetaJson(path));
  }

  private void assertValidMetaJson(Path path)
  {
    var metaPath = path.resolve("meta.json");
    var json = load(metaPath);

    if (json.has("vendor")) {
      assertThat(json.has("vendorUrl")).as("if vendor is specified vendorUrl must be also specified").isTrue();
      assertThat(json.has("vendorImage")).as("if vendor is specified vendorImage must be also specified").isTrue();
    }
    if (json.has("vendorUrl")) {
      var vendorUrl = json.get("vendorUrl").asText();
      assertThat(checkUriExists(vendorUrl)).as("vendor url is not reachable " + vendorUrl).isTrue();
    }
    if (json.has("vendorImage")) {
      var image = json.get("vendorImage").asText();
      var vendorImage = path.resolve(image);
      assertThat(vendorImage).exists();
    }
    if (json.has("vendorImageDarkMode")) {
      var image = json.get("vendorImageDarkMode").asText();
      var vendorImageDarkMode = path.resolve(image);
      assertThat(vendorImageDarkMode).exists();
    }

    if (json.has("mavenArtifacts"))
    {
      var array = json.get("mavenArtifacts");
      array.forEach(mavenArtifact -> {
        var groupId = mavenArtifact.get("groupId").asText();
        var artifactId = mavenArtifact.get("artifactId").asText();
        var repoUrl = "https://maven.axonivy.com";
        if (mavenArtifact.has("repoUrl"))
        {
          repoUrl = mavenArtifact.get("repoUrl").asText();
        }
        checkArtifact(repoUrl, groupId, artifactId);
      });
    }
  }

  private boolean checkUriExists(String uri) {
    try {
      var client = HttpClient.newBuilder()
              .followRedirects(Redirect.NORMAL)
              .build();
      var request = HttpRequest.newBuilder(URI.create(uri)).build();
      var response = client.send(request, BodyHandlers.discarding());
      return response.statusCode() == 200;
    } catch (Exception ex) {
      return false;
    }
  }

  @Test
  void everyProductHasAValidProductJsonIfExists()
  {
    assertThat(productDirs()).allSatisfy(path -> assertValidProductJson(path));
  }

  private void assertValidProductJson(Path path)
  {
    var metaPath = path.resolve("meta.json");
    if (!Files.exists(metaPath)) {
      System.out.println("skipping "+metaPath);
      return;
    }

    var json = load(metaPath);
    if (json.has("installers"))
    {
      var installers = json.get("installers");
      installers.forEach(installer -> {
        if (installer.has("..."))
        {
          String include = installer.get("...").asText();
          include = include.substring(1, include.length()-1);
          installer = load(path.resolve(include));
        }
        var id = installer.get("id").asText();
        if ("maven-dependency".equals(id))
        {
          checkMavenArtifactsOfInstaller(installer, "dependencies");
        }
        if ("maven-import".equals(id))
        {
          checkMavenArtifactsOfInstaller(installer, "projects");
        }
      });
    }
  }

  private void checkMavenArtifactsOfInstaller(JsonNode installer, String depsId)
  {
    var data = installer.get("data");
    var deps = data.get(depsId);

    var repoUrl = "https://repo1.maven.org/maven2";
    if (data.has("repositories"))
    {
      var repos = data.get("repositories");
      repoUrl = repos.get(0).get("url").asText();
    }

    var uri = repoUrl;
    deps.forEach(dep -> {
      var groupId = dep.get("groupId").asText();
      var artifactId = dep.get("artifactId").asText();
      checkArtifact(uri, groupId, artifactId);
    });
  }

  private void checkArtifact(String repoBaseUri, String groupId, String artifactId)
  {
    var uri = repoBaseUri + "/" + groupId.replace(".", "/") + "/" + artifactId + "/" + "maven-metadata.xml";
    try
    {
      var client = HttpClient.newBuilder()
              .followRedirects(Redirect.NORMAL)
              .build();
      var request = HttpRequest.newBuilder(URI.create(uri)).build();
      var response = client.send(request, BodyHandlers.discarding());
      assertThat(response.statusCode()).as("maven artifact seems to not exist " + uri).isEqualTo(200);
    }
    catch (Exception ex)
    {
      throw new RuntimeException("could not send a request to " + uri, ex);
    }
  }

  @Test
  void everyProductHasAMetaJson()
  {
    assertThat(productDirs())
            .extracting(path -> path.resolve("meta.json"))
            .allSatisfy(path -> assertThat(path).exists());
  }

  @Test
  void everyProductHasAUniqueId()
  {
    var ids = productDirs().stream()
            .map(dir -> dir.resolve("meta.json"))
            .map(json -> load(json))
            .map(json -> json.get("id").asText())
            .collect(Collectors.toList());

    var uniqueIds = new HashSet<>(ids);
    assertThat(uniqueIds).as("every product must have a unique ID").hasSameSizeAs(ids);
  }

  @Test
  void everyProductHasALogo()
  {
    var logo = "logo.png";
    assertThat(productDirs())
            .extracting(path -> path.resolve(logo))
            .allSatisfy(path -> assertThat(path).exists());

    assertThat(productDirs())
      .extracting(path -> path.resolve(logo))
      .allSatisfy(path -> assertSquareImage(path));
  }

  private static void assertSquareImage(Path path)
  {
    try
    {
      var image = ImageIO.read(path.toFile());
      assertThat(image.getWidth())
        .as("image " + path + " must have same height & width")
        .isEqualTo(image.getHeight());
    }
    catch (IOException ex)
    {
      throw new RuntimeException(ex);
    }
  }

  @Test
  void products()
  {
    assertThat(productDirs())
            .extracting(path -> path.getName(path.getNameCount() - 1).toString())
            .as("ensure that productDirs finds something")
            .contains("doc-factory", "portal");
  }

  private static List<Path> productDirs()
  {
    try
    {
      var marketRoot = marketRoot();
      return Files.walk(marketRoot, 1)
              .filter(Files::isDirectory)
              .filter(path -> !path.equals(marketRoot))
              .collect(Collectors.toList());
    }
    catch (IOException ex)
    {
      throw new RuntimeException(ex);
    }
  }

  private static Path marketRoot()
  {
    return Paths.get("target/market");
  }
}
