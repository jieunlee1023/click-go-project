<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<br>
<br>
<div style="background-color: rgb(0, 0, 0, 0.05);">
	<div class="container">
	<br><br>
	<div id="view-more-title" class=" d-flex justify-content-center">
		<div>Find Id & Password</div>
	</div>
	<div class=" d-flex justify-content-center">
	</div>
</div>


<div id="info-search--form">
<div class="container d-flex justify-content-center" id="info-search--main">
	<div class="container" id="info-search">
		<div id="search--text">🔎 아이디 찾기 </div>
		<br>
		<div class="form-group ">
			<input type="text" class="form-control " id="email"
			value="" placeholder="회원가입시 등록한 email을 입력해주세요." required>
		</div>
		<div class="form-control d-flex justify-content-center color-"
			id="search-id" >
			<button type="button" id="btn--search-id" class="d-flex widt">아이디 찾기</button>
		</div>
		<br><br>
		<hr>
		<br><br>
		<div id="search--text">🔎 비밀번호 찾기 </div>
			<br>
		<div class="form-group">
		<input type="text"
				class="form-control" id="username" 
				placeholder="아이디를 입력해주세요">
		</div>
		<div class="form-group">
			<input type="email" class="form-control" id="search-email"
			  placeholder="email을 입력해주세요">
		</div>
		<div class="form-control d-flex justify-content-center"id="search-pw">
			<button type="button" id="btn--search-pw" class="d-flex widt">비밀번호 찾기</button>
		</div>

	</div>
</div>
</div>
</div>
<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/shortFooter.jsp"%>