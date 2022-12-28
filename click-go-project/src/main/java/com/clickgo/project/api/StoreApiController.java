package com.clickgo.project.api;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/store")
public class StoreApiController {

//	@Autowired
//	private StoreService storeService;
//
//	@PostMapping("/apply")
//	public ResponseDto<?> storeApply(@RequestBody StoreApply storeApply , Model model) {
//		boolean success = storeService.apply(storeApply);
//
//		return new ResponseDto<>(success, "빠른 시일 내로 응답드리겠습니다. 신청해주셔서 감사합니다.");
//	}
}
