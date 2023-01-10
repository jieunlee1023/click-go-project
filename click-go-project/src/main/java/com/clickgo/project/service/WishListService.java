package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.LikeStore;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.ILikeStoreRepository;
import com.clickgo.project.repository.IStoreRepository;
import com.clickgo.project.repository.IUserRepository;
import com.clickgo.project.repository.IWishListRepository;

@Service
public class WishListService {

	@Autowired
	private IWishListRepository wishRepository;

	@Autowired
	private IUserRepository userRepository;

	@Autowired
	private IStoreRepository storeRepository;

	@Autowired
	private ILikeStoreRepository likeStoreRepository;

	@Transactional
	public Page<LikeStore> findByCategory(int userId, String category, Pageable pageable) {
		if (category == null) {
			return wishRepository.findByUserId(userId, pageable);
		}
		return wishRepository.findByCategory(userId, category, pageable);
	}

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

	@Transactional
	public List<LikeStore> findByUserId(int id) {
		User userEntity = userRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당 이용자는 존재하지 않습니다.");
		});
		return likeStoreRepository.findbyuserId(userEntity.getId());
	}

	@Transactional
	public LikeStore findById(int id) {
		return likeStoreRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당 위시 리스트 아이디가 존재하지 않습니다.");
		});
	}

	@Transactional
	public void delete(int id) {
		LikeStore likeStoreEntity = likeStoreRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당 위시 리스트 아이디가 존재하지 않습니다.");
		});
		likeStoreEntity.setLikeStore(false);
	}
}
