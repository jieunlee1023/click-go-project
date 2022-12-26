package com.clickgo.project.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.common.OAuthToken;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.dto.res.naverLogin.NaverProfile;
import com.clickgo.project.model.enums.LoginType;

@Controller
public class UserController {

	@Value("${click_go.key}")
	private String clickGoKey;

	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}

	@GetMapping("/auth/naver/callback")
	public String NaverCallback(@RequestParam String code, @RequestParam String state) {

		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "BvSSlS3rTAUDe0wev5Qa");
		params.add("client_secret", "uhjzmVB5cj");
		params.add("code", code);
		params.add("state", state);

		HttpEntity<MultiValueMap<String, String>> requestNaverToken = new HttpEntity<>(params, headers);

		ResponseEntity<OAuthToken> response = rt.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST,
				requestNaverToken, OAuthToken.class);

		OAuthToken authToken = response.getBody();

		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + authToken.accessToken);
		headers2.add("Content-type", "application/x-www-form-urlencoded;");

		HttpEntity<MultiValueMap<String, String>> requestNaverToken2 = new HttpEntity<>(headers2);

		ResponseEntity<NaverProfile> response2 = rt.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.POST,
				requestNaverToken2, NaverProfile.class);

		NaverProfile account = response2.getBody();

		User naverUser = User.builder().username(account.response.name + "_" + account.response.id)
				.email(account.response.email).password(clickGoKey).loginType(LoginType.NAVER)
				.phoneNumber(account.response.mobile).build();

//		User orginUser = userService.searchUserName(naverUser.getUsername());
//
//		if (orginUser.getUsername() == null) {
//			userService.saveUser(naverUser);
//		}
//
//		Authentication authentication = authenticationManager
//				.authenticate(new UsernamePasswordAuthenticationToken(naverUser.getUsername(), tencoKey));
//		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}
}
