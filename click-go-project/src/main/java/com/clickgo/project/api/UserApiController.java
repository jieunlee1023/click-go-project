package com.clickgo.project.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserApiController {

	private final UserService userService;

	@PostMapping("/sign-up")
	public ResponseDto<?> signUp(@RequestBody User user) {
		System.out.println(user);
		boolean success = userService.signUp(user);
		return new ResponseDto<>(success, user.getUsername() + "님 회원가입을 진심으로 축하드립니다. ");
	}

}
