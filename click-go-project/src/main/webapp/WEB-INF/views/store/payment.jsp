<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="d-flex justify-content-center">
	<div class=" d-flex media border m-3"
		style="width: 800px; height: 510px; border-radius: 15px;">
		<div class="d-flex-column">
			<img src="${image}" alt="가게 사진"
				style="width: 900px; height: 400px; border-radius: 15px;">
			<div class="media-body md-5">
				<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
					<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
						<h5 class="" style="font-weight: bold;">${store.storeName}</h5>
					</div>
					<div class="d-flex-column mr-4 mt-3 justify-content-end">
						<span>주소 : ${store.storeAddress}</span>
						<p>카테고리 : ${store.category.id}</p>
						<p>총 자릿수 : ${store.storeTotalRoomCount}</p>
						<p>${startDate}~${endDate}</p>
						<p>${startTime}~${endTime}</p>
						<c:forEach var="reservation" items="${reservations}">
							<p>예약 하신 자리 ${reservation.reservationSeat}번</p>
						</c:forEach>
						<p>결제하실 금액 ${(price) * reservations.size()}원</p>
						<c:choose>
							<c:when test="${empty store.storeTEL}">
								<p>가게 연락처는 등록 되지 않았어요 ㅠㅠ</p>
							</c:when>
							<c:otherwise>
								<p>가게 연락처 : ${store.storeTEL}</p>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="reservationCount"
							value="${reservations.size()}"> <a
							href="/payment/${store.id}?payment=NAVERPAY">네이버페이</a> <a
							href="/payment/${store.id}?payment=KAKAOPAY">카카오페이</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>