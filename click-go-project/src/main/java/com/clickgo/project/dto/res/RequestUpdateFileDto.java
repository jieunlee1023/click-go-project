package com.clickgo.project.dto.res;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestUpdateFileDto {
	
	private MultipartFile[] files;
	private String uuid; //고유한 파일 이름을 만들기 위한 변수


	// 기능 만들기
	public Image toEntitiy(String imageUrl, Store store) {
		return Image.builder()
				.imageUrl(imageUrl)
				.store(store)
				.build();
	}
}
