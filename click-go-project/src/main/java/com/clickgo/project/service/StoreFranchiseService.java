package com.clickgo.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IStoreFranchiseRepository;
import com.clickgo.project.repository.IUserRepository;

@Service
public class StoreFranchiseService {
	@Autowired
	private IStoreFranchiseRepository franchiseRepository;
	@Autowired
	private IUserRepository userRepository;

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

	@Transactional
	public boolean deleteByIdAndUserApprove(int id, int userId) {
		franchiseRepository.deleteById(id);
		userRepository.findById(userId).get().setRole(RoleType.HOST);
		System.out.println(">>>>>>>"+userRepository.findById(userId).get().getRole());
		return true;
	}
}
