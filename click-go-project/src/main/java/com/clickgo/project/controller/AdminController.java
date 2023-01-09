package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.OneToOneAsk;
import com.clickgo.project.entity.OneToOneAnswer;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.OneToOneAnswerService;
import com.clickgo.project.service.OneToOneAskService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private OneToOneAskService oneToOneAskService;

	@Autowired
	private OneToOneAnswerService oneToOneAnswerService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@GetMapping("/main")
	public String adminPage(Model model) {
		franchiseMassageCount(model);
		return "admin/main";
	}

	@GetMapping("/sales")
	public String adminSales() {
		return "admin/sales";
	}

	@GetMapping("/reservation")
	public String adminreservation() {
		return "admin/reservation";
	}

	@GetMapping("/report")
	public String adminReport() {
		return "admin/report";
	}

	@GetMapping({ "/user", "/user-search" })
	public String adminUserInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.ASC) Pageable pageable) {

		String searchUserInfo = q == null ? "" : q;
//		Page<User> users = userService.getUserList(pageable);
		Page<User> users = userService.searchUserInfo(searchUserInfo, pageable);

		int PAGENATION_BLOCK_COUNT = 10;

		int nowPage = users.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, users.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("users", users);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchUserInfo);

		franchiseMassageCount(model);
		return "admin/user";
	}

	@GetMapping({ "/store", "/store-search" })
	public String adminStoreInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.ASC) Pageable pageable) {
		String searchStoreName = q == null ? "" : q;

//		Page<Store> stores = storeService.getStoreAllList(pageable);
		Page<Store> stores = storeService.searchStoreList(searchStoreName, pageable);

		int PAGENATION_BLOCK_COUNT = 3;

		int nowPage = stores.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, stores.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("stores", stores);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchStoreName);

		franchiseMassageCount(model);

		return "admin/store";

	}

	@GetMapping({ "/one-to-one-list", "/one-to-one-search" })
	public String oneToOneList(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.DESC) Pageable pageable) {
		String searchTitle = q == null ? "" : q;

//		List<OneToOneAsk> askList = oneToOneAskService.getOneToOneAskList();
		Page<OneToOneAsk> askPage = oneToOneAskService.searchAsk(searchTitle, pageable);

		int PAGENATION_BLOCK_COUNT = 10;

		int nowPage = askPage.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, askPage.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("askPage", askPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchTitle);

		return "admin/one-to-one-list";
	}

	// s w
	@GetMapping("/one-to-one-answer/{id}")
	public String showOnToOneAnswer(@PathVariable int id, Model model) {

		List<OneToOneAsk> askList = oneToOneAskService.getOneToOneAskList();
		List<OneToOneAnswer> answerList = oneToOneAnswerService.getAnswerList();
		OneToOneAsk askEntity = oneToOneAskService.findByOneToOneAskId(id);

		model.addAttribute("askEntity", askEntity);
		model.addAttribute("askList", askList);
		model.addAttribute("answerList", answerList);
		return "admin/one-to-one-answer";
	}

	//
	@PostMapping("/one-to-one-answer")
	public String saveAnswer(@RequestParam int askId, OneToOneAnswer AnswerEntity,
			@AuthenticationPrincipal PrincipalDetails details, Model model) {
		OneToOneAsk askEntity = oneToOneAskService.findByOneToOneAskId(askId);
		oneToOneAnswerService.writeAnswer(askEntity, AnswerEntity, details.getUser());
		List<OneToOneAnswer> answerList = oneToOneAnswerService.getAnswerList();

		int answerAdminId = AnswerEntity.getUser().getId();
		String answerContent = AnswerEntity.getContent();

		model.addAttribute("answerAdminId", answerAdminId);
		model.addAttribute("answerContent", answerContent);
		model.addAttribute("answerList", answerList);

		return "redirect:/admin/one-to-one-list";
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
