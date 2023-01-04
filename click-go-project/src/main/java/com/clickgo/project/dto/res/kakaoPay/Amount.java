package com.clickgo.project.dto.res.kakaoPay;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "total", "tax_free", "vat", "point", "discount", "green_deposit" })
@Generated("jsonschema2pojo")
public class Amount {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	@JsonProperty("total")
	private Integer total;
	
	@Column(nullable = false)
	@JsonProperty("tax_free")
	private Integer taxFree;
	
	@Column(nullable = false)
	@JsonProperty("vat")
	private Integer vat;
	
	@Column(nullable = false)
	@JsonProperty("point")
	private Integer point;
	
	@Column(nullable = false)
	@JsonProperty("discount")
	private Integer discount;
	
	@Column(nullable = false)
	@JsonProperty("green_deposit")
	private Integer greenDeposit;
	
}
