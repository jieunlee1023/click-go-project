package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.enums.StoreCategory;
import com.clickgo.project.repository.IImageRepository;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

	String imageUrl;

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private IImageRepository iImageRepository;

	private Page<Store> stores;

	@GetMapping("/main")
	public String store(@RequestParam(required = false) String pageName, Model model,
			@PageableDefault(size = 100, sort = "id", direction = Direction.DESC) Pageable pageable) {
		List<StoreCategory> categories = new ArrayList<>();
		List<Category> categoryEntitys = categoryService.findAll();
		categoryEntitys.forEach(t -> {
			categories.add(t.getId());
		});
		if (pageName == null) {
			stores = storeService.getStoreAllList(pageable);
		} else {
			stores = storeService.findAllByStoreCategory(pageName, pageable);
		}
		model.addAttribute("nowPage", pageName);
		model.addAttribute("categories", categories);
		model.addAttribute("stores", stores);
		franchiseMassageCount(model);
		return "store/store-main";
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

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(id);
		// 비로그인 회원 접속 시 임시 RoleType을 GEUST로 지정
		if (principalDetails == null) {
			principalDetails = new PrincipalDetails(new User().builder().role(RoleType.GEUST).build());
		}
		int totalRoomCount = storeEntity.getStoreTotalRoomCount();
		originLayout(totalRoomCount, model);
		getNowDateAndTime(model);
		RoleType role = principalDetails.getUser().getRole();

		model.addAttribute("store", storeEntity);
		model.addAttribute("role", role);

		List<Image> image = iImageRepository.findAll();
		model.addAttribute("images", image);

		return "/store/detail";
	}

	private void getNowDateAndTime(Model model) {
		Date date = new Date();

		int nowYear = (date.getYear() + 1900);
		String nowMonth = "0" + (date.getMonth() + 1);
		String nowDay = "0" + date.getDate();
		int nowHour = date.getHours();
		int nowMinutes = date.getMinutes();

		String nowDate = nowYear + "-" + nowMonth + "-" + nowDay;
		String nowTime = nowHour + ":" + nowMinutes;
		String maxDate = nowYear + "-" + nowMonth + "-" + (Integer.parseInt(nowDay) + 7);
		String nowTimeOnlyHour = (nowHour + 1) + ":" + 00;

		model.addAttribute("nowDate", nowDate);
		model.addAttribute("nowTime", nowTime);
		model.addAttribute("maxDate", maxDate);
		model.addAttribute("nowTimeOnlyHour", nowTimeOnlyHour);
	}

	public void originLayout(int roomCount, Model model) {
		int onlyOneSpace = ((roomCount / 2) + 1);
		int standard = 6;
		int space = 6;

		model.addAttribute("onlyOneSpace", onlyOneSpace);
		model.addAttribute("totalRoomCount", roomCount);

		model.addAttribute("standard", standard);
		model.addAttribute("space", space);

		model.addAttribute("firstSpace", space);
		model.addAttribute("secondSpace", (space * 3));
		model.addAttribute("thirdSpace", (space * 5));
		model.addAttribute("foursSpace", (space * 7));

		model.addAttribute("firstStandard", (standard * 2));
		model.addAttribute("secondStandard", (standard * 4));
		model.addAttribute("thirdStandard", (standard * 6));
		model.addAttribute("foursStandard", (standard * 8));
	}

}
