package com.clickgo.project.dto.res;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.StoreFranchiseState;

import lombok.Data;

@Data
public class RequestFileDto {
	
//	private MultipartFile[] files; :여러개
	private List<MultipartFile> file;
	private String uuid; //고유한 파일 이름을 만들기 위한 변수
	
	private Category category;
	private String storeName;
	private String storeTEL;
	private String storeAddress;
	private int storeTotalRoomCount;
	private int price;


	// 기능 만들기
	public StoreFranchise toEntitiy(String licenseImageUrl, String layoutImageUrl, User user) {
		return StoreFranchise.builder()
				.category(category)
				.storeName(storeName)
				.storeTEL(storeTEL)
				.storeAddress(storeAddress)
				.storeTotalRoomCount(storeTotalRoomCount)
				.price(price)
				.licenseImageUrl(licenseImageUrl)
				.layoutImageUrl(layoutImageUrl)
				.state(StoreFranchiseState.WAIT)
				.user(user)
				.build();
	}
}
