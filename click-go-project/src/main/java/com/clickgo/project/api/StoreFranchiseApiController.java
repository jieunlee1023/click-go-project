package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.repository.IStoreFranchiseRepository;
import com.clickgo.project.service.StoreFranchiseService;

@RestController
@RequestMapping("/api/store-franchise")
public class StoreFranchiseApiController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@PostMapping("/approve/{id}/{userId}")
	public ResponseDto<?> franchiseApprove(@PathVariable int id, @PathVariable int userId,
			@RequestBody StoreFranchise storeFranchise, Store store, Model model) {
		boolean success = franchiseService.changeStateApproveAndAddStore(id,userId, storeFranchise,store);
		return new ResponseDto<>(success, "승인완료!");
	}
	
	@PostMapping("/reject/{id}/{userId}")
	public ResponseDto<?> franchiseReject(@PathVariable int id, @PathVariable int userId, 
			@RequestBody StoreFranchise storeFranchise, Store store, Model model) {
		boolean rejectSuccess = franchiseService.changeStateReject(id,userId, storeFranchise,store);
		return new ResponseDto<>(rejectSuccess, "거절완료!");
	}

}
