package com.clickgo.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.common.OAuthToken;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.dto.res.naverLogin.NaverProfile;
import com.clickgo.project.model.enums.LoginType;
import com.clickgo.project.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@Value("${click_go.key}")
	private String clickGoKey;

	@GetMapping("/auth/join_form")
	public String joinForm() {
		return "user/join_form";
	}

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

		ResponseEntity<NaverProfile> response2 = rt2.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.POST,
				requestNaverToken2, NaverProfile.class);

		NaverProfile account = response2.getBody();

		User naverUser = User.builder().username(account.response.name + "_" + account.response.id)
				.email(account.response.email).password(clickGoKey).loginType(LoginType.NAVER)
				.phoneNumber(account.response.mobile).build();

		User orginUser = userService.searchUserName(naverUser.getUsername());

		System.err.println(orginUser.getUsername());
		System.err.println(naverUser.getUsername());

		if (orginUser.getUsername() == null) {
			userService.signUp(naverUser);
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(naverUser.getUsername(), clickGoKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

//	@GetMapping("/auth/kakao/callback")
//	@ResponseBody // data를 리턴함
//	public String kakaoCallback(@RequestParam String code) {
//		System.err.println(code);
//		RestTemplate rt = new RestTemplate();
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
//
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//		params.add("grant_type", "authorization_code");
//		params.add("client_id", "cfa26e4df221d547437be19dcc30de42"); // RestApi
//		params.add("redirect_uri", "http://localhost:7777/oauth/kakao/callback");
//		params.add("code", code);
//
//		HttpEntity<MultiValueMap<String, String>> requestKakaoToken = new HttpEntity<>(params, headers);
//		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
//				requestKakaoToken, String.class);
//
//		String authToken = response.getBody();
//		return authToken;
//	}

}
