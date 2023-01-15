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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestApplyFileDto;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.StoreCategory;
import com.clickgo.project.repository.IImageRepository;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.ImageService;
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
	@Autowired
	private IImageRepository iImageRepository;
	// 메시지 개수
	int count;

	@GetMapping("/store-franchise-apply")
	public String franchiseApply(Model model) {

		List<Category> categoryList = categoryService.findAll();
		List<StoreCategory> categories = new ArrayList<>();
		categoryList.forEach(t -> {
			categories.add(t.getId());
		});
		model.addAttribute("categories", categories);
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-apply";
	}

	@PostMapping("/apply/upload")
	public String franchiseApply(RequestApplyFileDto fileDto, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		franchiseService.apply(fileDto, principalDetails);
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-applyList";
	}

	// s w
	@GetMapping({ "/store-franchise-list", "/store-franchise-list/search" })
	public String franchiseList(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 9, sort = "id", direction = Direction.DESC) Pageable pageable) {
		String searchFtitle = q == null ? "" : q;

		Page<Store> storeList = storeService.searchStoreList(searchFtitle, pageable);

		int PAGENATION_BLOCK_COUNT = 3;
		int nowPage = storeList.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + PAGENATION_BLOCK_COUNT, storeList.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}
		
		List<Image> images = iImageRepository.findStoreImage();
		model.addAttribute("images", images);

		model.addAttribute("storeSearch", storeList.getTotalElements());
		model.addAttribute("storeList", storeList);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchFtitle);

		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-list";
	}

	@GetMapping("/store-franchise-message")
	public String franchiseMessage(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-message";
	}

	@GetMapping("/store-franchise-applyList")
	public String frannchiseApplyList(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-applyList";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);

		List<StoreFranchise> allMsg = franchiseService.getMessageList();
		franchiseMessages.forEach(t -> {
			if (t.getState().toString().equals("WAIT")) {
				allMsg.add(t);
			}
		});
		int waitMsg = allMsg.size() - franchiseMessages.size();
		model.addAttribute("waitMsg", waitMsg);
	}

}
