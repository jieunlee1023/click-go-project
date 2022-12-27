package com.clickgo.project.dto.res;

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

	// sw
	@ManyToOne
	@JoinColumn(name = "boardId")
	@JsonIgnoreProperties({ "csReply", "userId" })
	private CsBoard csBoard;

	// sw
	@ManyToOne
	@JoinColumn(name = "userId")
	@JsonIgnoreProperties({ "password", "role", "email", "loginType" })
	private User user;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;
}
