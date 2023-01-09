package com.clickgo.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.OneToOneAsk;
import com.clickgo.project.entity.OneToOneAnswer;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IOneToOneAnswerRepository;
import com.clickgo.project.repository.IOneToOneAskRepository;

@Service
public class OneToOneAnswerService {

	@Autowired
	private IOneToOneAnswerRepository iOneToOneAnswerRepository;
	
	@Autowired
	private IOneToOneAskRepository iOneToOneAskRepository;

	@Transactional
	public void writeAnswer(int askId, OneToOneAsk reqOneToOneAskEntity, OneToOneAnswer reqOneToOneAnswerEntity, User user) {
		Optional<OneToOneAsk> oneToOneAskEntity = iOneToOneAskRepository.findById(askId);
		oneToOneAskEntity.get().setAnswer(true);
		reqOneToOneAnswerEntity.setOneToOneAsk(reqOneToOneAskEntity);
		reqOneToOneAnswerEntity.setContent(reqOneToOneAnswerEntity.getContent());
		reqOneToOneAnswerEntity.setUser(user);
		iOneToOneAnswerRepository.save(reqOneToOneAnswerEntity);
	}

	@Transactional
	public List<OneToOneAnswer> getAnswerList() {
		return iOneToOneAnswerRepository.findAll();
	}
}
