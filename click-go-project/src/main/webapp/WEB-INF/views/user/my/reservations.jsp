<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<div class="d-flex justify-content-center">

	<ul class="mr-5">
		<li><a href="#"> 포인트 </a></li>
		<li><a href="#">쿠폰함</a></li>
		<li><a href="#"> 예약 내역 </a></li>
		<li><a href="#">내 정보 관리</a></li>
		<li><a href="#"> 알림 </a></li>
		<li><a href="#"> click go 상품권 잔액 조회 </a></li>
	</ul>

	<div class="d-flex-column">
		<c:forEach var="reservation" items="${reservations.content}">
			<div class="media border mt-3"
				style="width: 500px; height: 350px; border-radius: 15px;">
				<div class="d-flex-column">
					<img src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
						style="width: 500px; height: 200px; border-radius: 15px;">
					<div class="media-body">
						<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
							<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
								<h3 class="" style="font-weight: bold;">${reservation.store.storeName}</h3>
								<h5 class="mr-3 m-1">${reservation.approveStatus}</h5>
							</div>
							<div class="d-flex-column pl-3 mt-3">
								<span>${reservation.reservationTime}</span>
								<div class="d-flex">
									<span >${reservation.price}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="../../layout/footer.jsp"%>