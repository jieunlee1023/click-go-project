package com.clickgo.project.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.clickgo.project.model.enums.LoginType;
import com.clickgo.project.model.enums.RoleType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class DeleteUser {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, length = 100)
	@Size(max = 50, min = 2)
	private String username;

	@Column(nullable = false, length = 100)
	@Size(max = 100, min = 5)
	private String password;

	@Pattern(regexp = "^\\d{3}-\\d{4}-\\d{4}$")
	private String phoneNumber;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp deleteDate;

	@Email
	private String email;


	@Enumerated(EnumType.STRING)
	private RoleType role;

	@Enumerated(EnumType.STRING)
	private LoginType loginType;

	
	
}
