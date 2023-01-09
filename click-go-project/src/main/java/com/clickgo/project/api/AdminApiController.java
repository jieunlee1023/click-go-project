package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.UserService;

@RestController
@RequestMapping("/admin")
public class AdminApiController {

	@Autowired
	private UserService userService;

	@PostMapping("/reportCountPlus")
	public ResponseDto<?> reportCountPlus(@RequestBody User user, Model model) {
		boolean success = userService.updateReportCountPlus(user);
		return new ResponseDto<>(success,
				"고유번호 (" + user.getId() + ")님의 신고 횟수를 " + (user.getReportCount() + 1) + "로 설정했습니다.");
	}

	@PostMapping("/reportCountMinus")
	public ResponseDto<?> reportCountMinus(@RequestBody User user, Model model) {
		boolean success = userService.updateReportCountMinus(user);
		if (success == true) {
			return new ResponseDto<>(success,
					"고유번호 (" + user.getId() + ")님의 신고 횟수를 " + (user.getReportCount() - 1) + "로 설정했습니다.");
		}
		return new ResponseDto<>(success, "신고는 0이하로 줄일 수 없습니다.");
	}

}
