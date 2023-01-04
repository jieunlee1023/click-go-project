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
@JsonPropertyOrder({ "aid", "tid", "cid", "partner_order_id", "partner_user_id", "payment_method_type", "item_name",
		"quantity", "amount", "created_at", "approved_at" })
@Generated("jsonschema2pojo")
public class KakaoPaymentHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int id;
	
	@Column(nullable = false)
	@JsonProperty("aid")
	public String aid;
	
	@Column(nullable = false)
	@JsonProperty("tid")
	public String tid;

	@Column(nullable = false)
	@JsonProperty("cid")
	public String cid;
	
	@Column(nullable = false)
	@JsonProperty("partner_order_id")
	public String partnerOrderId;
	
	@Column(nullable = false)
	@JsonProperty("partner_user_id")
	public String partnerUserId;
	
	@Column(nullable = false)
	@JsonProperty("payment_method_type")
	public String paymentMethodType;
	
	@Column(nullable = false)
	@JsonProperty("item_name")
	public String itemName;
	
	@Column(nullable = false)
	@JsonProperty("quantity")
	public Integer quantity;
	
	@Column(nullable = false)
	@JsonProperty("amount")
	public Amount amount;
	
	@Column(nullable = false)
	@JsonProperty("created_at")
	public String createdAt;
	
	@Column(nullable = false)
	@JsonProperty("approved_at")
	public String approvedAt;
	
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
