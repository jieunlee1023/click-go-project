package com.clickgo.project.dto.res.kakaoPay;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.clickgo.project.entity.Reservation;
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
	private int id;

	@Column(nullable = false)
	@JsonProperty("aid")
	private String aid;

	@Column(nullable = false)
	@JsonProperty("tid")
	private String tid;

	@Column(nullable = false)
	@JsonProperty("cid")
	private String cid;

	@Column(nullable = false)
	@JsonProperty("partner_order_id")
	private String partnerOrderId;

	@Column(nullable = false)
	@JsonProperty("partner_user_id")
	private String partnerUserId;

	@Column(nullable = false)
	@JsonProperty("payment_method_type")
	private String paymentMethodType;

	@Column(nullable = false)
	@JsonProperty("item_name")
	private String itemName;

	@Column(nullable = false)
	@JsonProperty("quantity")
	private Integer quantity;

	@JsonProperty("amount")
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "amountId")
	private Amount amount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "reservationId")
	private Reservation reservation;

	private String createdAt;

	@Column(nullable = false)
	@JsonProperty("approved_at")
	private String approvedAt;

}
