package com.clickgo.project.dto.res;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Image {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;

	@Column(nullable = false)
	private String imageUrl;

	@Column(nullable = false)
	private String originFileName;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "storeId", nullable = false)
	private Store store;

}
