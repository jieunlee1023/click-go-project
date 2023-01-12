package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.LikeStore;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;
import com.clickgo.project.service.WishListService;

@RestController
@RequestMapping("/api/like-store")
public class WishListApiController {

	@Autowired
	private WishListService wishListService;

	@PostMapping("/{likeStoreId}/{storeId}")
	public ResponseDto<?> likeStore(@PathVariable int likeStoreId, @PathVariable int storeId,
			@RequestBody LikeStore likeStore, @AuthenticationPrincipal PrincipalDetails details) {
		if (details == null) {
			return new ResponseDto<>(false, "위시리스트 기능은 로그인 후 이용가능합니다.");
		} else {
			if (likeStoreId == 0) {
				boolean likeStoreEntity = wishListService.save(storeId, likeStore, details);
				if (likeStore.isLikeStore() == true) {
					return new ResponseDto<>(likeStoreEntity, "좋아요");
				} else {
					return new ResponseDto<>(likeStoreEntity, "좋아요해제");
				}
			} else {
				boolean likeStoreEntity = wishListService.update(likeStoreId, likeStore);
				if (likeStore.isLikeStore() == true) {
					return new ResponseDto<>(likeStoreEntity, "좋아요");
				} else {
					return new ResponseDto<>(likeStoreEntity, "좋아요해제");
				}
			}
		}
	}

	@GetMapping("/delete/{id}")
	public ResponseDto<?> deleteLikeStore(@PathVariable int id) {
		try {
			wishListService.delete(id);
			return new ResponseDto<>(true, "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseDto<>(false, "오류 발생");
	}
}
