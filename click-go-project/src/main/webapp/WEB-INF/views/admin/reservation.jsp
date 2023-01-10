<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<br>
<div class="container mb-5" id="">
	<div id="view-more-title">
		<div>
			🕹️ 예약조회 <a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>
	</div>
</div>


<div class="container mb-5">
	<table class="table" id="answer-list-table">
		<thead>
			<tr style="text-align: center;">
				<th>카테고리</th>
				<th>가맹점명</th>
				<th>결제금액</th>
				<th>예약날짜시작</th>
				<th>예약날짜끝</th>
				<th>예약시간</th>
				<th>예약석</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reservation" items="${reservations}">
				<tr style="text-align: center;">
					<td>${reservation.store.category.id }</td>
					<td>${reservation.store.storeName}</td>
					<td>${reservation.price}원</td>
					<td>${reservation.reservationDate}</td>
					<td>${reservation.endDate}</td>
					<td>${reservation.reservationTime}~${reservation.endTime}</td>
					<td>${reservation.reservationSeat}번자리</td>
					<td><input type="submit" id="status-${reservation.id}" value="${reservation.approveStatus}" readonly
						style="margin-bottom: 5px; border: none; background-color: orange; color: white;"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>
<br>
<br>
<br>
<br>




<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

