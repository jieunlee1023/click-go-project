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
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class ReportReply {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Lob
	@Column(nullable = false)
	private String content;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;

//	@OneToOne
//	@JoinColumn(name = "userId")
//	private User user;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "reportId")
	@JsonBackReference
	private Report report;
}
