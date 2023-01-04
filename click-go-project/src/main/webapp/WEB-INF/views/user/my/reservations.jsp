<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<br>
<div class="d-flex-column justify-content-center">
	<div class="container d-flex">
		<c:choose>
			<c:when test="${principal.user.role eq 'GEUST'}">
				<div class="mr-5 mt-5">
					<div class="mr-5">
						<div class="d-flex-column">
							<div class="m-4">
								<a href="/user/update-form">내 정보 관리</a>
							</div>
						</div>
					</div>
				</div>

				<div class="d-flex-column">
					<c:choose>
						<c:when test="${empty reservations.content}">
							<br>
							<br>
							<br>
							<h1>현재 예약하신 내역이 존재하지 않습니다.</h1>
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
			</c:when>

			<c:otherwise>

				<div class="mr-5 mt-5">
					<div class="mr-5">
						<div class="d-flex-column">
							<div class="m-4">
								<a href="/user/update-form">내 정보 관리</a>
							</div>
						</div>
					</div>
				</div>

				<div class="d-flex-column">
					<c:choose>
						<c:when test="${empty reservations.content}">
							<br>
							<br>
							<br>
							<h1>현재 예약받은 내역이 존재하지 않습니다.</h1>
						</c:when>

						<c:otherwise>
								<input type="hidden" value="${reservations.content.size()}" id="reservation-size">
							<c:forEach var="reservation" items="${reservations.content}">
								<input type="hidden" value="${reservation.id}" id="reservation-id-${reservation.id}">
								<div class="media border mt-3"
									style="width: 700px; height: 430px; border-radius: 15px;">
									<div class="d-flex-column">
										<img src="${reservation.store}" alt="가게 사진"
											style="width: 700px; height: 300px; border-radius: 15px;">
										<div class="media-body">
											<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
												<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
													<h5 class="" style="font-weight: bold;">${reservation.store.storeName}</h5>
													<p class="mr-3 " id="approve--status-${reservation.id}">${reservation.approveStatus}</p>
												</div>
												<div class="d-flex pl-3 justify-content-between">
													<div class="d-flex-column pl-3">
														<div>${reservation.reservationTime}</div>
														<div>${reservation.price}원</div>
														<br>
														<div>예약 시간</div>
														<div>${reservation.reservationDate}</div>
														<div>${reservation.reservationTime}</div>
														<br>
														<div>손님이 예약하신 자리 : ${reservation.reservationSeat}</div>
														<br>
														<div>종료 시간</div>
														<div>${reservation.endDate}</div>
														<div>${reservation.endTime}</div>
														<br>
														<div class="mr-4 md-5">${reservation.user.username}님의
															발자취 보러가기</div>
													</div>
													<div class="d-flex-column pl-3">
														<button type="button" id="btn--approve-reservation-${reservation.id}">동의</button>
														<button type="button" id="btn--reject-reservation-${reservation.id}">거절</button>
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
	<br> <br> <br>
	<div>
		<ul class="pagination justify-content-center">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li class="page-item ${boards.first ? isDisabled : isNotDisabled} "><a
				class="page-link" href="?page=0&q=${q}">첫번째 페이지로 가기</a></li> &nbsp;&nbsp;
			<li class="page-item ${boards.first ? isDisabled : isNotDisabled }"><a
				class="page-link" href="?page=${boards.number - 1}&q=${q}">뒤로 가기</a></li>
			&nbsp;&nbsp;
			<!-- 반복문 처리 -->
			<c:forEach var="num" items="${pageNumbers}">
				<c:choose>
					<c:when test="${nowPage eq num}">
						<li class="page-item active"><a class="page-link"
							href="?page=${num - 1}&q=${q}">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?page=${num - 1}&q=${q}">${num}</a></li>
					</c:otherwise>
				</c:choose>
		&nbsp;&nbsp;
	</c:forEach>
			<!-- 		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item active"><a class="page-link" href="#">2</a></li> -->
			<li class="page-item ${boards.last ? isDisabled : isNotDisabled}"><a
				class="page-link" href="?page=${boards.number + 1}&q=${q}">앞으로
					가기</a></li> &nbsp;&nbsp;
			<li class="page-item ${boards.last ? isDisabled : isNotDisabled}"><a
				class="page-link" href="?page=${boards.totalPages - 1}&q=${q}">마지막
					페이지로 가기</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript" src="/js/reservation.js"></script>
<%@ include file="../../layout/footer.jsp"%>