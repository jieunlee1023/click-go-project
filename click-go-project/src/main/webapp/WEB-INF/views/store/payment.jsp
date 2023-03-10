<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container" id="reservation">

	<div>
		<div id="view-more-title">
			<div>๐ณ ์์ฝ ํ์ธ</div>
		</div>
		<div class="d-flex-column">
		<c:if test="${user.point ne 0}">
			<div class="d-flex justify-content-end">
				<div class="d-flex justify-content-between">
					<p>์์ฌ ํฌ์ธํธ : ${user.point}P ์ฌ์ฉ</p>
						<input class="d-flex form-check-input pr-3" type="checkbox" id="isUsePoint">
				</div>
			</div>
		</c:if>
				<div class="d-flex justify-content-end">
					๋ฆฌ๋ทฐ๋ฅผ ์์ฑํ๊ณ  ํฌ์ธํธ๋ก ๊ฒฐ์ ํ์ธ์ !
				</div>
		</div>
	</div>
	<hr>
	<br>

	<h5 class="" style="font-weight: bold;">${store.storeName}
		(${store.category.id})</h5>

	<table class="table" id="answer-list-table">
		<thead>
			<tr style="text-align: center;">
				<th>์ฃผ์</th>
				<th>์์ฝ์ผ</th>
				<th>์์ฝ์๊ฐ</th>
				<th>์์ฝ์</th>
				<th>๊ฒฐ์ ๊ธ์ก</th>
				<th>๊ฒฐ์ ํ๊ธฐ</th>
			</tr>
		</thead>
		<tbody>

			<tr style="text-align: center;">
				<td><p>${store.storeAddress}
						<br> ( ${store.storeTEL} )
					</p></td>
				<td><p>
						<span id="startDate" style="border: none;">${reservationEntity.reservationDate}</span>~<span
							id="endDate" style="border: none;">${reservationEntity.endDate}</span>
					</p></td>
				<td><p>
						<span id="startTime" style="border: none;">${reservationEntity.reservationTime}</span>~<span
							id="endTime" style="border: none;">${reservationEntity.endTime}</span>
					</p></td>
				<td><c:forEach var="reservation" items="${reservations}">
						<span id="reservationSeat-${reservations.indexOf(reservation)}">${reservation.reservationSeat}</span>๋ฒ /
					</c:forEach></td>
				<td><p>
						<span id="price">${(reservationEntity.price) * reservations.size()}</span>์
					</p></td>
				<td><button
						style="border: none; background-color: transparent;"
						id="btn--kakaopay" value="์นด์นด์คํ์ด">
						<img src="/image/kakaopay.png" width="80px;">
					</button></td>
		</tbody>
	</table>

	<input type="hidden" id="storeId" value="${store.id}"> <input
		type="hidden" id="reservationCount" value="${reservations.size()}">

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript" src="/js/payment.js"></script>
<%@ include file="../layout/footer.jsp"%>