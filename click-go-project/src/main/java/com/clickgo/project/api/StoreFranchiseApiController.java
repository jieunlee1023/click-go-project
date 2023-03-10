package com.clickgo.project.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.ImageService;
import com.clickgo.project.service.StoreFranchiseService;

@RestController
@RequestMapping("/api/store-franchise")
public class StoreFranchiseApiController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ImageService imageService;
	
	@Autowired
	private CategoryService categoryService;

	@PostMapping("/approve/{id}/{userId}")
	public ResponseDto<?> franchiseApprove(@PathVariable int id, @PathVariable int userId,
			@RequestBody StoreFranchise storeFranchise,@RequestParam String category, Store store, Model model) {
		List<Category> categories = categoryService.findAll();
		categories.forEach(t -> {
			if(category.equals(t.getId().toString())) {
				storeFranchise.setCategory(t);
			}
		});
		 franchiseService.changeStateApproveAndAddStore(id, userId, storeFranchise, store);
		return new ResponseDto<>(true, "승인완료!");
	}

	@PostMapping("/reject/{id}/{userId}")
	public ResponseDto<?> franchiseReject(@PathVariable int id, @PathVariable int userId,
			@RequestBody StoreFranchise storeFranchise, Store store, Model model) {
		boolean rejectSuccess = franchiseService.changeStateReject(id, userId, storeFranchise, store);
		return new ResponseDto<>(rejectSuccess, "거절완료!");
	}

}
