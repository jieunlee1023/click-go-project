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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.common.OAuthToken;

@Controller
public class UserController {

	
	
	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	
	@GetMapping("/auth/naver/callback")
	public OAuthToken NaverCallback(@RequestParam String code, @RequestParam String state) {
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant-type", "authorization_code");
		params.add("client_id", "BvSSlS3rTAUDe0wev5Qa");
		params.add("client_secret", "uhjzmVB5cj");
		params.add("code", code);
		params.add("state", state);
		
		HttpEntity<MultiValueMap<String, String>> requestNaverToken =
				new HttpEntity<>(params, headers);
		
		ResponseEntity<OAuthToken> response =
				rt.exchange("https://nid.naver.com/oauth2.0/token", 
						HttpMethod.POST,
						requestNaverToken,
						OAuthToken.class
						);
		
//		RestTemplate rt2 = new RestTemplate();
//		
//		HttpHeaders headers2 = new HttpHeaders();
//		headers2.add("Authorization", "Bearer AAAAPIuf0L+qfDkMABQ3IJ8heq2mlw71DojBj3oc2Z6OxMQESVSrtR0dbvsiQbPbP1/cxva23n7mQShtfK4pchdk/rc=\"")
		
		
		
		
		
		return response.getBody();
	}
	
	
	
}
