package com.clickgo.project.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
public class CsReply {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Lob
	@Column(nullable = false)
	private String content;

	// s w
	@ManyToOne
	@JoinColumn(name = "boardId")
	@JsonIgnoreProperties({ "csReply", "userId" })
	private CsBoard csBoard;

	// s w
	@ManyToOne
	@JoinColumn(name = "userId")
	@JsonIgnoreProperties({ "password", "role", "email", "loginType" })
	private User user;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;
	
	
	// 비밀글 여부
	@Column(nullable = true)
	private boolean secret;
}
