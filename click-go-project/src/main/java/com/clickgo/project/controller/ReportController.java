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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Report;
import com.clickgo.project.entity.ReportReply;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.service.ReportReplyService;
import com.clickgo.project.service.ReportService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private ReportReplyService reportReplyService;

		@GetMapping("/report-list/{myList}")
		public String reportList(Model model,
				@PageableDefault(size = 5, sort = "id", direction = Direction.DESC) Pageable pageable,
				@AuthenticationPrincipal PrincipalDetails principalDetails, @PathVariable(required = false) int myList) {
		Page<Report> reports = null;
		if (principalDetails.getUser().getRole().equals(RoleType.GEUST)) {
			reports = reportService.findByUserIdToUSER(principalDetails.getUser().getId(), pageable);
		} else if (principalDetails.getUser().getRole().equals(RoleType.HOST)) {
			if (myList == 1) {
				reports = reportService.findByUserIdToUSER(principalDetails.getUser().getId(), pageable);
			} else {
				reports = reportService.findByUserIdToSTORE(principalDetails.getUser().getId(), pageable);
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
		System.out.println(reports.getContent());
		franchiseMassageCount(model);
		return "/user/my/report/list";
	}

	@GetMapping("/detail/{id}")
	public String reportDetail(@PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		Report reportEntity = reportService.findByIdAndUserId(id, principalDetails.getUser());
		ReportReply reportReplyEntity = reportReplyService.findByReportId(reportEntity.getId());
		if (reportReplyEntity != null) {
			reportService.findById(reportEntity.getId());
		}
		model.addAttribute("report", reportEntity);
		model.addAttribute("reportReply", reportReplyEntity);
		franchiseMassageCount(model);
		return "user/my/report/detail";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}
}
