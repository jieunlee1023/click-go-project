package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.service.StoreFranchiseService;

@RestController
@RequestMapping("/api/store-franchise")
public class StoreFranchiseApiController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@PostMapping("/apply")
	public ResponseDto<?> franchiseApply(@RequestBody StoreFranchise storeFranchise,
			@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		boolean success = franchiseService.apply(storeFranchise, principalDetails.getUser());
		return new ResponseDto<>(success, "빠른 시일 내로 응답드리겠습니다. 신청해주셔서 감사합니다.");
	}
	

	@DeleteMapping("/approve/{id}/{userId}")
	public ResponseDto<?> franchiseApprove(
			@PathVariable int id,
			@PathVariable int userId) {

		boolean success = franchiseService.deleteByIdAndUserApprove(id, userId);
		return new ResponseDto<>(success, "승인완료!");
	}

}
