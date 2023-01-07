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
import com.clickgo.project.entity.OneToOneAsk;
import com.clickgo.project.entity.OneToOneAnswer;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.service.OneToOneAnswerService;
import com.clickgo.project.service.OneToOneAskService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
@RequestMapping("/view-more")
public class ViewMoreController {

	@Autowired
	private OneToOneAskService oneToOneAskService;
	
	@Autowired
	private OneToOneAnswerService oneToOneAnswerService;

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
	@GetMapping("/one-to-one-ask")
	public String oneToOneAskList(Model model) {
		List<OneToOneAsk> onetoOneAskList = oneToOneAskService.getOneToOneAskList();
		model.addAttribute("onetoOneAskList", onetoOneAskList);

		franchiseMassageCount(model);
		return "view-more/one-to-one-ask";
	}

	// AdminController ->    showOnToOneAnswer == showAnswer
 	@GetMapping("/one-to-one-ask/{id}")
	public String showAnswer(@PathVariable int id, Model model) {
		
		List<OneToOneAsk> oneToOneAskList = oneToOneAskService.getOneToOneAskList();
		List<OneToOneAnswer>oneToOneAnswerList = oneToOneAnswerService.getAnswerList();
		
		OneToOneAsk oneToOneAskEntity = oneToOneAskService.findByOneToOneAskId(id);
		model.addAttribute("oneToOneAskEntity", oneToOneAskEntity);
		model.addAttribute("oneToOneAskList", oneToOneAskList);
		model.addAttribute("oneToOneAnswerList", oneToOneAnswerList);
		return "admin/one-on-one-answer";
	}

	// s w
	@PostMapping("/one-to-one-ask/save")
	public String oneToOneWrite(OneToOneAsk reqOneToOneAsk, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		oneToOneAskService.writeOneToOneAsk(reqOneToOneAsk, principalDetails.getUser());

		int userId = reqOneToOneAsk.getUser().getId();
		String title = reqOneToOneAsk.getTitle();
		List<OneToOneAsk> contents = oneToOneAskService.getOneToOneAskList();
		model.addAttribute("userId", userId);
		model.addAttribute("title", title);
		model.addAttribute("contents", contents);

		return "redirect:/view-more/one-to-one-ask";
	}

}
