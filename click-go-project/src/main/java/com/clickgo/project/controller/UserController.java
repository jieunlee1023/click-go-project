package com.clickgo.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.res.googleLogin.GoogleToken;
import com.clickgo.project.dto.res.googleLogin.GoogleUserDto;
import com.clickgo.project.dto.res.kakaoLogin.KakaoAccount;
import com.clickgo.project.dto.res.kakaoLogin.KakaoProfile;
import com.clickgo.project.dto.res.kakaoLogin.OAuthToken;
import com.clickgo.project.dto.res.naverLogin.NaverProfile;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.LoginType;
import com.clickgo.project.service.UserService;

@Controller
public class UserController {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserService userService;

	@Value("${click_go.key}")
	private String clickGoKey;

	@Value("${phoneNumber.key}")
	private String phoneNumber;

	@GetMapping("/auth/login-form")
	public String loginForm(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception, Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		return "user/login-form";
	}

	@GetMapping("/user/update-form")
	public String updateForm() {
		return "user/my/update-form";
	}

	@GetMapping("/auth/join-form")
	public String joinForm() {
		return "user/join-form";
	}

	@GetMapping("/auth/info-search")
	public String userInfoSearchForm(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception) {
		return "/user/info-search-form";
	}

	// 카카오 로그인
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {

		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "cfa26e4df221d547437be19dcc30de42"); // RestApi
		params.add("redirect_uri", "http://localhost:7777/auth/kakao/callback");
		params.add("client_id", "BvSSlS3rTAUDe0wev5Qa");
		params.add("client_secret", "uhjzmVB5cj");
		params.add("code", code);

		HttpEntity<MultiValueMap<String, String>> requestKakaoToken = new HttpEntity<>(params, headers);
		ResponseEntity<OAuthToken> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				requestKakaoToken, OAuthToken.class);

		OAuthToken authToken = response.getBody();

		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + authToken.accessToken);
		headers2.add("Content-type", "application/x-www-form-urlencoded");

		HttpEntity<MultiValueMap<String, String>> kakaoDataRequset = new HttpEntity<>(headers2);

		ResponseEntity<KakaoProfile> kakaoDataResponse = rt2.exchange("https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST, kakaoDataRequset, KakaoProfile.class);

		KakaoAccount account = kakaoDataResponse.getBody().kakaoAccount;

		User kakaoUser = User.builder().username(account.profile.nickname + "_" + kakaoDataResponse.getBody().id)
				.email("kakao@email").password(clickGoKey).loginType(LoginType.KAKAO)
				.phoneNumber(phoneNumber).build();

		User originUser = userService.searchUserName(kakaoUser.getUsername());

		if (originUser.getUsername() == null) {
			userService.saveUser(kakaoUser);
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), clickGoKey));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";

	}

	// 네이버 로그인
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

		if (orginUser.getUsername() == null) {
			userService.signUp(naverUser);
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(naverUser.getUsername(), clickGoKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

	@GetMapping("/api/google/callback")
	public String googleCallback(@RequestParam String code, @RequestParam String scope) {

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
		User googleUser = User.builder().username(account.id).email("google@gamil").loginType(LoginType.GOOGLE)
				.phoneNumber(phoneNumber).password(clickGoKey).build();
		User orginUser = userService.searchUserName(googleUser.getUsername());

		if (orginUser.getUsername() == null) {
			userService.signUp(googleUser);
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(googleUser.getUsername(), clickGoKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/";
	}

	// 로그아웃
	@GetMapping("/m-logout")
	public String logout(HttpServletRequest req, HttpServletResponse res) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(req, res, authentication);
		}
		return "redirect:/";
	}
	

	

}
