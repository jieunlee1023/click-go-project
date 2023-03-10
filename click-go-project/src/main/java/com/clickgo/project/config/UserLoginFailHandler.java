package com.clickgo.project.config;
 
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class UserLoginFailHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		String errorMessage;

		if (exception instanceof BadCredentialsException) {
			errorMessage = "아이디 또는 비밀번호가 맞지 않습니다. 다시 한번 확인해주세요.";
		} else if (exception instanceof InternalAuthenticationServiceException) {
			errorMessage = "내부적으로 발생한 시스템 문제로 인해 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
		} else if (exception instanceof AuthenticationCredentialsNotFoundException) {
			errorMessage = "인증 요청이 거부되었습니다. 관리자에게 문의하세요.";
		} else if (exception instanceof DisabledException) {
			errorMessage = "휴먼 계정입니다. 관리자에게 문의해주세요";
		} else if (exception instanceof RememberMeAuthenticationException) {
			errorMessage = "정지 당한 계정입니다. 관리자에게 문의해주세요";
		} else {
			errorMessage = "알 수 없는 이유로 로그인에 실패하였습니다 관리자에게 문의하세요.";
		}
		errorMessage = URLEncoder.encode(errorMessage, "UTF-8");// 한글 인코딩 깨지는 문제 방지
		// 실패했을 때 파라미터에 붙여서 어디로 보낼 지 정한다 (보통 로그인페이지로) 
		setDefaultFailureUrl("/auth/login-form?error=true&exception=" + errorMessage);

		super.onAuthenticationFailure(request, response, exception);
	}

}