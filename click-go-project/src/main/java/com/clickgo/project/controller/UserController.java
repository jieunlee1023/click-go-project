package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/auth/login_form")
	public String login_form() {
		System.out.println("z");
		return "/user/login";
	}

	@GetMapping("/auth/join_form")
	public String join_form() {
		System.err.println("zz");
		return "/user/join_form";
	}
}
