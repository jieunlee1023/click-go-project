package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.LikeStore;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.repository.IWishListRepository;

@Service
public class WishListService {

	@Autowired
	private IWishListRepository wishRepository;

	@Transactional
	public Page<LikeStore> findByCategory(int userId, String kategory, Pageable pageable) {
		System.out.println(kategory == null ? "이게 널이니..?" : "널 아니였음 ㅅㅂ ㅋㅋ");
		if (kategory == null) {
			return wishRepository.findByUserId(userId, pageable);
		}
		System.out.println("여기 들어옴 fucking");
		return wishRepository.findByCategory(userId, kategory, pageable);
	}

	public void save(Store storeEntity, User userEntity) {
		LikeStore likeStore = new LikeStore();
		likeStore.setStore(storeEntity);
		likeStore.setUser(userEntity);
		wishRepository.save(likeStore);
	}
}
