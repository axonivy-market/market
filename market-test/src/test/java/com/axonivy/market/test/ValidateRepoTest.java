package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
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
            .requireStringPropertyWithMinLength("id", 5)
            .requireStringPropertyWithPattern("version", "^(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)$")
            .requireStringPropertyWithMinLength("name", 5)
            .requireStringPropertyWithLength("description", 5, 200)
            .requireStringPropertyWithLength("vendor", 2, 100)
            .optionalStringPropertyWithPattern("compatibility", "^(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)[+]?$")
            .optionalStringPropertyWithPattern("platformRating", "^([0-4])?(\\.[5])?$|^5$")
            .optionalStringPropertyWithMinLength("industry", 2)
            .optionalStringPropertyWithFixedValues("costs", "paid") // free is default            
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
      }
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
