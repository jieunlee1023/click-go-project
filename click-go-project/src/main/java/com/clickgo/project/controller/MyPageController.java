package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyPageController {

	@GetMapping("/mypage")
	public String myPage(@RequestParam String role, Model model) {
		System.out.println(role);
			return "/user/my/mypage";
	}
}
