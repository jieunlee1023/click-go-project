package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
@RequestMapping("/storeFranchise")
public class StoreFranchiseController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@GetMapping("/store-franchise-apply")
	public String franchiseApply() {

		return "/storeFranchise/store-franchise-apply";
	}

	@GetMapping("/store-franchise-list")
	public String franchiseList(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-list";
	}

	@GetMapping("/store-franchise-message")
	public String franchiseMessage(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-message";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		int count = 0;
		model.addAttribute("message", franchiseMessages);
		model.addAttribute("count", count);
	}

}
