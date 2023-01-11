package com.clickgo.project.dto.res;

import org.springframework.web.multipart.MultipartFile;

import com.clickgo.project.entity.Admin;
import com.clickgo.project.entity.User;

import lombok.Data;

@Data
public class RequestAdminFileDto {
	
	private MultipartFile file;
	private String uuid; 
	
	private String nickName;
	private String blogLink;
	private String myInfo;


	// 기능 만들기
	public Admin toEntitiy(String profileUrl, User user) {
		return Admin.builder()
				.nickName(nickName)
				.blogLink(blogLink)
				.myInfo(myInfo)
				.profileUrl(profileUrl)
				.user(user)
				.build();
	}
}
