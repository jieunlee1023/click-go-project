package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Report;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.service.ReportService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;

@RestController
@RequestMapping("/api/report")
public class ReportApiController {

	@Autowired
	private ReportService reportService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private UserService userService;

	@PostMapping("/save/{storeId}/{userId}")
	public ResponseDto<?> report(@PathVariable int storeId, @PathVariable int userId, @RequestBody Report report,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		try {
			Store storeEntity = storeService.findById(storeId);
			User userEntity = userService.findById(userId);
			// GEUST --> HOST
			if (principalDetails.getUser().getRole().equals(RoleType.GEUST)) {
				reportService.saveToSTORE(report, storeEntity, userEntity);
				// HOST --> GEUST
			} else if (principalDetails.getUser().getRole().equals(RoleType.HOST)) {
				reportService.saveToGEUST(report, storeEntity, userEntity);
			}
			return new ResponseDto<>(true, "회원님의 불만을 해소 시켜드리겠습니다. 감사합니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseDto<>(false, "오류가 발생했습니다. 관리자에게 문의해주세요.");
	}
}
