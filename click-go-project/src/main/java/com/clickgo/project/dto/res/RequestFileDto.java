package com.clickgo.project.dto.res;

import org.springframework.web.multipart.MultipartFile;

import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.StoreFranchiseState;

import lombok.Data;

@Data
public class RequestFileDto {
	
//	private MultipartFile[] files; :여러개
	private MultipartFile file;
	private String uuid; //고유한 파일 이름을 만들기 위한 변수
	
	private Category category;
	private String storeName;
	private String storeTEL;
	private String storeAddress;


	// 기능 만들기
	public StoreFranchise toEntitiy(String postImageUrl, User user) {
		return StoreFranchise.builder()
				.category(category)
				.storeName(storeName)
				.storeTEL(storeTEL)
				.storeAddress(storeAddress)
				.storeLicense(postImageUrl)
				.state(StoreFranchiseState.WAIT)
				.user(user)
				.build();
	}

//	public Store toStoreEntitiy(List<Image> postImageUrl, User user) {
//		return Store.builder()
//				.category(category)
//				.storeName(storeName)
//				.storeTEL(storeTEL)
//				.storeAddress(storeAddress)
//				.image(postImageUrl)
//				.user(user)
//				.build();
//	}

}
