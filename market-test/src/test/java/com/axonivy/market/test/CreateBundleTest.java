package com.axonivy.market.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import com.axonivy.market.CreateBundle;

public class CreateBundleTest
{
  @Test
  void canCopy(@TempDir Path repo) throws IOException
  {
    Path ms = repo.resolve("market").resolve("msgraph");
    Files.createDirectories(ms);
    
    Path meta = ms.resolve("meta.json");
    Files.writeString(meta, "{\"id\":\"ms-graph\"}", StandardOpenOption.CREATE_NEW);
    
    CreateBundle msBundle = new CreateBundle(meta);
    Path target = repo.resolve("target");
    Files.createDirectories(target);
    msBundle.copyTo(target);
    
    assertThat(target.resolve("ms-graph")).exists().isDirectory();
  }
}
