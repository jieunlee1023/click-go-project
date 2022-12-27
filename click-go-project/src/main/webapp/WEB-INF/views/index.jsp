<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div>
	<div class="d-flex justify-content-end m-3 ">
		<c:choose>
			<c:when test="${empty principal}">
				<form action="/auth/login-form">
					<button type="submit" class="login"
						style="background-color: white; border: none; text-align: cetner">
						LogIn</button>
				</form>

				<form action="/auth/join-form">
					<button type="submit" class="signup"
						style="background-color: white; border: none; text-align: cetner">
						SignUp</button>
				</form>
			</c:when>
			<c:otherwise>

				<form action="/user/update-form">
					<button type="submit"
						style="background-color: white; border: none; text-align: cetner">
						My</button>
				</form>

				<form action="/logout">
					<button type="submit" class="logout"
						style="background-color: white; border: none; text-align: cetner">
						LogOut</button>
				</form>

			</c:otherwise>
		</c:choose>

	</div>

	<div class="d-flex justify-content-center">
		<div style="position: relative; width: 70%;">
			<input
				style="width: 100%; border: 1px solid #bbb; border-radius: 0px; padding: 10px 12px; font-size: 14px; outline: none;"
				placeholder="검색어를 입력하세요."> <a href="#"
				style="position: absolute; width: 25px; top: 8px; right: 10px; margin: 0;">
				<img alt="검색" src="image/search.png" width="18px">
			</a>
		</div>
	</div>

	<br> <br> <br> <br> <br> <br> <br> <br>
	<br> <br> <br> <br> <br> <br> <br> <br>
	<br> <br>

</div>

<%@ include file="layout/footer.jsp"%>

