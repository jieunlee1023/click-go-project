package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wish-list")
public class WishListController {

	@GetMapping({ "", "/" })
	public String wishList() {

		return "user/my/wish-list/list";
	}
}
