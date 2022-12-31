package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.ReviewReply;
import com.clickgo.project.repository.IReviewReplyRepository;

@Service
public class ReviewReplyService {

	@Autowired
	private IReviewReplyRepository reviewReplyRepository;

	@Transactional
	public ReviewReply findByReviewId(int id) {
		return reviewReplyRepository.findByReviewId(id);
	}

	@Transactional
	public void save(ReviewReply reviewReply) {
		reviewReplyRepository.save(reviewReply);
	}
}
