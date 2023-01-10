package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.OneToOneAsk;
import com.clickgo.project.entity.OneToOneAnswer;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IOneToOneAskRepository;
import com.clickgo.project.repository.IOneToOneAnswerRepository;

@Service
public class OneToOneAskService {

	@Autowired
	private IOneToOneAskRepository iOneToOneAskRepository;

	public void writeOneToOneAsk(OneToOneAsk reqOneToOneAskEntity, User user) {
		reqOneToOneAskEntity.setTitle(reqOneToOneAskEntity.getTitle());
		reqOneToOneAskEntity.setContent(reqOneToOneAskEntity.getContent());
		reqOneToOneAskEntity.setUser(user);
		reqOneToOneAskEntity.setAnswer(false);
		iOneToOneAskRepository.save(reqOneToOneAskEntity);
	}

	@Transactional
	public OneToOneAsk oneToOneAskContent(int id) {
		return iOneToOneAskRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당글 없음");
		});
	}

	@Transactional
	public OneToOneAsk findByOneToOneAskId(int oneToOneAskId) {
		return iOneToOneAskRepository.findById(oneToOneAskId).orElseThrow(() -> {
			return new IllegalArgumentException("없음..");
		});
	}

	@Transactional
	public List<OneToOneAsk> getOneToOneAskList() {
		// TODO Auto-generated method stub
		return iOneToOneAskRepository.findAll();
	}

	@Transactional
	public Page<OneToOneAsk> searchAsk(String q, Pageable pageable) {
		return iOneToOneAskRepository.findByTitleContaining(q, pageable);
	}
}
