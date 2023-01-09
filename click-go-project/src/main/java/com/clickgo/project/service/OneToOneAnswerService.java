package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.OneToOneAsk;
import com.clickgo.project.entity.OneToOneAnswer;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.iOneToOneAnswerRepository;

@Service
public class OneToOneAnswerService {

	@Autowired
	private iOneToOneAnswerRepository iOneToOneAnswerRepository;
	
	
//	이거하는중 01-06 wlsWK제ㅐ발 
	@Transactional
	public void writeAnswer(OneToOneAsk reqOneToOneAskEntity, OneToOneAnswer reqOneToOneAnswerEntity, User user) {
		reqOneToOneAnswerEntity.setOneToOneAsk(reqOneToOneAskEntity);
		reqOneToOneAnswerEntity.setContent(reqOneToOneAnswerEntity.getContent());
		reqOneToOneAnswerEntity.setUser(user);
		iOneToOneAnswerRepository.save(reqOneToOneAnswerEntity);
	} 
//이거하는중 01-06 wlsWK제ㅐ발 


	@Transactional
	public List<OneToOneAnswer> getAnswerList() {
		// TODO Auto-generated method stub
		return iOneToOneAnswerRepository.findAll();
	}
}
