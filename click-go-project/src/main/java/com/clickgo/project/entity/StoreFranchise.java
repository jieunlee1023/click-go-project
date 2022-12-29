package com.clickgo.project.entity;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.CreationTimestamp;

import com.clickgo.project.model.enums.StoreCategory;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@ToString
public class StoreFranchise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private StoreCategory category;

	@Column(nullable = false, length = 15)
	private String storeName;

	@Pattern(regexp = "^\\d{3}-\\d{3}-\\d{4}$")
	private String storeTEL;

	@Column(nullable = false)
	private String storeAddress;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp applyDate;

	@Column(nullable = false)
	private String storeLicense;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", nullable = false)
	private User user;

}
