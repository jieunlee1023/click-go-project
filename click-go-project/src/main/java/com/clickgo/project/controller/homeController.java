package com.clickgo.project.controller;

import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class homeController {

	@GetMapping({ "", "/" })
	public String home() {
		return "index";
	}

	
	@GetMapping("/home/about-us")
	public String aboutUs(@RequestParam String nowPage, Model model) {
		model.addAttribute("nowPage", model);
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
