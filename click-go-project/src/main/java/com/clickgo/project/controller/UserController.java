package com.clickgo.project.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.res.GoogleToken;
import com.clickgo.project.dto.res.GoogleUserDto;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.model.enums.LoginType;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserController {

	private AuthenticationManager authenticationManager;

	@GetMapping("/auth/login_form")
	public String login_form() {
		return "/user/login";
	}

	@GetMapping("/auth/join_form")
	public String join_form() {
		return "/user/join_form";
	}

	@GetMapping("/api/google/callback")
	@ResponseBody
	public String googleCallback(@RequestParam String code, @RequestParam String scope) {

		System.err.println(code);
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("client_id", "182145852170-7h7g9dmnjs01k3fqq94pcbi8v1p964an.apps.googleusercontent.com");
		params.add("client_secret", "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");
		params.add("code", code);
		params.add("grant_type", "authorization_code");
		params.add("redirect_uri", "http://localhost:7777/api/google/callback");

		HttpEntity<MultiValueMap<String, String>> requestGoogle = new HttpEntity<>(params, headers);

		ResponseEntity<GoogleToken> response = restTemplate.exchange("https://oauth2.googleapis.com/token",
				HttpMethod.POST, requestGoogle, GoogleToken.class);
		GoogleToken googleToken = response.getBody();

		///////////////////////////////////////////////////////////////
		String accessToken = googleToken.accessToken;
		String tokenType = googleToken.tokenType;

		RestTemplate template = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", tokenType + accessToken);
		httpHeaders.add("Content-type", "application/x-www-form-urlencoded;");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(httpHeaders);
		ResponseEntity<GoogleUserDto> googleUserInfo = template.exchange(
				"https://www.googleapis.com/oauth2/v1/userinfo", HttpMethod.GET, request, GoogleUserDto.class);

		GoogleUserDto account = googleUserInfo.getBody();
//		User googleUser = User.builder().username(account.id).email("").loginType(LoginType.GOOGLE).phoneNumber("").password(tokenType)
		return "";
	}
}
