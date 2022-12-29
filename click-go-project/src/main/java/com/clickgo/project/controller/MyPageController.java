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
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ReservationService reservationService;

	@GetMapping({ "", "/" })
	public String myPage(Model model) {
		franchiseMassageCount(model);
		return "/user/my/mypage";

	}

	@GetMapping("/reservation-list")
	public String reservationList(Model model,
			@PageableDefault(size = 2, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {

		Page<Reservation> reservations = reservationService.searchBoard(principalDetails.getUser(), pageable);

		int PAGENATION_BLOCK_COUNT = 2;
		int nowPage = reservations.getNumber() + 1;
		int startPage = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPage = Math.min(nowPage + PAGENATION_BLOCK_COUNT, reservations.getTotalPages());

		List<Integer> pageNumbers = new ArrayList<>();

		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}
		franchiseMassageCount(model);

		model.addAttribute("reservations", reservations);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "/user/my/reservations";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}
}
