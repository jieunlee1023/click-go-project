<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<c:forEach var="reservation" items="${reservations}">
	<div class="d-flex justify-content-between">
		<h2 class="" style="font-weight: bold; position: absolute;">🎮
			${reservation.store.storeName}</h2>
		<br>
	</div>
	<div style="text-align: right;">
		<input type="submit" id="status-${reservation.id}"
			value="${reservation.approveStatus}" readonly
			style="margin-bottom: 5px; border: none; background-color: red; color: white;">

	</div>
	<div class="d-flex-column pl-3 ">
		<div>
			<span>* 결제 금액 : ${reservation.price}원</span>
		</div>
		<c:choose>
			<c:when test="${reservation.reservationDate == reservation.endDate}">
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

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

