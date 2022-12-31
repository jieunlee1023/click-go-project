package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.ReviewReply;

public interface IReviewReplyRepository extends JpaRepository<ReviewReply, Integer> {

	@Query(value = " SELECT * "
								+ " FROM reviewreply "
								+ " WHERE reviewId = ?1 "
								, nativeQuery = true)
	ReviewReply findByReviewId(int id);

}
