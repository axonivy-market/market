package com.axonivy.market;

import java.net.URI;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyDescription;

import io.github.axonivy.json.schema.annotations.Examples;

public class MarketMetaSchema {

  @JsonProperty("$schema")
  public String schemaRef; //self-ref

  @NotNull @Size(min = 5, max = 25)
  public String id;
  @Pattern(regexp = "^(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)$")
  public String version;
  @NotNull @Size(min = 4, max = 24)
  public String name;
  @NotNull @Size(min = 5, max = 200)
  public String description;

  @Size(min = 3)
  public String vendor;
  @JsonPropertyDescription("public accessible URI representating the vendor")
  public URI vendorUrl;
  @JsonPropertyDescription("relative path to a logo of the vendor, e.g. 'acme.png'")
  public String vendorImage;

  @Examples("https://github.com/axonivy-market/acme-connector")
  public URI sourceUrl;
  @Examples("https://github.com/axonivy-market/acme-connector/actions/workflows/ci.yml/badge.svg")
  public URI statusBadgeUrl;

  @Examples("English")
  public String language;
  @Pattern(regexp = "^(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)[+]?$")
  public String compatibility;
  @Pattern(regexp = "^([0-4])?(\\.[5])?$|^5$")
  public String platformReview;
  @Examples("Cross-Industry") @Size(min = 2)
  public String industry;

  public static enum Cost { free, paid; }
  public Cost cost;

  public static enum Type { connector, solution, process, util }
  @NotNull
  public Type type;

  @JsonProperty(defaultValue = "true")
  public boolean listed;
  @JsonPropertyDescription("shows the link to contact axonivy")
  public boolean contactUs;

  public boolean validate;

  @Examples("best-match")
  public String installMatcher;

  public String versionDisplay;

  public List<String> tags;

  public static class MavenArtifact {
    public String repoUrl;
    @NotNull @Size(min = 5)
    public String name;
    @NotNull @Size(min = 5)
    public String groupId;
    @NotNull @Size(min = 5)
    public String artifactId;
    public boolean makesSenseAsMavenDependency;
    public String key;

    public static enum ArtifactType {
      zip, nbm, jar;
    }
    public ArtifactType type;
    public boolean doc;

    public static class ArchivedArtifact{
      @NotNull @Size(min = 5)
      @JsonPropertyDescription("""
    		  this is the 'max version' selector. All versions which are lower than or equal the defined value, will be treated as legacy artifact.
    		  Therefore supplying 'legacy' group-/artifact-id for download.
    		  """)
      public String lastVersion;
      @NotNull @Size(min = 5)
      public String groupId;
      @NotNull @Size(min = 5)
      public String artifactId;
    }
    
    @JsonPropertyDescription("archived artifacts using old (legacy) group ID and artifact ID with the last version they were being used.")
    @Examples("""
    		"archivedArtifacts": [
				{
					"lastVersion": "10.0.0",
					"groupId": "com.axonivy.connector.twitter",
					"artifactId": "twitter-connector"
				}
			]
    		""")
    public List<ArchivedArtifact> archivedArtifacts;
  }

  public List<MavenArtifact> mavenArtifacts;

}
