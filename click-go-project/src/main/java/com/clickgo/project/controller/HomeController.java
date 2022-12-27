package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping({ "", "/" })
	public String home() {
		return "index";
	}

	
	@GetMapping("/home/about-us")
	public String aboutUs() {
		return "home/about-us";
	}
	
	
	@GetMapping("/home/store")
	public String store() {
		return "home/store";
	}
	
	@GetMapping("/home/board")
	public String board() {
		return "home/board";
	}
	
	
	
	@GetMapping("/home/content")
	public String content() {
		return "home/content";
	}
	
}
