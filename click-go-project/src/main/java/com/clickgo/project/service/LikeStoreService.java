package com.clickgo.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.LikeStore;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.ILikeStoreRepository;
import com.clickgo.project.repository.IStoreRepository;
import com.clickgo.project.repository.IUserRepository;

@Service
public class LikeStoreService {

	@Autowired
	private IUserRepository userRepository;

	@Autowired
	private IStoreRepository storeRepository;

	@Autowired
	private ILikeStoreRepository likeStoreRepository;

	@Transactional
	public boolean save(int storeId, LikeStore likeStore, PrincipalDetails details) {
		Store storeEntity = storeRepository.findById(storeId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 가맹점은 존재하지 않습니다.");
		});
		User userEntity = userRepository.findById(details.getUser().getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 이용자는 존재하지 않습니다.");
		});

		if (likeStore.isLikeStore() == true) {
			// 좋아요 한 상태 (채워진 하트)
			likeStore.setStore(storeEntity);
			likeStore.setUser(userEntity);
			likeStore.setLikeStore(true);
			likeStoreRepository.save(likeStore);
			return true;
		} else {
			likeStore.setStore(storeEntity);
			likeStore.setUser(userEntity);
			likeStore.setLikeStore(false);
			likeStoreRepository.save(likeStore);
			return true;
		}
	}

	@Transactional
	public boolean update(int likeStoreId, LikeStore likeStore) {

		LikeStore likeStoreEntityId = likeStoreRepository.findById(likeStoreId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 위시 리스트 아이디가 존재하지 않습니다.");
		});
		if (likeStore.isLikeStore() == true) {
			likeStoreEntityId.setLikeStore(true);
			return true;
		} else {
			likeStoreEntityId.setLikeStore(false);
			return true;
		}

	}

}
