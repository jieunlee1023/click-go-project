package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	@GetMapping({ "", "/" })
	public String test() {
		System.out.println("111111111111111111111111");
		return "index";
	}

}
