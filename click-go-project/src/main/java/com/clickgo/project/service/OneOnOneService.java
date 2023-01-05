package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IOneOnOneRepository;

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

	public List<OneOnOne> getContentList() {
		return iOneOnOneRepository.findAll();
	}

	@Transactional
	public Object oooAnswer(int id) {
		return iOneOnOneRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당글 없음");
		});
	}

}
