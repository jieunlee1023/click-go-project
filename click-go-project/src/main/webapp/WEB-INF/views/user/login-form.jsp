<%@page import="java.net.URLEncoder"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<br><br><br>
<div style="background-color: rgb(0,0,0,0.05);">
	<div class="container">
	<br><br>
		<div id="view-more-title" class=" d-flex justify-content-center">
			<div>LogIn</div>
		</div>
		<div class=" d-flex justify-content-center"></div>
	</div>



	<div class="login--form">
		<div class="container d-flex justify-content-center" id="login--main">
			<div class="container">
				<form action="/auth/loginProc" method="post">
					<div class="form-group ">
						<c:choose>
							<c:when test="${error eq 'true'}">
								<div class="alert alert-danger">${exception}</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>

						<input type="text" class="form-control" id="username"
							name="username" placeholder="아이디를 입력해주세요." value="admin1" required />
					</div>
					<div class="form-group ">
						<input type="password" class="form-control" id="password" value="qwe123!"
							name="password" placeholder="비밀번호를 입력해주세요.">
					</div>
					<br>
					<div class="form-control d-flex justify-content-center"
						id="loginbutton">
						<button type="submit" id="btn--login">로그인</button>
					</div>
					<span> </span>
				</form>

				<div class="d-flex justify-content-between pt-2">
					<a id="id-infosearch-btn" href="/auth/info-search">아이디/비밀번호 찾기</a>
					<a id="signin-btn" href="/auth/join-form">회원가입</a>
				</div>
				<br>
				<div class="d-flex justify-content-center">
					<%
					String redirectURI = URLEncoder.encode("http://localhost:7777/auth/naver/callback", "UTF-8");
					SecureRandom random = new SecureRandom();
					String state = new BigInteger(130, random).toString();
					%>
					<a class="d-flex m-2"
						href="https://nid.naver.com/oauth2.0/authorize
				?response_type=code
				&client_id=BvSSlS3rTAUDe0wev5Qa&state=<%=state%>
				&redirect_uri=<%=redirectURI%>">
						<img class="login--img" alt="네이버로그인" src="/image/naver_login.png"
						width="70" height="70">
					</a> <a class="d-flex m-2"
						href="https://kauth.kakao.com/oauth/authorize
				?client_id=cfa26e4df221d547437be19dcc30de42
				&redirect_uri=http://localhost:7777/auth/kakao/callback
				&response_type=code">
						<img class="login--img" alt="카카오로그인" src="/image/kakao_login.png"
						width="70" height="70">
					</a> <a class="d-flex m-2"
						href="https://accounts.google.com/o/oauth2/v2/auth
						?client_id=182145852170-7h7g9dmnjs01k3fqq94pcbi8v1p964an.apps.googleusercontent.com
						&redirect_uri=http://localhost:7777/api/google/callback
						&response_type=code
						&scope=https://www.googleapis.com/auth/userinfo.profile">
						<img class="login--img" alt="구글로그인" src="/image/google_login.png"
						width="70" height="70">
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>
<br>
<%@ include file="../layout/shortFooter.jsp"%>
