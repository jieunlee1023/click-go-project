package com.clickgo.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.repository.IStoreFranchiseRepository;

@Service
public class StoreFranchiseService {
	@Autowired
	private IStoreFranchiseRepository franchiseRepository;

	@Transactional
	public boolean apply(StoreFranchise storeFranchise, User user) {
		storeFranchise.setUser(user);
		franchiseRepository.save(storeFranchise);
		return true;
	}

	@Transactional
	public List<StoreFranchise> getMessageList() {
		return franchiseRepository.findAll();
	}
}
