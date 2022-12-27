package com.clickgo.project.controller;

import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping({ "", "/" })
	public String home(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "index";
	}

	@GetMapping("/home/about-us")
	public String aboutUs(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/about-us";
	}

	@GetMapping("/home/store")
	public String store(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/store";
	}

	@GetMapping("/home/board")
	public String board(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/board";
	}

	@GetMapping("/home/content")
	public String content(@RequestParam String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		return "home/content";
	}

}
