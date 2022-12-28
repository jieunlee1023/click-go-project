package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
public class MyPageController {
	
	@Autowired
	private StoreFranchiseService franchiseService;

	@GetMapping("/mypage")
	public String myPage(@RequestParam String role, Model model) {
		System.out.println(role);
		if (role == null || role == "") {
			return "/user/mypage/mypage";
		}
		model.addAttribute("role", role);
		franchiseMassageCount(model);
		
		return "/host/mypage/mypage";
	}
	
	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}
}
