package com.clickgo.project.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.PaymentType;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Reservation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private ApproveStatus approveStatus;

	@Enumerated(EnumType.STRING)
	private PaymentType paymentType;
	
	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;

	@Column(nullable = false)
	private String reservationDate;

	private String endDate;
	
	@Column(nullable = false)
	private String reservationTime;

	private String endTime;

	@Column(nullable = false)
	private int reservationSeat;

	@Column(nullable = false)
	private int price;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	private User user;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "storeId", nullable = false)
	private Store store;
}
