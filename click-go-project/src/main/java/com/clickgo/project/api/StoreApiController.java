package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.dto.res.StoreApply;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/store")
public class StoreApiController {

//	@Autowired
//	private StoreService storeService;
//
//	@PostMapping("/apply")
//	public ResponseDto<?> storeApply(@RequestBody StoreApply storeApply , Model model) {
//		boolean success = storeService.apply(storeApply);
//
//		return new ResponseDto<>(success, "빠른 시일 내로 응답드리겠습니다. 신청해주셔서 감사합니다.");
//	}
}
