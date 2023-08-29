package com.axonivy.market;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CreateBundle
{
  private static final ObjectMapper MAPPER = new ObjectMapper();
  private final Path metaJson;

  public CreateBundle(Path metaJson)
  {
    this.metaJson = metaJson;
  }

  public void copyTo(Path targetDir) throws IOException
  {
    var json = load(metaJson);
    var id = json.get("id").asText();

    var destDir = targetDir.resolve(id);
    var srcDir = metaJson.getParent().toFile();
    System.out.println(srcDir);
    FileUtils.copyDirectory(srcDir, destDir.toFile());
  }

  private JsonNode load(Path metaPath) {
    try {
      return MAPPER.readTree(metaPath.toFile());
    } catch (IOException ex) {
      throw new RuntimeException(ex);
    }
  }

  public static void main(String[] args) throws IOException
  {
    var targetDir = new File("target/market/");
    FileUtils.deleteDirectory(targetDir);
    for (var metaJson : metaJsons())
    {
      new CreateBundle(metaJson).copyTo(targetDir.toPath());
    }
  }

  private static List<Path> metaJsons()
  {
    try
    {
      var marketRoot = marketRoot();
      return Files.walk(marketRoot, Integer.MAX_VALUE)
              .filter(path -> path.endsWith("meta.json"))
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
    return Paths.get("..").resolve("market");
  }
}
