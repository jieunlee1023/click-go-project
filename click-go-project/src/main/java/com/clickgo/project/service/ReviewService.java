package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.clickgo.project.entity.Review;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private IReviewRepository reviewRepository;

	public Page<Review> findByuserId(User user, Pageable pageable) {
		int userId = user.getId();
		if (user.getRole() == RoleType.GEUST) {
			return reviewRepository.findByUserId(userId, pageable);
		} else {
			return reviewRepository.findByStoreUserId(userId, pageable);
		}
	}

	public Review findById(int id) {
		return reviewRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 리뷰가 존재하지 않습니다.");
		});
	}

	public void save(Review review) {
		reviewRepository.save(review);
	}

	public List<Review> findByStoreId(int storeId) {
		return reviewRepository.findByStoreId(storeId);
	}
}
