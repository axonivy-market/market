package com.axonivy.market.test;

import java.nio.file.Path;

import org.assertj.core.api.Assertions;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONObjectAssert extends org.assertj.core.api.AbstractAssert<JSONObjectAssert, JSONObject>
{
  private final Path path;

  private JSONObjectAssert(JSONObject actual, Path path)
  {
    super(actual, JSONObjectAssert.class);
    this.path = path;
  }

  public static JSONObjectAssert assertThat(JSONObject json, Path path)
  {
    return new JSONObjectAssert(json, path);
  }

  public JSONObjectAssert requireStringPropertyWithMinLength(String name, int minLength)
  {
    isNotNull();
    Assertions.assertThat(actual.has(name)).as(name + " property must exist in " + path).isTrue();

    var value = actual.getString(name);
    Assertions.assertThat(value.length()).as(name + " property value must have at least " + minLength + " characters in " + path).isGreaterThanOrEqualTo(minLength);
    return this;
  }

  public JSONObjectAssert optionalIntegerPropertyWithMinValue(String name, int minValue)
  {
    isNotNull();
    if (actual.has(name))
    {
      try
      {
        var value = actual.getInt(name);
        Assertions.assertThat(Integer.valueOf(value)).as(name + " property value must be equal or greater than " + minValue + " in " + path).isGreaterThanOrEqualTo(minValue);
      }
      catch (JSONException ex)
      {
        failWithMessage(name + " property must be a integer in " + path);
      }
    }
    return this;
  }

  public JSONObjectAssert optionalBooleanProperty(String name, boolean defaultValue)
  {
    isNotNull();
    if (actual.has(name))
    {
      try
      {
        var value = actual.getBoolean(name);
        Assertions.assertThat(value)
          .as(name + " property value must be " + !defaultValue + " ("+defaultValue+ " is default in " + path)
          .isEqualTo(!defaultValue);
      }
      catch (JSONException ex)
      {
        failWithMessage(name + " property must be a boolean in " + path);
      }
    }
    return this;
  }

  public JSONObjectAssert optionalStringPropertyWithFixedValues(String name, String... fixedValues)
  {
    isNotNull();
    if (actual.has(name))
    {
      var value = actual.getString(name);
      Assertions.assertThat(fixedValues).as(name + " property value must be one of " + fixedValues + " in " + path).contains(value);
    }
    return this;
  }

  public JSONObjectAssert optionalStringPropertyWithMinLength(String name, int minLength)
  {
    isNotNull();
    if (actual.has(name))
    {
      var value = actual.getString(name);
      Assertions.assertThat(value.length()).as(name + " property value must have at least " + minLength + " characters in " + path).isGreaterThanOrEqualTo(minLength);
    }
    return this;
  }

  public JSONObjectAssert optionalStringArrayProperty(String name)
  {
    isNotNull();
    if (actual.has(name))
    {
      try
      {
        var values = actual.getJSONArray(name).toList();
        for (var value : values)
        {
          Assertions.assertThat(value).as(name + " property must be an array of only strings in " + path).isInstanceOf(String.class);
        }
      }
      catch (JSONException ex)
      {
        failWithMessage(name + " property must be a array in " + path);
      }
    }
    return this;
  }
}
