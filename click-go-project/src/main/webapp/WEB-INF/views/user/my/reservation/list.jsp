<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">

	<div id="view-more-title">
		<div>📬 예약 내역</div>
	</div>
	<hr>
	<br>
	<c:choose>
		<c:when test="${principal.user.role eq 'GEUST'}">
			<div class="container">
				<c:choose>
					<c:when test="${empty reservations.content}">
						<div class="d-flex justify-content-center">
							<div id="franchise--none">
								<br> <br>
								<div>현재 예약하신 내역이 존재하지 않습니다.</div>
								<br> <br> <br>
							</div>
						</div>
					</c:when>
					<c:otherwise>

						<c:forEach var="reservation" items="${reservations.content}">
							<div class="d-flex justify-content-between">
								<h2 class="" style="font-weight: bold; position: absolute;">🎮
									${reservation.store.storeName}</h2>
								<br>
							</div>
							<div style="text-align: right;">
								<c:choose>
									<c:when test="${reservation.approveStatus eq  'APPROVED'}">
										<input type="submit" id="status-${reservation.id}"
											value="${reservation.approveStatus}" readonly
											style="margin-bottom: 5px; border: none; background-color: blue; color: white;">
										<form action="/report/${reservation.id}">
											<input type="submit" value="가게 신고하기">
										</form>
									</c:when>
									<c:when test="${reservation.approveStatus eq  'WATING'}">
										<input type="submit" id="status-${reservation.id}"
											value="${reservation.approveStatus}" readonly
											style="margin-bottom: 5px; border: none; background-color: orange; color: white;">
									</c:when>
									<c:otherwise>
										<input type="submit" id="status-${reservation.id}"
											value="${reservation.approveStatus}" readonly
											style="margin-bottom: 5px; border: none; background-color: red; color: white;">
									</c:otherwise>

								</c:choose>
							</div>
							<div class="d-flex-column pl-3 ">
								<div>
									<span>* 결제 금액 : ${reservation.price}원</span>
								</div>
								<c:choose>
									<c:when
										test="${reservation.reservationDate == reservation.endDate}">
										<div>
											<span>* 예약일 : ${reservation.reservationDate}</span>
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<span>* 예약일 : ${reservation.reservationDate} ~
												${reservation.endDate}</span>
										</div>
									</c:otherwise>
								</c:choose>
								<div>
									<span>* 예약 시간 : ${reservation.reservationTime} ~
										${reservation.endTime}</span>
								</div>
								<div>
									<span>* 예약석 : ${reservation.reservationSeat}번 자리</span>
								</div>

							</div>
							<hr>
						</c:forEach>






					</c:otherwise>
				</c:choose>

			</div>
		</c:when>

		<c:otherwise>

			<div class="container">
				<c:choose>
					<c:when test="${empty reservations.content}">
						<div class="d-flex justify-content-center">
							<div id="franchise--none">
								<br> <br>
								<div>현재 예약하신 내역이 존재하지 않습니다.</div>
								<br> <br> <br>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<c:forEach var="reservation" items="${reservations.content}">
							<div class="d-flex justify-content-between">
								<h2 class="" style="font-weight: bold; position: absolute;">🎮
									${reservation.store.storeName}</h2>
							</div>
							<div style="text-align: right;">
								<c:choose>
									<c:when test="${reservation.approveStatus eq  'APPROVED'}">
										<input type="submit" id="status-${reservation.id}"
											value="${reservation.approveStatus}" readonly
											style="margin-bottom: 5px; border: none; background-color: blue; color: white;">
										<form action="/report/${reservation.id}">
											<input type="submit" value="손님 신고하기">
										</form>
									</c:when>
									<c:when test="${reservation.approveStatus eq  'WATING'}">
										<input type="submit" id="status-${reservation.id}"
											value="${reservation.approveStatus}" readonly
											style="margin-bottom: 5px; border: none; background-color: orange; color: white;">
										<form>
											<input type="button" id="btn--approve-${reservation.id}"
												value="승인"> <input type="button"
												id="btn--reject-${reservation.id}" value="거절">
										</form>
									</c:when>
									<c:otherwise>
										<input type="submit" id="status-${reservation.id}"
											value="${reservation.approveStatus}" readonly
											style="margin-bottom: 5px; border: none; background-color: red; color: white;">
									</c:otherwise>

								</c:choose>
							</div>
							<div class="d-flex-column pl-3 ">
								<div>
									<span>* 예약자: ${reservation.user.username}</span>
								</div>
								<div>
									<span>* 결제 금액 : ${reservation.price}원</span>
								</div>
								<c:choose>
									<c:when
										test="${reservation.reservationDate == reservation.endDate}">
										<div>
											<span>* 예약일 : ${reservation.reservationDate}</span>
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<span>* 예약일 : ${reservation.reservationDate} ~
												${reservation.endDate}</span>
										</div>
									</c:otherwise>
								</c:choose>
								<div>
									<span>* 예약 시간 : ${reservation.reservationTime} ~
										${reservation.endTime}</span>
								</div>
								<div>
									<span>* 예약석 : ${reservation.reservationSeat}번 자리</span>
								</div>

							</div>
							<hr>
						</c:forEach>
						<input type="hidden" id="reservation-size" value="${lastId}">
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript" src="/js/reservation.js"></script>
<%@ include file="../../../layout/footer.jsp"%>