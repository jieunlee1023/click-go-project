package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Report;
import com.clickgo.project.entity.ReportReply;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IReportReplyRepository;
import com.clickgo.project.service.ReportReplyService;
import com.clickgo.project.service.ReportService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private ReportReplyService reportReplyService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private UserService userService;

	@Autowired
	private IReportReplyRepository reportReplyRepository;

	@GetMapping("/list/{myList}")
	public String reportList(Model model,
			@PageableDefault(size = 1000, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetails principalDetails, @PathVariable(required = false) int myList) {
		Page<Report> reports = null;
		if (principalDetails.getUser().getRole().equals(RoleType.GEUST)) {
			reports = reportService.findByUserIdToSTORE(principalDetails.getUser().getId(), pageable);
		} else if (principalDetails.getUser().getRole().equals(RoleType.HOST)) {
			if (myList == 1) {
				reports = reportService.findByStoreIdToSTORE(principalDetails.getUser().getId(), pageable);
			} else {
				reports = reportService.findByUserIdToUSER(principalDetails.getUser().getId(), pageable);
			}
		}

		if (reports != null) {

			int PAGENATION_BLOCK_COUNT = 2;
			int nowPage = reports.getNumber() + 1;
			int startPage = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
			int endPage = Math.min(nowPage + PAGENATION_BLOCK_COUNT, reports.getTotalPages());
			List<Integer> pageNumbers = new ArrayList<>();

			for (int i = startPage; i <= endPage; i++) {
				pageNumbers.add(i);
			}
			model.addAttribute("myList", myList);
			model.addAttribute("reports", reports);
			model.addAttribute("pageNumbers", pageNumbers);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		}
		franchiseMassageCount(model);
		return "/user/my/report/list";
	}

	@GetMapping("/{reservationId}")
	public String saveReport(@PathVariable int reservationId,
			@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		Reservation reservationEntity = reservationService.findById(reservationId);
		RoleType role = principalDetails.getUser().getRole();
		Store storeEntity = storeService.findById(reservationEntity.getStore().getId());
		User userEntity = userService.findById(reservationEntity.getUser().getId());
		model.addAttribute("store", storeEntity);
		model.addAttribute("user", userEntity);
		model.addAttribute("reservationId", reservationEntity.getId());
		model.addAttribute("role", role);
		franchiseMassageCount(model);
		return "user/my/report/save-form";
	}

	@GetMapping("/detail/{reportId}")
	public String detail(@PathVariable int reportId, Model model) {
		Report reportEntity = reportService.findById(reportId);
		model.addAttribute("report", reportEntity);
		
		List<ReportReply> reportReplys = reportReplyRepository.findAll();
		model.addAttribute("reportReplys", reportReplys);
		franchiseMassageCount(model);
		return "/user/my/report/detail";
	}

	@PostMapping("/reply/save")
	public String reportReplySave(@RequestParam Report reportId, ReportReply reportReply, Model model) {
		reportReplyService.saveReply(reportId, reportReply);
		franchiseMassageCount(model);
		return "redirect:/admin/report";
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
