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
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Review;
import com.clickgo.project.entity.ReviewReply;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IReviewReplyRepository;
import com.clickgo.project.service.ReviewReplyService;
import com.clickgo.project.service.ReviewService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ReviewReplyService reviewReplyService;


	@Autowired
	private StoreService storeService;

	@GetMapping({ "", "/" })
	public String reviewList(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails,
			@PageableDefault(size = 10, sort = "id", direction = Direction.DESC) Pageable pageable) {
		User user = principalDetails.getUser();
		Page<Review> reviewList = reviewService.findByuserId(user, pageable);
		if (reviewList != null) {
			int PAGENATION_BLOCK_COUNT = 2;
			int nowPage = reviewList.getNumber() + 1;
			int startPage = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
			int endPage = Math.min(nowPage + PAGENATION_BLOCK_COUNT, reviewList.getTotalPages());
			List<Integer> pageNumbers = new ArrayList<>();

			for (int i = startPage; i <= endPage; i++) {
				pageNumbers.add(i);
			}
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("pageNumbers", pageNumbers);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		}
		franchiseMassageCount(model);


		return "/user/my/review/list";
	}

	@PostMapping("/save/{storeId}")
	public String save(@PathVariable int storeId, Review review,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		try {
			Store storeEntity = storeService.findById(storeId);
			review.setStore(storeEntity);
			review.setStarScore(review.getStarScore());
			review.setUser(principalDetails.getUser());
			reviewService.save(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/review/";
	}

	@GetMapping("/detail/{id}")
	public String reviewDetail(@PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		Review reviewEntity = reviewService.findById(id);
		ReviewReply reviewReplyEntity = reviewReplyService.findByReviewId(id);
		User userEntity = principalDetails.getUser();
		model.addAttribute("review", reviewEntity);
		model.addAttribute("reviewReply", reviewReplyEntity);
		model.addAttribute("role", userEntity.getRole());
		return "/user/my/review/detail";
	}

	@GetMapping("/{storeId}")
	public String saveReview(@PathVariable int storeId, Model model) {
		Store storeEntity = storeService.findById(storeId);
		model.addAttribute("store", storeEntity);
		return "/user/my/review/save-form";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}
}
