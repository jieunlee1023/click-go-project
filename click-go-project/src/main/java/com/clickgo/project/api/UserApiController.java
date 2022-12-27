package com.clickgo.project.api;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserApiController {

	private final UserService userService;
	private final AuthenticationManager authenticationManager;

	@PostMapping("/sign-up")
	public ResponseDto<?> signUp(@RequestBody User user) {
		boolean success = userService.signUp(user);
		return new ResponseDto<>(success, user.getUsername() + "님 회원가입을 진심으로 축하드립니다. ");
	}

	@PostMapping("/update")
	public ResponseDto<?> update(@RequestBody User user) {
		System.out.println(user);
		userService.updateUser(user);

		return new ResponseDto<>(true, "회원정보 수정에 성공하셨습니다 !!");
	}

	@PostMapping("/update/pwd")
	public ResponseDto<?> pwdUpdate(@RequestBody User user) {

		try {
			userService.pwdUpdateUser(user);
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return new ResponseDto<>(true, "비밀번호 수정에 성공하셨습니다 !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "비밀번호 수정에 실패하셨습니다. 비밀번호를 확인해주세요..");
		}
	}
}
