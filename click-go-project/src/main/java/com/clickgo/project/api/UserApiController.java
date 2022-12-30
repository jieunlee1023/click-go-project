package com.clickgo.project.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.controller.UserController;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserApiController {

	private final UserService userService;
	private final AuthenticationManager authenticationManager;

	@PostMapping("/sign-up")
	public ResponseDto<?> signUp(@RequestBody User user, Model model) {
		boolean success = userService.signUp(user);

		return new ResponseDto<>(success, user.getUsername() + "님 회원가입을 진심으로 축하드립니다. ");
	}

	@PostMapping("/update")
	public ResponseDto<?> pwdUpdate(@RequestBody User user) {

		try {
			userService.updateUser(user);
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return new ResponseDto<>(true, "회원정보 수정에 성공하셨습니다 !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "회원정보 수정에 실패하셨습니다...");
		}
	}

	@DeleteMapping("/delete/{userId}")
	public ResponseDto<?> userDelete(@PathVariable int userId, @AuthenticationPrincipal PrincipalDetails details,
			HttpServletRequest req, HttpServletResponse res) {
		try {
			userService.deleteUser(userId, details.getUser().getId());
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 세션 생성 x , 세션 가져오기
			if (authentication != null) {
				new SecurityContextLogoutHandler().logout(req, res, authentication);
				Thread.sleep(1000);
			}
			return new ResponseDto<>(true, "회원탈퇴에 성공하셨습니다 !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "회원탈퇴에 실패하셨습니다...");
		}
	}
}
