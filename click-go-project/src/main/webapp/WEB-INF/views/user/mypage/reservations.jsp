<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<div class="d-flex justify-content-center">

	<ul>
		<li><a href="#"> 포인트 </a></li>
		<li><a href="#">쿠폰함</a></li>
		<li><a href="#"> 예약 내역 </a></li>
		<li><a href="#">내 정보 관리</a></li>
		<li><a href="#"> 알림 </a></li>
		<li><a href="#"> click go 상품권 잔액 조회 </a></li>
	</ul>

	<div class="d-flex-column">
		<div class="media border p-3 mt-3"
			style="width: 650px; height: 260px; border-radius: 15px;">
			<div class="d-flex-column">
				<a href="/user/update-form"> <img
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
		<div class="media border p-3 mt-3"
			style="width: 650px; height: 260px; border-radius: 15px;">
			<div class="d-flex-column">
				<a href="/user/update-form"> <img
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
	</div>
</div>
<%@ include file="../../layout/footer.jsp"%>