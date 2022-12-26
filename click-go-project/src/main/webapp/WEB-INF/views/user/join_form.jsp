<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<br>
<div class="container d-flex justify-content-center"
	style="width: 500px">
	<div class="container">
		<form>
			<div class="form-group ">
				<label for="username" class="d-flex m-0" style="font-size: 13px">아이디</label>
				<input type="text" class="form-control " id="username"
					style="border-radius: 0px" value="">
			</div>
			<div class="form-group">
				<label for="password" class="d-flex m-0" style="font-size: 13px">비밀번호</label>
				<input type="password" class="form-control" id="password"
					style="border-radius: 0px" value="">
			</div>
			<div class="form-group">
				<label for="password-check" class="d-flex m-0"
					style="font-size: 13px">비밀번호 확인</label> <input type="password"
					class="form-control" id="password-check" style="border-radius: 0px"
					value="">
			</div>
			<div class="form-group">
				<label for="email" class="d-flex m-0" style="font-size: 13px">이메일</label>
				<input type="email" class="form-control" id="email"
					style="border-radius: 0px" value="">
			</div>
			<div class="form-group">
				<label for="phoneNumber" class="d-flex m-0" style="font-size: 13px">휴대전화</label>
				<input type="text" class="form-control" style="border-radius: 0px"
					id="phoneNumber" value="010-1111-1111">
			</div>
		</form>

		<br>
		<div class="form-control d-flex justify-content-center color-"
			id="joinbutton" style="border-radius: 0px;">
			<button type="button" id="btn--save" class="d-flex widt"
				style="border: none; background-color: white;">JOIN</button>
		</div>

	</div>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>