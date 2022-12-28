package com.clickgo.project.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.Store;
import com.clickgo.project.dto.res.StoreApply;
import com.clickgo.project.repository.IStoreApplyRepository;

@Service
public class StoreService {

	@Autowired
	private IStoreApplyRepository storeApplyRepository;

	@Transactional
	public boolean apply(StoreApply storeApply) {

		storeApplyRepository.save(storeApply);

		return true;
	}
}
