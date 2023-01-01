package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String careStroeList(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		List<Store> stores = storeService.findAllByUserId(principalDetails.getUser().getId());
		model.addAttribute("stores", stores);
		return "/user/my/care-store/list";
	}



	@GetMapping("/update/{id}")
	public String careStoreUpdate(@PathVariable int id, Model model,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(id);
		if (storeEntity.getUser().getId() == principalDetails.getUser().getId()) {
			model.addAttribute("store", storeEntity);
		}
		return "/user/my/care-store/update";
	}

	@PostMapping("/detail/update")
	public String updateCareStoreDetail(Store store, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		Store storeEntity = storeService.update(store, principalDetails.getUser().getId());

		return "redirect:/care-store/detail/" + storeEntity.getId();
	}
}
