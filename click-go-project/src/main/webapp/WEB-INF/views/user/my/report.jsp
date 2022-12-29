<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<br>
<div class="container d-flex justify-content-start pl-5">
	<h1 style="font-weight: bold;">내가 신고한 내역</h1>
</div>
<div class="d-flex justify-content-center">
	<div class="mr-5 mt-5">
		<div class="mr-5">
			<br>
			<div class="d-flex-column">
				<div class="m-4">
					<a href="/user/update-form">내가 신고한 내역 보기</a>
				</div>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${principal.user.role eq 'GEUST'}">

			<div class="d-flex-column">
				<br> <br> <br>
				<c:choose>
					<c:when test="${empty reports.content}">
						<h1>현재 신고하신 내역이 존재하지 않습니다.</h1>
						<h5>click go는 회원님들의 편안함에 대해 최선을 다 할 것입니다.</h5>
					</c:when>

					<c:otherwise>
						<c:forEach var="report" items="${reports.content}">
							<div class="media border mt-3"
								style="width: 800px; height: 50px; border-radius: 15px;">
								<div class="media-body">
									<a href="/mypage/report/detail/${report.id}">
										<div class="d-flex justify-content-between m-2 ml-3">
											<h5 >${report.title}</h5>
									<div>
											<span class="m-1 mr-2">${report.store.storeName}</span>
											<c:choose>
												<c:when test="">
											<span class="m-1 mr-2">${report.approveStatus}</span>
												</c:when>
											</c:choose>
									</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</c:when>
		<c:otherwise>

			<div class="d-flex-column">
				<c:choose>
					<c:when test="${empty reports.content}">
						<br>
						<br>
						<br>
						<h1>현재 신고하신 내역이 존재하지 않습니다.</h1>
					</c:when>

					<c:otherwise>
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
													<span>${reservation.price}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<%@ include file="../../layout/footer.jsp"%>