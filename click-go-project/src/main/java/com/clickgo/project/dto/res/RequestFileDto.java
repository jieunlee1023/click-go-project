package com.clickgo.project.dto.res;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestFileDto {
	
	
//	private MultipartFile[] files; :여러개
	private MultipartFile file;
	private String uuid; //고유한 파일 이름을 만들기 위한 변수
	private String storyText;

	// 기능 만들기
	public StoreFranchise toEntitiy(String postImageUrl, StoreFranchise franchise, User user) {
		return StoreFranchise.builder()
				.category(franchise.getCategory())
				.storeName(franchise.getStoreName())
				.storeTEL(franchise.getStoreTEL())
				.storeAddress(franchise.getStoreAddress())
				.storeLicense(postImageUrl)
				.user(user)
				.build();
	}


}
