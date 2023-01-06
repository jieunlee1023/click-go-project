<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>

<input type="hidden" value="${principal.user.id}" id="user-id">
<c:choose>
	<c:when test="${principal.user.role eq 'GEUST'}">
		<div class="container" id="mypage">

			<div class="d-flexr" id="view-more-title"
				style="align-items: center;">
				<div>🏠 My Page</div>
				<button class="btn--delete-user" type="button" id="btn--delete-user">
					<span class="button__text">회원탈퇴</span>
				</button>
			</div>

			<br>
			<h4 id="mypage--title">반갑습니다.</h4>
			<h4 id="mypage--title">" ${principal.user.username} " 님,</h4>
			<h4 id="mypage--title">최고의 서비스로 모시겠습니다.</h4>
		</div>
		<br>
		<div class="container d-flex justify-content-start"
			style="flex-wrap: wrap;">
			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/user/update-form" class="mypage-btn"> <img
							src="/image/mypage/user_update.png" width="50px"> <br>
							<br> <span>내 정보 수정</span> <br> <span
							id="mypage-mini-title">비밀번호를 주기적으로 변경하여 <br> 계정을 보다
								안전하게 보호하세요.
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/reservation/list" class="mypage-btn"> <img
							src="/image/mypage/reservation.png" width="60px"> <br>
							<br> <span>예약 내역</span> <br> <span
							id="mypage-mini-title">예약 정보와 결제 정보를 <br> 한 눈에 확인하세요.
						</span>
						</a>
					</div>
				</div>
			</div>


			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/wish-list/" class="mypage-btn"> <img
							src="/image/mypage/wish-list.png" width="50px"> <br> <br>
							<span>위시리스트</span> <br> <span id="mypage-mini-title">자주
								가는 장소를 위시리스트에 담아<br> 원하는 시간대에 편하게 예약하세요.
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/review" class="mypage-btn"> <img
							src="/image/mypage/review.png" width="50px"> <br> <br>
							<span>리뷰 내역</span> <br> <span id="mypage-mini-title">
								내가 쓴 리뷰 목록과 <br> 사장님의 답글을 확인하세요.
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/report/list/0" class="mypage-btn"> <img
							src="/image/mypage/report.png" width="50px"> <br> <br>
							<span>신고 내역</span> <br> <span id="mypage-mini-title">신고
								절차 진행을<br> 확인 하실 수 있습니다.
						</span>
						</a>
					</div>
				</div>
			</div>
		</div>

	</c:when>


	<c:otherwise>


		<div class="container" id="mypage">

			<div class="d-flexr" id="view-more-title"
				style="align-items: center;">
				<div>🏡 My & Store Page</div>
				<button class="btn--delete-user" type="button" id="btn--delete-user">
					<span class="button__text">회원탈퇴</span>
				</button>
			</div>


			<br>
			<h4 id="mypage--title">반갑습니다.</h4>
			<h4 id="mypage--title">" ${principal.user.username} "</h4>
			<h4 id="mypage--title">가맹점주님</h4>
			<h4 id="mypage--title">최고의 서비스로 모시겠습니다.</h4>
		</div>
		<br>
		<div class="container d-flex justify-content-start"
			style="flex-wrap: wrap;">
			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/user/update-form" class="mypage-btn"> <img
							src="/image/mypage/user_update.png" width="50px"> <br>
							<br> <span>내 정보 수정</span> <br> <span
							id="mypage-mini-title">비밀번호를 주기적으로 변경하여 <br> 계정을 보다
								안전하게 보호하세요.
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/reservation/list" class="mypage-btn"> <img
							src="/image/mypage/reservation.png" width="60px"> <br>
							<br> <span>예약 관리</span> <br> <span
							id="mypage-mini-title">가맹점의 예약 정보와 결제 정보를<br> 한 눈에
								확인하실 수 있습니다.
						</span>
						</a>
					</div>
				</div>
			</div>


			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/care-store/" class="mypage-btn"> <img
							src="/image/mypage/wish-list.png" width="50px"> <br> <br>
							<span>매장 관리</span> <br> <span id="mypage-mini-title">가맹점주님!
								<br> 매장을 관리해주세요!
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/review" class="mypage-btn"> <img
							src="/image/mypage/review.png" width="50px"> <br> <br>
							<span>리뷰 내역</span> <br> <span id="mypage-mini-title">
								손님들이 작성한 <br> 리뷰를 확인하실 수 있습니다.
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="/report/list/0" class="mypage-btn"> <img
							src="/image/mypage/report.png" width="50px"> <br> <br>
							<span>신고 내역</span> <br> <span id="mypage-mini-title">신고
								절차 진행을<br> 확인 하실 수 있습니다.
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="btn-wrapper">
				<div class="btn-wrapper__container">
					<div class="btn-inner">
						<a href="###" class="mypage-btn"> <img
							src="/image/mypage/sales.png" width="50px"> <br> <br>
							<span>매출 내역</span> <br> <span id="mypage-mini-title">
								가맹점의 매출을 확인해보세요! </span>
						</a>
					</div>
				</div>
			</div>


		</div>

	</c:otherwise>
</c:choose>
<br>
<br>
<br>
<script src="/js/user.js"></script>

<%@ include file="../../layout/footer.jsp"%>