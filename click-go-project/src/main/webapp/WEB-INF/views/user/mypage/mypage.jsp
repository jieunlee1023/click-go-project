<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>
<br>
<br>
<div class="d-flex ml-5 pl-5">
	<div class="d-flex-column justify-content-start ml-5">
		<h1 style="font-weight: bold;">마이 페이지</h1>
		<br>
		<h4>반갑습니다. ${principal.user.username}님,</h4>
		<h4>최고의 서비스로 모시겠습니다.</h4>
	</div>
</div>
<br>
<br>
<div class="d-flex justify-content-center">

	<div class="media border p-3 mr-5"
		style="width: 374px; height: 260px; border-radius: 15px;">
		<div class="d-flex-column">
			<a href="/user/update-form" > <img
				src="../image/mypage/user_update.png" alt="수정 사진"
				class="ml-5 mt-4 m-4" style="width: 60px;">
				<div class="media-body">
					<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
						<h3 style="font-weight: bold;">내 정보 수정</h3>
						<p class="mt-3">비밀번호를 주기적으로 변경하여 계정을 보다 안전하게 보호하세요.</p>
					</div>
				</div>
			</a>
		</div>
	</div>
	<div class="media border p-3 mr-5"
		style="width: 374px; height: 260px; border-radius: 15px;">
		<div class="d-flex-column ">
			<img src="../image/mypage/report_list.png" alt="수정 사진"
				class="ml-5 mt-4 m-4" style="width: 60px;">
			<div class="media-body">
				<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
					<h3 style="font-weight: bold;">신고 내역</h3>
					<p class="mt-3">신고 내역을 확인하세요.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="media border p-3"
		style="width: 374px; height: 260px; border-radius: 15px;">
		<div class="d-flex-column ">
			<img src="../image/mypage/wish_list.png" alt="수정 사진"
				class="ml-5 mt-4 m-4" style="width: 60px;">
			<div class="media-body">
				<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
					<h3 style="font-weight: bold;">위시리스트</h3>
					<p class="mt-3">자주 가는 장소를 위시리스트에 담아 자신이 원하는 시간대에 보다 편하게 예약하세요.</p>
				</div>
			</div>
		</div>
	</div>
</div>

<br>
<br>
<div class="d-flex justify-content-center">

	<div class="media border p-3 mr-5"
		style="width: 374px; height: 260px; border-radius: 15px;">
		<div class="d-flex-column ">
			<a href="/mypage/reservation-list"> <img
				src="../image/mypage/wish_list.png" alt="수정 사진"
				class="ml-5 mt-4 m-4" style="width: 60px;">
				<div class="media-body">
					<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
						<h3 style="font-weight: bold;">예약 내역</h3>
						<p class="mt-3">예약 정보와 결제 정보를 한 눈에 확인하세요.</p>
					</div>
				</div>
			</a>
		</div>
	</div>

	<div class="media border p-3"
		style="width: 374px; height: 260px; border-radius: 15px;">
		<div class="d-flex-column ">
			<img src="../image/mypage/wish_list.png" alt="수정 사진"
				class="ml-5 mt-4 m-4" style="width: 60px;">
			<div class="media-body">
				<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
					<h3 style="font-weight: bold;">리뷰 내역</h3>
					<p class="mt-3">내가 쓴 리뷰와 사장님의 댓글을 확인하세요.</p>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../layout/footer.jsp"%>