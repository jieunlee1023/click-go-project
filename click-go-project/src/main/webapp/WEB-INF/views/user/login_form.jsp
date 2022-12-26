<%@page import="java.net.URLEncoder"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<br>
<div class="container">
	<form action="/auth/loginProc" method="post">
		<div class="form-group">
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<label for="username">username:</label> <input type="text"
				class="form-control" placeholder="Enter username" id="username"
				name="username" value="teco">
		</div>
		<div class="form-group">
			<label for="password">password:</label> <input type="password"
				class="form-control" placeholder="Enter password" id="password"
				name="password" value="asd1234">
		</div>
		<button type="submit" id="btn--login" class="btn btn-primary">signIn</button>
	</form>
	<a
		href="https://kauth.kakao.com/oauth/authorize?client_id=cfa26e4df221d547437be19dcc30de42&redirect_uri=http://localhost:7777/auth/kakao/callback&response_type=code">
		<img alt="카카오로그인" src="/image/kakao_login_medium.png" width="78"
		height="38">

	</a>
	<%
	String redirectURI = URLEncoder.encode("http://localhost:7777/auth/naver/callback", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	%>
	<a
		href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=BvSSlS3rTAUDe0wev5Qa&state=<%=state%>&redirect_uri=<%=redirectURI%>">
		<img alt="네이버로그인" src="/image/naver_btn.png" width="70" height="40">
	</a>
</div>

<%@ include file="../layout/footer.jsp"%>
