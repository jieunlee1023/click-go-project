<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container d-flex justify-content-center"
	style="width: 500px">
	<div class="container">
		<span style="font-size: 30px">아이디 찾기</span>
		<div class="form-group ">
			<label for="email" class="d-flex m-0" style="font-size: 13px">이메일</label>
			<input type="text" class="form-control " id="email"
				style="border-radius: 0px" value="" placeholder="회원가입시 등록한 email">
		</div>
		<div class="form-control d-flex justify-content-center color-"
			id="search-id" style="border-radius: 0px; margin-bottom: 100px;">
			<button type="button" id="btn--search-id" class="d-flex widt"
				style="border: none; background-color: white;">아이디 찾기</button>
		</div>
		<span style="font-size: 30px">비밀번호 찾기</span>
		<div class="form-group">
			<label for="search-username" class="d-flex m-0"
				style="font-size: 13px">아이디</label> <input type="text"
				class="form-control" id="username" style="border-radius: 0px"
				value="" placeholder="아이디를 입력해주세요">
		</div>
		<div class="form-group">
			<label for="search-email" class="d-flex m-0" style="font-size: 13px">이메일</label>
			<input type="email" class="form-control" id="search-email"
				style="border-radius: 0px" value="" placeholder="email을 입력해주세요">
		</div>
		<br>
		<div class="form-control d-flex justify-content-center color-"
			id="search-pw" style="border-radius: 0px;">
			<button type="button" id="btn--search-pw" class="d-flex widt"
				style="border: none; background-color: white;">비밀번호 찾기</button>
		</div>

	</div>
</div>


<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>