package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping({ "", "/" } )
	public String index() {
		return "index";
	}
	
	@GetMapping("/home/store")
	public String storeForm(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/store";
	}
	
	@GetMapping("/home/about-us")
	public String aboutUsForm(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/content";
	}
	
	@GetMapping("/home/board")
	public String boardForm(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/board";
	}
	
	@GetMapping("/home/content")
	public String contentForm(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/content";
	}


}
