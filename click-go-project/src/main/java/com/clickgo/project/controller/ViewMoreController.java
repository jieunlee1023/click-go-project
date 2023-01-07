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
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.OneOnOneAnswer;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.service.OneOnOneAnswerService;
import com.clickgo.project.service.OneOnOneService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
@RequestMapping("/view-more")
public class ViewMoreController {

	@Autowired
	private OneOnOneService oneOnOneService;
	
	@Autowired
	private OneOnOneAnswerService oneOnOneAnswerService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@GetMapping("/about-us")
	public String aboutUs(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "view-more/about-us";
	}

	@GetMapping("/question-form/{id}")
	public String question(Model model, @PathVariable(required = false) int id) {
		model.addAttribute("questNum", id);
		franchiseMassageCount(model);
		return "view-more/frequently-asked-questions";
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

	// s w
	@GetMapping("/notice-list")
	public String noticeList(Model model) {
		franchiseMassageCount(model);
		return "view-more/notice-list";
	}

	// s w
	@GetMapping("/terms-list")
	public String termsList(Model model) {
		franchiseMassageCount(model);
		return "view-more/terms-list";
	}

	// s w
	@GetMapping("/one-on-one")
	public String oneOnone(Model model) {
		List<OneOnOne> ooos = oneOnOneService.getOooList();
		model.addAttribute("ooos", ooos);

		franchiseMassageCount(model);
		return "view-more/one-on-one";
	}

	// s w
	@GetMapping("/one-on-one/{id}")
	public String showAnswer(@PathVariable int id, Model model) {
		
		List<OneOnOne> oooList = oneOnOneService.getOooList();
		List<OneOnOneAnswer>oooaList = oneOnOneAnswerService.getAnswerList();
		
		OneOnOne oneOnOneEntity = oneOnOneService.findById(id);
		model.addAttribute("ooo", oneOnOneEntity);
		model.addAttribute("oooList", oooList);
		model.addAttribute("oooaList", oooaList);
		return "admin/one-on-one-answer";
	}

	// s w
	@PostMapping({ "/one-on-one", "/one-on-one/save" })
	public String oneOnoneWrite(OneOnOne requestOoo, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		oneOnOneService.writeOoo(requestOoo, principalDetails.getUser());

		int userId = requestOoo.getUser().getId();
		String title = requestOoo.getTitle();
		List<OneOnOne> contents = oneOnOneService.getOooList();
		model.addAttribute("userId", userId);
		model.addAttribute("title", title);
		model.addAttribute("contents", contents);

		return "redirect:/view-more/one-on-one";
	}

}
