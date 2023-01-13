package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.LikeStore;
import com.clickgo.project.model.enums.StoreCategory;
import com.clickgo.project.repository.IImageRepository;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.WishListService;

@Controller
@RequestMapping("/wish-list")
public class WishListController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private WishListService wishListService;
	
	@Autowired
	private IImageRepository iImageRepository;

	@GetMapping({ "", "/" })
	public String wishList(@RequestParam(required = false) String category, Model model,
			@PageableDefault(size = 50, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		List<StoreCategory> categoryEntitys = new ArrayList<>();
		List<Category> categories = categoryService.findAll();
		categories.forEach(t -> {
			categoryEntitys.add(t.getId());
		});

		List<LikeStore> myLikeStoresList = new ArrayList<>();
		List<LikeStore> likeStoresTotal = wishListService.findByUserId(principalDetails.getUser().getId());
		likeStoresTotal.forEach(t -> {
			if (t.isLikeStore() == true) {
				myLikeStoresList.add(t);
			}
		});
		
		List<Image> images = iImageRepository.findStoreImage();
		model.addAttribute("images", images);

		model.addAttribute("categoryEntitys", categoryEntitys);
		model.addAttribute("likeStoresTotal", likeStoresTotal);
		model.addAttribute("myLikeStoresList", myLikeStoresList);

		return "user/my/wish-list/list";
	}
}