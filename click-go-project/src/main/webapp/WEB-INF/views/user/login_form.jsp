<%@page import="java.net.URLEncoder"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<br>
<br>
<div class="container d-flex justify-content-center"
	style="width: 500px">
	<div class="container">
		<form action="/auth/loginProc" method="post">
			<div class="form-group ">
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
				<label for="username" class="d-flex m-0" style="font-size: 13px">아이디</label>
				<input type="text" class="form-control" id="username"
					style="border-radius: 0px" name="username" value="">
			</div>
			<div class="form-group ">
				<label for="password" class="d-flex m-0" style="font-size: 13px">비밀번호</label>
				<input type="password" class="form-control" id="password"
					style="border-radius: 0px" name="password" value="">
			</div>
			<br>
			<div class="form-control d-flex justify-content-center color-"
				id="loginbutton" style="border-radius: 0px;">
				<button type="submit" id="btn--login" class="d-flex widt"
					style="border: none; background-color: white;">SIGN IN</button>
			</div>
		</form>

		<div class="d-flex justify-content-between pt-2">
			<a id="id-password-btn" style="font-size: 12px; color: black" href="">아이디/비밀번호
				찾기</a> <a id="signin-btn" style="font-size: 12px; color: black"
				href="/auth/join_form">회원가입</a>
		</div>
		<br>
		<div class="d-flex justify-content-center">
			<%
			String redirectURI = URLEncoder.encode("http://localhost:7777/auth/naver/callback", "UTF-8");
			SecureRandom random = new SecureRandom();
			String state = new BigInteger(130, random).toString();
			%>
			<a class="d-flex m-1"
				href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=BvSSlS3rTAUDe0wev5Qa&state=<%=state%>&redirect_uri=<%=redirectURI%>">
				<img alt="네이버로그인" src="/image/naver_login.png" width="50"
				height="50">
			</a> <a class="d-flex m-1"
				href="https://kauth.kakao.com/oauth/authorize?client_id=cfa26e4df221d547437be19dcc30de42&redirect_uri=http://localhost:7777/auth/kakao/callback&response_type=code">
				<img alt="카카오로그인" src="/image/kakao_login.png" width="50"
				height="50">
			</a> <a class="d-flex m-1"
				href="https://accounts.google.com/o/oauth2/v2/auth
?client_id=182145852170-7h7g9dmnjs01k3fqq94pcbi8v1p964an.apps.googleusercontent.com
&redirect_uri=http://localhost:7777/api/google/callback
&response_type=code
&scope=https://www.googleapis.com/auth/userinfo.profile">
				<img alt="구글로그인" src="/image/google_login.png" width="50"
				height="50">
			</a>
		</div>
	</div>
</div>
<br>
<br>
<br>
<br>

<%@ include file="../layout/footer.jsp"%>
