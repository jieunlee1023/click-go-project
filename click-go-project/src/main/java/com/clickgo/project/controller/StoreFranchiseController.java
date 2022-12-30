package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestFileDto;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.StoreCategory;
import com.clickgo.project.model.enums.StoreFranchiseState;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/storeFranchise")
public class StoreFranchiseController {

	@Autowired
	private StoreFranchiseService franchiseService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private CategoryService categoryService;
	
	//메시지 개수
	int count;
	
	@GetMapping("/store-franchise-apply")
	public String franchiseApply(Model model) {

		List<Category> categoryList = categoryService.findAll();
		List<StoreCategory> categories = new ArrayList<>();
		categoryList.forEach(t -> {
			categories.add(t.getId());
		});
		model.addAttribute("categories", categories);
		return "/storeFranchise/store-franchise-apply";
	}

	@PostMapping("/apply/upload")
	public String franchiseApply(RequestFileDto fileDto, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		franchiseService.apply(fileDto, principalDetails);
		return "redirect:/";
	}

	@GetMapping("/store-franchise-list")
	public String franchiseList(Model model) {
		List<Store> storeList = storeService.getStoreAllList();
		model.addAttribute("storeList", storeList);
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-list";
	}

	@GetMapping("/store-franchise-message")
	public String franchiseMessage(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-message";
	}

	@GetMapping("/store-franchise-applyList")
	public String frannchiseApplyList() {
		return "/storeFranchise/store-franchise-applyList";
	}

	public void franchiseMassageCount(Model model) {
		
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);

		List<StoreFranchise> allMsg = franchiseService.getMessageList();
		franchiseMessages.forEach(t->{
			if (t.getState().toString().equals("WAIT")) {
				allMsg.add(t);
			}
		});
		int waitMsg = allMsg.size()-franchiseMessages.size();
		model.addAttribute("waitMsg", waitMsg);

	}
}
