package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Caution;
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

	@PostMapping("/caution/{userId}")
	public ResponseDto<?> caution(@PathVariable int userId, @RequestBody Caution caution) {
		boolean success = userService.sendCaution(userId, caution);
		return new ResponseDto<>(success, "고유번호 (" + userId + ")님에게 경고를 보냈습니다.");
	}

	@GetMapping("/cancel-caution")
	public ResponseDto<?> cancelCaution(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		boolean success = userService.cancelCaution(principalDetails.getUser().getId());
		return new ResponseDto<>(success, "/m-logout");
	}

	@PostMapping("/blacklist")
	public ResponseDto<?> blacklist(@RequestBody User user) {
		boolean success = userService.blacklist(user);
		return new ResponseDto<>(success, "고유번호 (" + user.getId() + ")님을 정지 시켰습니다.");
	}

	@PostMapping("/cancel-blacklist")
	public ResponseDto<?> cancelBlacklist(@RequestBody User user) {
		boolean success = userService.cancelBlacklist(user);
		return new ResponseDto<>(success, "고유번호 (" + user.getId() + ")님을 정지해제 시켰습니다.");
	}
}
