package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Store;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/care-store")
public class CareStoreController {

	@Autowired
	private StoreService storeService;
	
	@GetMapping({ "", "/" })
	public String careStroe(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
			List<Store> stores = storeService.findAllByUserId(principalDetails.getUser().getId());
			stores.forEach(t -> {
				System.out.println(t);
			});
			model.addAttribute("stores", stores);
			return "/user/my/care-store/list";
	}
}
