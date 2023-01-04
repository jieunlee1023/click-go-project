package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Store;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/store")
public class StoreApiController {

	@Autowired
	private StoreService storeService;

	@GetMapping("/map/{storeId}")
	public ResponseDto<?> map(@PathVariable int storeId) {
		Store storeEntity = storeService.findById(storeId);
		return new ResponseDto<>(true, storeEntity.getStoreAddress());
	}
}
