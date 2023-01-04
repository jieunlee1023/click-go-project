package com.clickgo.project.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.validator.constraints.Length;

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
@DynamicInsert
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, length = 100, unique = true)
	@Size(max = 50, min = 2, message = "아이디는 최소 2글자 이상을 입력해주세요")
	private String username;

	@Column(nullable = false, length = 100)
	@Size(max = 100, min = 5, message = "비밀번호는 최소 5글자 입력해주세요")
	private String password;

	@Pattern(regexp = "^\\d{3}-\\d{4}-\\d{4}$",message = "휴대폰 형식에 맞춰주세요(ex.010-1234-5678)")
	private String phoneNumber;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;

	@Email(message = "이메일 형식에 맞춰주세요")
	@Column(nullable = false, unique = true )
	private String email;

	@ColumnDefault(value = "0")
	private int reportCount;

	@Enumerated(EnumType.STRING)
	private RoleType role;

	@Enumerated(EnumType.STRING)
	private LoginType loginType;

	@ColumnDefault(value = "0")
	private int point;
}
