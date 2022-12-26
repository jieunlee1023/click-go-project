<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div>

	<div class="d-flex justify-content-end m-2 ">


		<button type="button" class="login"
			style="background-color: white; border: none; text-align: cetner">
			LogIn</button>

		<form action="/auth/join_form">
			<button type="submit" class="signup"
				style="background-color: white; border: none; text-align: cetner">
				SignUp</button>
		</form>

	</div>

</div>

<a
	href="https://accounts.google.com/o/oauth2/v2/auth
?client_id=182145852170-7h7g9dmnjs01k3fqq94pcbi8v1p964an.apps.googleusercontent.com
&redirect_uri=http://localhost:7777/api/google/callback
&response_type=code
&scope=https://www.googleapis.com/auth/userinfo.profile">구글</a>

<%@ include file="layout/footer.jsp"%>

