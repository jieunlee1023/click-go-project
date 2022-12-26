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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.res.User;
import com.clickgo.project.dto.res.kakao_login.KakaoAccount;
import com.clickgo.project.dto.res.kakao_login.KakaoProfile;
import com.clickgo.project.dto.res.kakao_login.OAuthToken;
import com.clickgo.project.model.enums.LoginType;
import com.clickgo.project.service.UserService;

@Controller
public class UserController {

	@Value("${clickgo.key}")
	private String clickGo;

	@Autowired
	private UserService userService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}

	@GetMapping("/auth/join_form")
	public String joinForm() {
		return "user/join_form";
	}

	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {
		System.err.println(code);
		RestTemplate rt = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded; charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "cfa26e4df221d547437be19dcc30de42"); // RestApi
		params.add("redirect_uri", "http://localhost:7777/auth/kakao/callback");
		params.add("code", code);

		System.err.println("1111");
		HttpEntity<MultiValueMap<String, String>> requestKakaoToken = new HttpEntity<>(params, headers);
		ResponseEntity<OAuthToken> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				requestKakaoToken, OAuthToken.class);

		OAuthToken authToken = response.getBody();
		System.out.println("authToken" + response.getBody());

		RestTemplate rt2 = new RestTemplate();

		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + authToken.accessToken);
		headers2.add("Content-Type", "application/x-www-form-urlencoded");

		HttpEntity<MultiValueMap<String, String>> kakaoDataRequset = new HttpEntity<>(headers2);

		ResponseEntity<KakaoProfile> kakaoDataResponse = rt2.exchange("https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST, kakaoDataRequset, KakaoProfile.class);

		System.err.println("kakaoDataResponse" + kakaoDataResponse);

		KakaoAccount account = kakaoDataResponse.getBody().kakaoAccount;

		User kakaoUser = User.builder().username(account.profile.nickname + "_" + kakaoDataResponse.getBody().id)
				.email(account.email).password(clickGo).loginType(LoginType.KAKAO).email("a@nave.com").phoneNumber("010-1234-1234").build();

		System.out.println("kakao >>> " + kakaoUser);

		User originUser = userService.searchUserName(kakaoUser.getUsername());

		if (originUser.getUsername() == null) {
			System.out.println("신규회원이기 때문에 회원 가입을 진행");
			userService.saveUser(kakaoUser);
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), clickGo));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

}
