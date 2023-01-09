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
								<h2 class="" style="font-weight: bold;">🎮
									${reservation.store.storeName}</h2>
								<div class="d-flex justify-content-end">
									<c:choose>
										<c:when test="${reservation.approveStatus eq  'APPROVED'}">
											<div class="">
												<div class="d-flex justify-content-end">
													<form action="/report/${reservation.id}">
														<input type="submit" value="⛔"
															style="border: none; background-color: transparent;">
													</form>
													<form action="/review/${reservation.store.id}">
														<input type="submit" value="📝"
															style="border: none; background-color: transparent;">
													</form>
												</div>
												<input type="submit" id="status-${reservation.id}"
													value="${reservation.approveStatus}" readonly
													style="margin-bottom: 5px; border: none;  height:25px; 
													background-color: blue; color: white;">
											</div>
										</c:when>
										<c:when test="${reservation.approveStatus eq  'WATING'}">
											<input type="submit" id="status-${reservation.id}"
												value="${reservation.approveStatus}" readonly
												style="margin-bottom: 5px; border: none;  height:25px; 
												background-color: orange; color: white;">
										</c:when>
										<c:otherwise>
											<br>
											<input type="submit" id="status-${reservation.id}"
												value="${reservation.approveStatus}" readonly
												style="margin-bottom: 5px; border: none;  height:25px; 
												background-color: red; color: white;">

										</c:otherwise>
									</c:choose>
								</div>
							</div>

							<div class="container">
								<table class="table" id="answer-list-table">
									<thead>
										<tr style="text-align: center;">
											<th>결제금액</th>
											<th>예약일</th>
											<th>예약시간</th>
											<th>예약석</th>
										</tr>
									</thead>
									<tbody>

										<tr style="text-align: center;">
											<td><p>${reservation.price}원</p></td>

											<c:choose>
												<c:when
													test="${reservation.reservationDate == reservation.endDate}">
													<td><p>${reservation.reservationDate}</p></td>
												</c:when>
												<c:otherwise>
													<td><p>${reservation.reservationDate}~
															${reservation.endDate}</p></td>
												</c:otherwise>
											</c:choose>
											<td><p>${reservation.reservationTime}~
													${reservation.endTime}</p></td>
											<td><p>${reservation.reservationSeat}번자리</p></td>
									</tbody>
								</table>
								<br>
							</div>
							
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
								<h2 class="" style="font-weight: bold;">🎮
									${reservation.store.storeName}</h2>
								<div class="d-flex justify-content-end">
									<c:choose>
										<c:when test="${reservation.approveStatus eq  'APPROVED'}">
											<div class="">
												<div class="d-flex justify-content-end">
													<form action="/report/${reservation.id}">
														<input type="submit" value="⛔"
															style="border: none; background-color: transparent;">
													</form>
												</div>
												<input type="submit" id="status-${reservation.id}"
													value="${reservation.approveStatus}" readonly
													style="margin-bottom: 5px; border: none; height: 25px; background-color: blue; color: white;">
											</div>
										</c:when>
										<c:when test="${reservation.approveStatus eq  'WATING'}">
											<input type="submit" id="status-${reservation.id}"
												value="${reservation.approveStatus}" readonly
												style="margin-bottom: 5px; border: none; height: 25px; background-color: orange; color: white;">
										</c:when>
										<c:otherwise>
											<br>
											<input type="submit" id="status-${reservation.id}"
												value="${reservation.approveStatus}" readonly
												style="margin-bottom: 5px; border: none; height: 25px; background-color: red; color: white;">

										</c:otherwise>
									</c:choose>
								</div>
							</div>

							<div class="container">
								<table class="table" id="answer-list-table">
									<thead>
										<tr style="text-align: center;">
											<th>예약자</th>
											<th>결제금액</th>
											<th>예약일</th>
											<th>예약시간</th>
											<th>예약석</th>
										</tr>
									</thead>
									<tbody>

										<tr style="text-align: center;">
											<td><p>${reservation.user.id}</p></td>
											<td><p>${reservation.price}원</p></td>

											<c:choose>
												<c:when
													test="${reservation.reservationDate == reservation.endDate}">
													<td><p>${reservation.reservationDate}</p></td>
												</c:when>
												<c:otherwise>
													<td><p>${reservation.reservationDate}~
															${reservation.endDate}</p></td>
												</c:otherwise>
											</c:choose>
											<td><p>${reservation.reservationTime}~
													${reservation.endTime}</p></td>
											<td><p>${reservation.reservationSeat}번자리</p></td>
									</tbody>
								</table>
								<br>
							</div>


						</c:forEach>

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