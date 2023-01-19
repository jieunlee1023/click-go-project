package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Review;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private IReviewRepository reviewRepository;

	@Autowired
	private UserService userService;

	@Transactional
	public Page<Review> findByuserId(User user, Pageable pageable) {
		int userId = user.getId();
		if (user.getRole() == RoleType.GEUST) {
			return reviewRepository.findByUserId(userId, pageable);
		} else {
			return reviewRepository.findByStoreUserId(userId, pageable);
		}
	}

	@Transactional
	public Review findById(int id) {
		return reviewRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 리뷰가 존재하지 않습니다.");
		});
	}

	@Transactional
	public void save(Review review) {
		User userEntity = userService.findById(review.getUser().getId());
		userEntity.setPoint((review.getUser().getPoint() + 100));
		reviewRepository.save(review);
	}

	@Transactional
	public List<Review> findByStoreId(int storeId) {
		return reviewRepository.findByStoreId(storeId);
	}

	@Transactional
	public Review findAvgStarScoreByStoreId(int storeId) {
		return reviewRepository.findAvgStarScoreByStoreId(storeId);
	}
}
