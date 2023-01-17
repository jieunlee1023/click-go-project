package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Caution;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.CautionService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private CautionService cautionService;

	@Autowired
	private UserService userService;
	
	@GetMapping({ "", "/" })
	public String myPage(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		User userEntity = userService.findById(principalDetails.getUser().getId());
		Caution cautionEntity = cautionService.findLastIdByUserId(principalDetails.getUser().getId());
		model.addAttribute("user", userEntity);
		model.addAttribute("caution", cautionEntity);
		franchiseMassageCount(model);
		return "/user/my/mypage";
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
