package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.OneOnOneAnswer;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IOneOnOneRepository;
import com.clickgo.project.repository.iOneOnOneAnswerRepository;

@Service
public class OneOnOneService {

	@Autowired
	private IOneOnOneRepository iOneOnOneRepository;

	public void writeOoo(OneOnOne requestOoo, User user) {
		requestOoo.setTitle(requestOoo.getTitle());
		requestOoo.setContent(requestOoo.getContent());
		requestOoo.setUser(user);
		iOneOnOneRepository.save(requestOoo);
	}


	@Transactional
	public OneOnOne oooAnswer(int id) {
		return iOneOnOneRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당글 없음");
		});
	}

	public OneOnOne findById(int oooId) {
		return iOneOnOneRepository.findById(oooId).orElseThrow(() -> {
			return new IllegalArgumentException("없음..");
		});
	}

	public List<OneOnOne> getOooList() {
		// TODO Auto-generated method stub
		return iOneOnOneRepository.findAll();
	}

}
