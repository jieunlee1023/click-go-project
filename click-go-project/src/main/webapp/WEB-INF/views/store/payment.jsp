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
						<div>
							카테고리 : <span id="categoryId">${store.category.id}</span>
						</div>
						<div>
							총 자릿수 : <span id="totalRoomCount">${store.storeTotalRoomCount}</span>
						</div>
						<div>
							기간 : <span id="startDate">${reservationEntity.reservationDate}</span>~<span
								id="endDate">${reservationEntity.endDate}</span>
						</div>
						<div>
							시간 : <span id="startTime">${reservationEntity.reservationTime}</span>~<span
								id="endTime">${reservationEntity.endTime}</span>
						</div>

						<c:forEach var="reservation" items="${reservations}">
							<div>
								예약 하신 자리 : <span
									id="reservationSeat-${reservations.indexOf(reservation)}">${reservation.reservationSeat}</span>번
							</div>
						</c:forEach>

						<div>
							결제하실 금액 : <span id="price">${(reservationEntity.price) * reservations.size()}</span>원
						</div>
						<c:choose>
							<c:when test="${ store.storeTEL}">
								<p>가게 연락처는 등록 되지 않았어요 ㅠㅠ</p>
							</c:when>
							<c:otherwise>
								<span>가게 연락처 : <span id="storeTEL">${store.storeTEL}</span></span>
							</c:otherwise>
						</c:choose>
						<input type="hidden" id="storeId" value="${store.id}"> <input
							type="hidden" id="reservationCount"
							value="${reservations.size()}"> <input type="button"
							id="btn--kakaopay" value="카카오페이">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/js/payment.js"></script>
<%@ include file="../layout/footer.jsp"%>