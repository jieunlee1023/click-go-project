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
		<a href="/admin/user" class="btn2"><img style="margin-top: 60px;"
			src="/image/mypage/user_update.png" width="80px"><br> <span>회원
				관리</span>
		</a>
	</div>

	<div class="btn-wrapper">
		<a href="/admin/store" class="btn2"> <img style="margin-top: 60px;"
			src="/image/mypage/store.png" width="80px"><br> <span>가맹점
				관리</span>
		</a>
	</div>


	<div class="btn-wrapper">
		<a href="/admin/reservation" class="btn2"> <img style="margin-top: 60px;"
			src="/image/mypage/reservation.png" width="80px"><br> <span>예약
				조회</span>
		</a>
	</div>

	<div class="btn-wrapper">
		<a href="/admin/one-to-one-list" class="btn2"> <img style="margin-top: 60px;"
			src="/image/mypage/review.png" width="80px"><br> <span>1:1
				문의</span>
		</a>
	</div>

	<div class="btn-wrapper">
		<a href="/admin/report" class="btn2"> <img style="margin-top: 60px;"
			src="/image/mypage/report.png" width="80px"><br> <span>신고
				관리</span>
		</a>
	</div>

	<div class="btn-wrapper">
		<a href="/admin/chart" class="btn2"> <img style="margin-top: 60px;"
			src="/image/mypage/sales.png" width="80px"><br> <span>통계
				보기</span>
		</a>
	</div>
</div>
<br>
<br>
<br>
<br>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>




