package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@GetMapping({ "", "/" })
	public String myPage(@RequestParam String role, Model model) {
		System.out.println(role);
		if (role == null || role == "") {
			return "/user/mypage/mypage";
		}
		model.addAttribute("role", role);
		return "/host/mypage/mypage";
	}

	@GetMapping("/reservation-list")
	public String reservationList() {
		return "/user/mypage/reservations";
	}
}
