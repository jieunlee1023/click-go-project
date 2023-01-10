package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import com.clickgo.project.service.LikeStoreService;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/store")
public class StoreApiController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private LikeStoreService likeStoreService;

	@GetMapping("/map/{storeId}")
	public ResponseDto<?> map(@PathVariable int storeId) {
		Store storeEntity = storeService.findById(storeId);
		return new ResponseDto<>(true, storeEntity.getStoreAddress());
	}

	@PostMapping("/likeStore/{likeStoreId}/{storeId}")
	public ResponseDto<?> likeStore(@PathVariable int likeStoreId, @PathVariable int storeId,
			@RequestBody LikeStore likeStore, @AuthenticationPrincipal PrincipalDetails details) {

		System.out.println(likeStoreId);

		if (details == null) {
			return new ResponseDto<>(false, "위시리스트 기능은 로그인 후 이용가능합니다.");
		} else {
			if (likeStoreId == 0) {
				boolean likeStoreEntity = likeStoreService.save(storeId, likeStore, details);
				if (likeStore.isLikeStore() == true) {
					return new ResponseDto<>(likeStoreEntity, "좋아요");
				} else {
					return new ResponseDto<>(likeStoreEntity, "좋아요해제");
				}
			} else {
				boolean likeStoreEntity = likeStoreService.update(likeStoreId, likeStore);
				if (likeStore.isLikeStore() == true) {
					return new ResponseDto<>(likeStoreEntity, "좋아요");
				} else {
					return new ResponseDto<>(likeStoreEntity, "좋아요해제");
				}
			}
		}

	}
}
