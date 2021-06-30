package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
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

class ValidateRepoTest
{
  @Test
  void everyProductHasAValidJson()
  {
    assertThat(productDirs()).allSatisfy(path -> assertValidMetaJson(path));
  }

  private void assertValidMetaJson(Path path)
  {
    var metaPath = path.resolve("meta.json");
    var json = toJsonObject(metaPath);
    JSONObjectAssert.assertThat(json, metaPath)
            .requireStringPropertyWithLength("id", 5, 25)
            .requireStringPropertyWithPattern("version", "^(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)$")
            .requireStringPropertyWithLength("name", 4, 22)
            .requireStringPropertyWithLength("description", 5, 200)
            .requireStringPropertyWithLength("vendor", 2, 100)
            .optionalStringPropertyWithPattern("compatibility", "^(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)[+]?$")
            .optionalStringPropertyWithPattern("platformReview", "^([0-4])?(\\.[5])?$|^5$")
            .optionalStringPropertyWithMinLength("industry", 2)
            .optionalStringPropertyWithFixedValues("cost", "paid") // free is default            
            .requireStringPropertyWithFixedValues("type", "connector", "solution", "process", "util")
            .optionalBooleanProperty("listed", true)
            .optionalStringPropertyWithFixedValues("versionDisplay", "portal", "hide-snapshots")
            .optionalStringArrayProperty("tags");

    if (json.has("mavenArtifacts"))
    {
      var array = json.getJSONArray("mavenArtifacts");
      for (int i = 0; i < array.length(); i++)
      {
        var mavenArtifact = array.getJSONObject(i);
        JSONObjectAssert.assertThat(mavenArtifact, metaPath)
                .requireStringPropertyWithMinLength("name", 5)
                .requireStringPropertyWithMinLength("groupId", 5)
                .requireStringPropertyWithMinLength("artifactId", 5)
                .optionalBooleanProperty("makesSenseAsMavenDependency", false)
                .optionalStringPropertyWithMinLength("key", 5)
                .optionalStringPropertyWithFixedValues("type", "zip", "nbm")
                .optionalBooleanProperty("doc", false);
        
        var groupId = mavenArtifact.getString("groupId");
        var artifactId = mavenArtifact.getString("artifactId");
        var repoUrl = "https://repo.axonivy.com/libs";
        if (mavenArtifact.has("repoUrl"))
        {
          repoUrl = mavenArtifact.getString("repoUrl");
        }
        checkArtifact(repoUrl, groupId, artifactId);
      }
    }

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
        JSONObjectAssert.assertThat(installer, metaPath)
          .requireStringPropertyWithMinLength("id", 5);

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
      var client = HttpClient.newHttpClient();
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
  void everyProductHasAReadme()
  {
    assertThat(productDirs())
            .extracting(path -> path.resolve("README.md"))
            .allSatisfy(path -> assertThat(path).exists());
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
