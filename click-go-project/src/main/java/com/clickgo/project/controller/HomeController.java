package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping({ "", "/home" })
	public String home() {
		return "index";
	}

	@GetMapping({ "", "/" })
	public String home(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "index";
	}

	@GetMapping("/home/about-us")
	public String aboutUs(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/about-us";
	}

	@GetMapping("/home/store")
	public String store(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/store";
	}

	@GetMapping("/home/board/board-form")
	public String board(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "board/board-form";
	}
	
	@GetMapping("/home/board/board-list")
	public String boardListForm(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "board/board-list";
	}
	
	

	@GetMapping("/home/content")
	public String content(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/content";
	}

}
