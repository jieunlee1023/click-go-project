package com.clickgo.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.Store;
import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IStoreFranchiseRepository;
import com.clickgo.project.repository.IStoreRepository;
import com.clickgo.project.repository.IUserRepository;

@Service
public class StoreFranchiseService {
	@Autowired
	private IStoreFranchiseRepository franchiseRepository;
	@Autowired
	private IUserRepository userRepository;
	@Autowired
	private IStoreRepository storeRepository;

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
	public boolean deleteByIdAndUserApprove(int id,int userId,StoreFranchise storeFranchise, Store store) {

		franchiseRepository.deleteById(storeFranchise.getId());
		userRepository.findById(userId).get().setRole(RoleType.HOST);
		
//		store.setKategory(storeFranchise.getCategory());
		store.setStoreName(storeFranchise.getStoreName());
		store.setStoreTEL(storeFranchise.getStoreTEL());
		store.setStoreAddress(storeFranchise.getStoreAddress());
		store.setStoreTotalRoomCount(0);
		store.setUser(userRepository.findById(userId).get());
		
		storeRepository.save(store);

		return true;
	}
}
