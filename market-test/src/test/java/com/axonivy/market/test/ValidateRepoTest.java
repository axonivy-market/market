package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;

class ValidateRepoTest
{
  @Test
  void everyElementHasAValidJson()
  {
    assertThat(elementDirs()).allSatisfy(path -> assertValidMetaJson(path));
  }

  private void assertValidMetaJson(Path path)
  {
    var metaPath = path.resolve("meta.json");
    var json = toJsonObject(metaPath);
    JSONObjectAssert.assertThat(json, metaPath)
            .requireStringPropertyWithMinLength("name", 5)
            .optionalIntegerPropertyWithMinValue("sort", 1)
            .optionalBooleanProperty("listed", true)
            .optionalStringPropertyWithFixedValues("versionDisplay", "portal", "hide-snapshots")
            .optionalBooleanProperty("importWizard", true);

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
    
    if (json.has("installer"))
    {
      var installer = json.getJSONObject("installer");
      JSONObjectAssert.assertThat(installer, metaPath)
              .requireStringPropertyWithMinLength("id", 5);
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
  void everyElementHasAMetaJson()
  {
    assertThat(elementDirs())
            .extracting(path -> path.resolve("meta.json"))
            .allSatisfy(path -> assertThat(path).exists());
  }
  
  @Test
  void everyElementHasAReadme()
  {
    assertThat(elementDirs())
            .extracting(path -> path.resolve("README.md"))
            .allSatisfy(path -> assertThat(path).exists());
  }

  @Test
  void everyElementHasALogo()
  {
    assertThat(elementDirs())
            .extracting(path -> path.resolve("logo.png"))
            .allSatisfy(path -> assertThat(path).exists());
  }

  @Test
  void elements()
  {
    assertThat(elementDirs())
            .extracting(path -> path.getName(path.getNameCount() - 1).toString())
            .as("ensure that elementDirs finds something")
            .contains("doc-factory", "portal");
  }

  private static List<Path> elementDirs()
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
    return repoRoot().resolve("market");
  }

  private static Path repoRoot()
  {
    try
    {
      return Paths.get("..").toRealPath();
    }
    catch (IOException ex)
    {
      throw new RuntimeException(ex);
    }
  }
}
