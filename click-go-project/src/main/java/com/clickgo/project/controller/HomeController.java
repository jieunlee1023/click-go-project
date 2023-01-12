package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Caution;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.service.CautionService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
public class HomeController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private CautionService cautionService;

	@GetMapping({ "", "/" })
	public String home(@RequestParam(required = false) String pageName, Model model,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		if (principalDetails != null) {
			Caution cautionEntity = cautionService.findLastIdByUserId(principalDetails.getUser().getId());
			model.addAttribute("caution", cautionEntity);
		}
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "index";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);

		List<StoreFranchise> allMsg = franchiseService.getMessageList();
		franchiseMessages.forEach(t -> {
			if (t.getState().toString().equals("WAIT")) {
				allMsg.add(t);
			}
		});
		int waitMsg = allMsg.size() - franchiseMessages.size();
		model.addAttribute("waitMsg", waitMsg);

	}
}
