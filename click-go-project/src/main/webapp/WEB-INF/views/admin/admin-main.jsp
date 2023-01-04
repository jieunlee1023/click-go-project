<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container" id="mypage">
	<input type="hidden" value="${principal.user.id}" id="user-id">

	<div class="d-flex" id="view-more-title" style="align-items: center;">
		<div>💻 관리자 페이지</div>
	</div>
</div>
<br>
<div class="container d-flex justify-content-between"
	style="flex-wrap: wrap;">
	<div class="btn-wrapper">
		<div class="btn-wrapper__container">
			<div class="btn-inner">
				<a href="/admin/admin-user" class="mypage-btn"> <img
					src="/image/mypage/user_update.png" width="50px"> <br> <br>
					<span>회원 관리</span> <br>
				</a>
			</div>
		</div>
	</div>

	<div class="btn-wrapper">
		<div class="btn-wrapper__container">
			<div class="btn-inner">
				<a href="/admin/admin-store" class="mypage-btn"> <img
					src="/image/mypage/store.png" width="60px"> <br> <br>
					<span>가맹점 관리</span> <br>
				</a>
			</div>
		</div>
	</div>


	<div class="btn-wrapper">
		<div class="btn-wrapper__container">
			<div class="btn-inner">
				<a href="/admin/admin-reservation" class="mypage-btn"> <img
					src="/image/mypage/reservation.png" width="50px"> <br> <br>
					<span>예약 조회</span> <br>
				</a>
			</div>
		</div>
	</div>

	<div class="btn-wrapper">
		<div class="btn-wrapper__container">
			<div class="btn-inner">
				<a href="/admin/admin-answer" class="mypage-btn"> <img
					src="/image/mypage/review.png" width="50px"> <br> <br>
					<span>1:1 문의</span> <br>
				</a>
			</div>
		</div>
	</div>

	<div class="btn-wrapper">
		<div class="btn-wrapper__container">
			<div class="btn-inner">
				<a href="/admin/admin-report" class="mypage-btn"> <img
					src="/image/mypage/report.png" width="50px"> <br> <br>
					<span>신고 관리</span> <br>
				</a>
			</div>
		</div>
	</div>

	<div class="btn-wrapper">
		<div class="btn-wrapper__container">
			<div class="btn-inner">
				<a href="/admin/admin-sales" class="mypage-btn"> <img
					src="/image/mypage/sales.png" width="50px"> <br> <br>
					<span>매출 관리</span> <br>
				</a>
			</div>
		</div>
	</div>
</div>

<br><br><br><br>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>




