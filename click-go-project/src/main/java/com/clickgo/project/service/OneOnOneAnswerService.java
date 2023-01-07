package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.OneOnOneAnswer;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.iOneOnOneAnswerRepository;

@Service
public class OneOnOneAnswerService {

	@Autowired
	private iOneOnOneAnswerRepository iOneOnOneAnswerRepository;
	
	
//	이거하는중 01-06 wlsWK제ㅐ발 
	@Transactional
	public void writeAnswer(OneOnOne oneOnOneEntity, OneOnOneAnswer oooAnswer, User user) {
		oooAnswer.setOoo(oneOnOneEntity);
		oooAnswer.setContent(oooAnswer.getContent());
		oooAnswer.setUser(user);
		iOneOnOneAnswerRepository.save(oooAnswer);
	} 
//이거하는중 01-06 wlsWK제ㅐ발 


	@Transactional
	public List<OneOnOneAnswer> getAnswerList() {
		// TODO Auto-generated method stub
		return iOneOnOneAnswerRepository.findAll();
	}
}
