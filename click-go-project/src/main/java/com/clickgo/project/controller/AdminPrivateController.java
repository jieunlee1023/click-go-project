package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestAdminFileDto;
import com.clickgo.project.entity.Admin;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.repository.IAdminRepository;
import com.clickgo.project.service.AdminService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
@RequestMapping("/admin/private")
public class AdminPrivateController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private IAdminRepository adminRepository;

	@GetMapping("/team")
	public String adminTeamPage(Model model,@AuthenticationPrincipal PrincipalDetails principalDetails ) {
		Admin adminEntity = adminService.findByUserId(principalDetails.getUser().getId());
		List<Admin> admins = adminRepository.findAll();
		model.addAttribute("adminEntity", adminEntity);
		model.addAttribute("admins", admins);
		franchiseMassageCount(model);
		return "admin/private/team";
	}

	@GetMapping("/plan")
	public String adminPlanPage(Model model ,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Admin adminEntity = adminService.findByUserId(principalDetails.getUser().getId());
		model.addAttribute("adminEntity", adminEntity);
		franchiseMassageCount(model);
		return "admin/private/plan";
	}

	@GetMapping("/repository")
	public String adminTrelloPage(Model model ,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Admin adminEntity = adminService.findByUserId(principalDetails.getUser().getId());
		model.addAttribute("adminEntity", adminEntity);
		franchiseMassageCount(model);
		return "admin/private/repository";
	}


	@PostMapping("/profile/{userId}")
	public String saveProfile(@PathVariable int userId, RequestAdminFileDto adminFileDto,
			@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		Admin adminEntity = adminService.saveProfile(userId, adminFileDto, principalDetails);
		franchiseMassageCount(model);
		model.addAttribute("adminEntity", adminEntity);
		return "admin/main";
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
