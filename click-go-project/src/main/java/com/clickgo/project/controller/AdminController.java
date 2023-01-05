package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.OneOnOneService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private OneOnOneService oneOnOneService;
	
	@Autowired
	private StoreFranchiseService franchiseService;
	
	
	

	@GetMapping("/main")
	public String adminPage(Model model) {
		franchiseMassageCount(model);
		return "admin/main";
	}

	@GetMapping("/sales")
	public String adminSales() {
		return "admin/sales";
	}

	@GetMapping("/reservation")
	public String adminreservation() {
		return "admin/reservation";
	}

	@GetMapping("/report")
	public String adminReport() {
		return "admin/report";
	}

	@GetMapping({"/user", "/user-search"})
	public String adminUserInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.ASC) Pageable pageable) {
		
		String searchUserInfo = q == null ? "" : q;
//		Page<User> users = userService.getUserList(pageable);
		Page<User> users = userService.searchUserInfo(searchUserInfo, pageable);
		
		int PAGENATION_BLOCK_COUNT = 10;
		
		int nowPage = users.getPageable().getPageNumber() + 1;
		
		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, users.getTotalPages());
		
		
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}
				
		
		model.addAttribute("users", users);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchUserInfo);
		
		franchiseMassageCount(model);
		return "admin/user";
	}

	@GetMapping({"/store", "/store-search"})
	public String adminStoreInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.ASC) Pageable pageable) {
		String searchStoreName = q == null ? "" : q;
		
//		Page<Store> stores = storeService.getStoreAllList(pageable);
		Page<Store> stores = storeService.searchStoreList(searchStoreName, pageable);
		
		int PAGENATION_BLOCK_COUNT = 3;
		
		int nowPage = stores.getPageable().getPageNumber() + 1;
		
		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, stores.getTotalPages());
		
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
	}
		
		model.addAttribute("stores", stores);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchStoreName);
		
		franchiseMassageCount(model);
		
		return "admin/store";
	}

	@GetMapping("/answer")
	public String oneOnOneAsk(Model model) {
		
		List<OneOnOne> ooos = oneOnOneService.getContentList();
		model.addAttribute("ooos", ooos);
		
		return "admin/answer";
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
