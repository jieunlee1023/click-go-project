package com.clickgo.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestFileDto;
import com.clickgo.project.entity.Store;
import com.clickgo.project.repository.IStoreRepository;

@Service
public class StoreService {

	@Autowired
	private IStoreRepository storeRepository;

	@Value("${licenceFile.path}")
	private String licenceFile;
	
	@Value("${phoneNumber.key}")
	private String phoneNumber;
	
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

	@Transactional
	public Store update(Store store, int userId) {
		Store storeEntity = storeRepository.findById(store.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("수정하시려는 가맹점을 찾을 수 없습니다.");
		});
		if (storeEntity.getUser().getId() == userId) {
			storeEntity.setCategory(store.getCategory());
			storeEntity.setStoreAddress(store.getStoreAddress());
			storeEntity.setStoreTotalRoomCount(store.getStoreTotalRoomCount());
			if (store.getStoreTEL() == null) {
				storeEntity.setStoreTEL(phoneNumber);
			}
		}
		return storeEntity;
	}
}
