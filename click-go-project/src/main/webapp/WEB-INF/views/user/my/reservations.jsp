<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
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
							<div class="media border mt-3"
								style="width: 700px; height: 430px; border-radius: 15px;">
								<div class="d-flex-column">
									<img src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
										style="width: 700px; height: 300px; border-radius: 15px;">
									<div class="media-body">
										<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
											<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
												<h5 class="" style="font-weight: bold;">${reservation.store.storeName}</h5>
												<p class="mr-3 ">${reservation.approveStatus}</p>
											</div>
											<div class="d-flex-column pl-3 ">
												<span>${reservation.reservationTime}</span>
												<div class="d-flex justify-content-between">
													<span>${reservation.price}원</span> <span class="mr-4 md-5">${reservation.user.username}님의
														발자취 보러가기</span>
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
<br>
<br>
<br>
<br>
<br>
<div>
	<ul class="pagination justify-content-center">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotDisabled" value=""></c:set>
		<li class="page-item ${boards.first ? isDisabled : isNotDisabled} "><a
			class="page-link" href="?page=0&q=${q}">◀</a></li>

		<li class="page-item ${boards.first ? isDisabled : isNotDisabled }"><a
			class="page-link" href="?page=${boards.number - 1}&q=${q}">이전</a></li>

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

		</c:forEach>
		<!-- 		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item active"><a class="page-link" href="#">2</a></li> -->
		<li class="page-item ${boards.last ? isDisabled : isNotDisabled}"><a
			class="page-link" href="?page=${boards.number + 1}&q=${q}">다음</a></li>
		<li class="page-item ${boards.last ? isDisabled : isNotDisabled}"><a
			class="page-link" href="?page=${boards.totalPages - 1}&q=${q}">▶</a></li>
	</ul>
</div>
<br>
<br>
<%@ include file="../../layout/footer.jsp"%>