<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<input type="hidden" value="${principal.user.id}" id="user-id">

	<div class="d-flex justify-content-end">
		<div class="">
			<p>☆★안녕㈛パㅔ요 운영ㅈΓ님?¿★☆</p>
			<p>☆★>>>[☞ ${principal.user.username} ☜]<<< 님 접속중★☆</p>
			<div class="spinner-border text-danger"></div>
			<div class="spinner-grow text-warning"></div>
			<div class="spinner-border spinner-border-sm"></div>
			<div class="spinner-grow spinner-grow-sm"></div>
			<button class="btn btn-primary">
				<span class="spinner-border spinner-border-sm"></span>
			</button>
		</div>
	</div>
	<br> <br> <br> <br>

	<div class="d-flex justify-content-between">

		<div class="card" style="width: 200px; border: none;">
			<img class="card-img-top" src="../image/admin/bul1.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">매출</h4>
				<p class="card-text">보고싶으면?¿ ↓ClickGo</p>
				<a href="/admin/admin-sales" class="btn btn-primary" style="color: #white; background-color: #6478ff; border: none;">매출현황</a>
			</div>
		</div>
		<div class="card" style="width: 200px; border: none;">
			<img class="card-img-top" src="../image/admin/bul2.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">예약</h4>
				<p class="card-text">보고싶으면¿ ↓ClickGo</p>
				<a href="/admin/admin-reservation" class="btn btn-primary" style="color: #white; background-color: #6478ff; border: none;">예약상황</a>
			</div>
		</div>
		<div class="card" style="width: 200px; border: none;">
			<img class="card-img-top" src="../image/admin/bul3.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">신고내역</h4>
				<p class="card-text">보고싶으면¿ ↓ClickGo</p>
				<a href="/admin/admin-report" class="btn btn-primary" style="color: #white; background-color: #6478ff; border: none;">신고내역</a>
			</div>
		</div>
	</div>
	
	<br>
	<br>

	<div class="d-flex justify-content-between">

		<div class="card" style="width: 200px; border: none;">
			<img class="card-img-top" src="../image/admin/bul4.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">회원조회</h4>
				<p class="card-text">보고싶으면¿ ↓ClickGo</p>
				<a href="/admin/admin-user" class="btn btn-primary" style="color: #white; background-color: #6478ff; border: none;">가맹점현황</a>
			</div>
		</div>
		<div class="card" style="width: 200px; border: none;">
			<img class="card-img-top" src="../image/admin/bul5.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">가맹점</h4>
				<p class="card-text">보고싶으면¿ ↓ClickGo</p>
				<a href="/admin/admin-franchise" class="btn btn-primary" style="color: #white; background-color: #6478ff; border: none;">가맹점현황</a>
			</div>
		</div>
		<div class="card" style="width: 200px; border: none;">
			<img class="card-img-top" src="../image/admin/bul6.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">1:1문의</h4>
				<p class="card-text">보고싶으면¿ ↓ClickGo</p>
				<a href="/admin/admin-ask" class="btn btn-primary" style="color: #white; background-color: #6478ff; border: none;">1:1문의현황</a>
			</div>
		</div>


	</div>

</div>

<br />
<br />
<br />
<br />
<br />


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>




