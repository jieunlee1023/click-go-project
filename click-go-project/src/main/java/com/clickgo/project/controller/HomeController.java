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
}
