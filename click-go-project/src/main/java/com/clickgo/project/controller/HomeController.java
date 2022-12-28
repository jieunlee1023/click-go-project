package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
public class HomeController {
	
	@Autowired
	private StoreFranchiseService franchiseService;
	

	@GetMapping({ "", "/" })
	public String home(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "index";
	}

	@GetMapping("/home/about-us")
	public String aboutUs(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "home/about-us";
	}

	@GetMapping("/home/store")
	public String store(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "home/store";
	}

	@GetMapping("/home/board")
	public String board(Model model) {
		franchiseMassageCount(model);
		return "home/board";

	}

	@GetMapping("/home/board/board-form")
	public String board(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "board/board-form";
	}
	
	
	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}

	
	@GetMapping("/home/board/question-form/{id}")
	public String question(Model model, @PathVariable(required = false) int id) {
		model.addAttribute("questNum", id);
		return "home/frequently-asked-questions";
	}
}
