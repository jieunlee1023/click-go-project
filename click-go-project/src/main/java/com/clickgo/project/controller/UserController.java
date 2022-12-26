package com.clickgo.project.controller;



import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class UserController {
	
	
	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	
	
	
	@GetMapping("/auth/join_form")
	public String joinForm() {
		return "user/join_form";
	}
	
	

	
	@GetMapping("/auth/kakao/callback")
	//@ResponseBody // data를 리턴함
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
		
		
		HttpEntity<MultiValueMap<String, String>> requestKakaoToken = new HttpEntity<>(params,headers);
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				requestKakaoToken,
				String.class);
		
		String authToken = response.getBody();
		return authToken;
	}
}
