package com.clickgo.project.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.clickgo.project.model.enums.StoreFranchiseState;
import com.fasterxml.jackson.annotation.JsonAutoDetect;

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
public class Admin {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	private String nickName;

	@Column(nullable = false)
	private String profileUrl;

	@Column(nullable = false)
	private String blogLink;
	
	@Column(nullable = false)
	private String myInfo;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", nullable = false)
	private User user;

}
