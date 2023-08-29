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

import org.json.JSONObject;
import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.networknt.schema.JsonSchema;
import com.networknt.schema.JsonSchemaFactory;
import com.networknt.schema.SpecVersion.VersionFlag;
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
    URI metaSchemaUri = URI.create("https://jenkins.ivyteam.io/job/core_json-schema/job/cc23.marketSchema/lastSuccessfulBuild/artifact/workspace/ch.ivyteam.ivy.market.schema/target/schema/market/0.0.1/meta.json");
    JsonSchema metaSchema = JsonSchemaFactory.getInstance(VersionFlag.V201909).getSchema(metaSchemaUri);
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
    var json = toJsonObject(metaPath);

    if (json.has("vendor")) {
      assertThat(json.has("vendorUrl")).as("if vendor is specified vendorUrl must be also specified").isTrue();
      assertThat(json.has("vendorImage")).as("if vendor is specified vendorImage must be also specified").isTrue();
    }
    if (json.has("vendorUrl")) {
      var vendorUrl = json.getString("vendorUrl");
      assertThat(checkUriExists(vendorUrl)).as("vendor url is not reachable " + vendorUrl).isTrue();
    }
    if (json.has("vendorImage")) {
      var image = json.getString("vendorImage");
      var vendorImage = path.resolve(image);
      assertThat(vendorImage).exists();
    }

    if (json.has("mavenArtifacts"))
    {
      var array = json.getJSONArray("mavenArtifacts");
      for (int i = 0; i < array.length(); i++)
      {
        var mavenArtifact = array.getJSONObject(i);
        var groupId = mavenArtifact.getString("groupId");
        var artifactId = mavenArtifact.getString("artifactId");
        var repoUrl = "https://maven.axonivy.com";
        if (mavenArtifact.has("repoUrl"))
        {
          repoUrl = mavenArtifact.getString("repoUrl");
        }
        checkArtifact(repoUrl, groupId, artifactId);
      }
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
    var metaPath = path.resolve("product.json");
    if (!Files.exists(metaPath)) {
      System.out.println("skipping "+metaPath);
      return;
    }

    var json = toJsonObject(metaPath);
    if (json.has("installers"))
    {
      var installers = json.getJSONArray("installers");
      for (var i = 0; i < installers.length(); i++) {
        var installer = installers.getJSONObject(i);
        if (installer.has("..."))
        {
          String include = installer.getString("...");
          include = include.substring(1, include.length()-1);
          installer = toJsonObject(path.resolve(include));
        }
        var id = installer.getString("id");
        if ("maven-dependency".equals(id))
        {
          checkMavenArtifactsOfInstaller(installer, "dependencies");
        }
        if ("maven-import".equals(id))
        {
          checkMavenArtifactsOfInstaller(installer, "projects");
        }
      }
    }
  }

  private void checkMavenArtifactsOfInstaller(JSONObject installer, String depsId)
  {
    var data = installer.getJSONObject("data");
    var deps = data.getJSONArray(depsId);

    var repoUrl = "https://repo1.maven.org/maven2";
    if (data.has("repositories"))
    {
      var repos = data.getJSONArray("repositories");
      repoUrl = repos.getJSONObject(0).getString("url");
    }

    for (var k = 0; k < deps.length(); k++)
    {
      var dep = deps.getJSONObject(k);
      var groupId = dep.getString("groupId");
      var artifactId = dep.getString("artifactId");
      checkArtifact(repoUrl, groupId, artifactId);
    }
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

  private JSONObject toJsonObject(Path path)
  {
    try
    {
      var actual = Files.readString(path);
      return new JSONObject(actual);
    }
    catch (IOException ex)
    {
      throw new RuntimeException(ex);
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
            .map(json -> toJsonObject(json))
            .map(json -> json.getString("id"))
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
