package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;
import com.clickgo.project.service.WishListService;

@RestController
@RequestMapping("/api/like-store")
public class LikeStoreApiController {

	@Autowired
	private WishListService likeStoreService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private UserService userService;

	@GetMapping("/save/{storeId}")
	public ResponseDto<?> save(@PathVariable int storeId, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(storeId);
		User userEntity = userService.findById(principalDetails.getUser().getId());
		likeStoreService.save(storeEntity, userEntity);
		return new ResponseDto<>(true, "위시리스트에 추가되었습니다.");
	}
}
