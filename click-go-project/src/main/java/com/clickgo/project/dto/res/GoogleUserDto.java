package com.clickgo.project.dto.res;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "id", "name", "given_name", "family_name", "picture", "locale" })
@Generated("jsonschema2pojo")
public class GoogleUserDto {

	@JsonProperty("id")
	public String id;
	@JsonProperty("name")
	public String name;
	@JsonProperty("given_name")
	public String givenName;
	@JsonProperty("family_name")
	public String familyName;
	@JsonProperty("picture")
	public String picture;
	@JsonProperty("locale")
	public String locale;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonAnyGetter
	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	@JsonAnySetter
	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}