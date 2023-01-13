package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Review;
import com.clickgo.project.entity.ReviewReply;
import com.clickgo.project.entity.Store;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.service.ReviewReplyService;
import com.clickgo.project.service.ReviewService;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/review")
public class ReviewApiController {

	@Autowired
	private ReviewReplyService reviewReplyService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private StoreService storeService;

	@PostMapping("/reply/save/{id}")
	public ResponseDto<?> saveReviewReply(@PathVariable int id, @RequestBody ReviewReply reviewReply,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Review reviewEntity = reviewService.findById(id);
		reviewReply.setReview(reviewEntity);
		if (principalDetails.getUser().getRole().equals(RoleType.HOST)) {
			reviewReplyService.save(reviewReply);
			return new ResponseDto<>(true, "정상적으로 작성 되었습니다.");
		}
		return new ResponseDto<>(false, "음.. 해커이신가요...");
	}
}
