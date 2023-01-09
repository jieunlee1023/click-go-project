package com.clickgo.project.dto.res.kakaoPay.reject;

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
@JsonPropertyOrder({ "aid", "tid", "cid", "status", "partner_order_id", "partner_user_id", "payment_method_type",
		"item_name", "quantity", "amount", "approved_cancel_amount", "canceled_amount", "cancel_available_amount",
		"created_at", "approved_at", "canceled_at" })
@Generated("jsonschema2pojo")
public class KakaoPaymentRejectDto {

	@JsonProperty("aid")
	public String aid;
	@JsonProperty("tid")
	public String tid;
	@JsonProperty("cid")
	public String cid;
	@JsonProperty("status")
	public String status;
	@JsonProperty("partner_order_id")
	public String partnerOrderId;
	@JsonProperty("partner_user_id")
	public String partnerUserId;
	@JsonProperty("payment_method_type")
	public String paymentMethodType;
	@JsonProperty("item_name")
	public String itemName;
	@JsonProperty("quantity")
	public Integer quantity;
	@JsonProperty("amount")
	public Amount amount;
	@JsonProperty("approved_cancel_amount")
	public ApprovedCancelAmount approvedCancelAmount;
	@JsonProperty("canceled_amount")
	public CanceledAmount canceledAmount;
	@JsonProperty("cancel_available_amount")
	public CancelAvailableAmount cancelAvailableAmount;
	@JsonProperty("created_at")
	public String createdAt;
	@JsonProperty("approved_at")
	public String approvedAt;
	@JsonProperty("canceled_at")
	public String canceledAt;
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