package com.clickgo.project.dto.res;

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

import com.clickgo.project.model.enums.PaymentType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	private String aId;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private PaymentType paymentMethod;

	@Column(nullable = false)
	private int total;

	@Column(nullable = false)
	private String approveAt;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "storeId")
	private Store store;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", nullable = false)
	private User user;
}
