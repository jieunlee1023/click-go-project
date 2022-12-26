<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div>

	<div class="d-flex justify-content-end m-2 ">

		<form action="/auth/login_form">
			<button type="submit" class="login"
				style="background-color: white; border: none; text-align: cetner">
				LogIn</button>
		</form>

		<form action="/auth/join_form">
			<button type="submit" class="signup"
				style="background-color: white; border: none; text-align: cetner">
				SignUp</button>
		</form>

	</div>

</div>

<%@ include file="layout/footer.jsp"%>

