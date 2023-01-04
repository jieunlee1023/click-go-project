package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IOneOnOneRepository;

@Service
public class OneOnOneService {

	@Autowired
	private IOneOnOneRepository iOneOnOneRepository;

	public void writeOOO(OneOnOne requestOoo, User user) {
		requestOoo.setContent(requestOoo.getContent());
		requestOoo.setUser(user);
		iOneOnOneRepository.save(requestOoo);
	}

	public List<OneOnOne> getContentList() {
		return iOneOnOneRepository.findAll();
	}

}
