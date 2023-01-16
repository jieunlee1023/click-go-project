<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<br>
<br>
<div style="background-color: rgb(0, 0, 0, 0.05);">
	<div class="container">
		<br>
		<br>
		<div id="view-more-title" class=" d-flex justify-content-center">
			<div>Join</div>
		</div>
		<div class=" d-flex justify-content-center">
			<span style="color: black"> 클릭고에 오신 것을 환영합니다. 🥰</span>
		</div>
	</div>


	<div class="join--form">
		<div class="container d-flex justify-content-center" id="join--main">
			<div class="container">
				<form>
					<div class="form-group ">
						<input placeholder="아이디를 입력해주세요." type="text"
							class="form-control " id="username" name="username" required>
						<font id="id-feedback" size="3"></font>
					</div>
					<div class="form-group">
						<input placeholder="비밀번호를 입력해주세요." type="password"
							class="form-control" id="password" required>
					</div>
					<div class="form-group">
						<input placeholder="비밀번호를 확인해주세요." type="password"
							class="form-control" id="password-check" required>
					</div>
					<div class="form-group">
						<input placeholder="이메일을 입력해주세요." type="email"
							class="form-control" id="email" name="email" required> <font
							id="email-feedback-email" size="3"></font>
					</div>
					<div class="form-group">
						<input placeholder="연락처를 입력해주세요." type="text" class="form-control"
							id="phoneNumber" required>
					</div>
				</form>

				<br>
				<div class="form-control d-flex justify-content-center"
					id="joinbutton">
					<button type="button" id="btn--save" class="d-flex"
						style="background-color: transparent;">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/js/user.js"></script>
</div>
<%@ include file="../layout/shortFooter.jsp"%>