package com.clickgo.project.service;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.repository.IStoreRepository;

@Service
public class StoreService {

	@Autowired
	private IStoreRepository storeRepository;

	@Transactional
	public Store findById(int id) {
		return storeRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 가맹점이 존재하지 않습니다.");
		});
	}
	
	@Transactional
	public List<Store> getStoreAllList() {
		return storeRepository.findAll();
	}
	
	@Transactional
	public List<Store> findAllByUserId(int id) {
		return storeRepository.findAllByUserId(id);
	}
}
