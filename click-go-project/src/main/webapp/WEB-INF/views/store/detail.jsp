<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>

<div class="container" id="store-update">
	<div id="view-more-title">
		<div>🌟 매장 관리</div>
	</div>
	<span style="color: #6478ff">: 이용자에게 보는 가게의 화면 입니다.</span> <span
		style="color: #6478ff">아래 수정버튼을 눌러 정보나 이미지를 변경해보세요!</span>
	<hr>
	<br>
</div>
<br>

<div class="container">
	<form action="/reservation/${store.id}?paymentType=KAKAO" method="post">
		<c:choose>
			<c:when test="${empty store}">
				<br>
				<div class="container d-flex">
					<h1 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container d-flex">
					<div class=" justify-content-center ">
						<div>
							<div class="d-flex" style="align-items: flex-end;">
								<c:choose>
									<c:when test="${store.category.id eq 'PC방' }">
										<h1 class="" style="font-weight: bold;">💻
											${store.storeName}</h1>
									</c:when>
									<c:when test="${store.category.id eq '노래방' }">
										<h1 class="" style="font-weight: bold;">🎤
											${store.storeName}</h1>
									</c:when>
									<c:when test="${store.category.id eq '동전노래방' }">
										<h1 class="" style="font-weight: bold;">🎵
											${store.storeName}</h1>
									</c:when>
									<c:when test="${store.category.id eq '당구장' }">
										<h1 class="" style="font-weight: bold;">🎱
											${store.storeName}</h1>
									</c:when>
									<c:when test="${store.category.id eq '볼링장' }">
										<h1 class="" style="font-weight: bold;">🎳
											${store.storeName}</h1>
									</c:when>
									<c:when test="${store.category.id eq '스크린야구장' }">
										<h1 class="" style="font-weight: bold;">⚾
											${store.storeName}</h1>
									</c:when>
								</c:choose>

								<c:if test="${role eq 'HOST'}">
									<div class="store-detail-update">
										<a href="/care-store/update/${store.id}">수정하기</a>
									</div>
								</c:if>
							</div>
						</div>


						<c:choose>
							<c:when test="${empty store.storeTEL}">
								<p class="store-detail-tel">📞 :  현재 가게 연락처는 등록 되지 않았어요 ㅠㅠ</p>
							</c:when>
							<c:otherwise>
								<p class="store-detail-tel">📞 : ${store.storeTEL}</p>
							</c:otherwise>
						</c:choose>
						<div class="justify-content-center">
							<div class="d-flex justify-content-center">
								<div>
									<input type="date" name="startDate" id="startDate"
										value="${nowDate}" min="${nowDate}" max="${maxDate}">
								</div>
								<div>
									<input type="date" name="endDate" id="endDate"
										value="${nowDate}" min="${nowDate}" max="${maxDate}">
								</div>
								<div>
									<input type="text" class="timepicker" name="startTime"
										id="startTime" value="시간을 선택해주세요." min="${nowTime}">
								</div>
								<div>
									<input type="text" class="timepicker" name="endTime"
										id="endTime" value="시간을 선택해주세요." min="${nowTime}">
								</div>
								<input type="hidden" id="storeId" value="${store.id }">
								<button type="submit" id="btn--time-check">예약 하기</button>
							</div>


							<br>
							<div class="d-flex justify-content-center">
								<c:forEach var="image" items="${images}">
									<c:if test="${image.store.id eq store.id }">

										<div class="store-detail-main-img">
											<img src="http://localhost:7777/storeImage/${image.imageUrl}"
												alt="가게 사진" id="store-detail-img">

										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

				<%
				int start = 1;
				int standard = 6;
				int space = 6;

				int firstSpace = space;
				int secondSpace = (space * 3);
				int thirdSpace = (space * 5);
				int foursSpace = (space * 7);

				int first = (standard * 2);
				int second = (standard * 4);
				int third = (standard * 6);
				int fours = (standard * 8);
				int totalRoomCount = 63;
				%>
				<div class="d-flex justify-content-center mt-5">
					<div class="store--seat--drawing">
						<div class=" ml-1">

							<div class="d-flex ml-5">
								<%
								for (start = 1; start < totalRoomCount; start++) {
								%>
								<input type="checkbox" id="<%=start%>"
									class="d-flex justify-content-center mr-1" name="seatNumber"
									style="border: 1px solid black; width: 30px; height: 30px"
									value="<%=start%>">


								<%
								if (start == firstSpace) {
								%>
								&nbsp; &nbsp; &nbsp;
								<%
								}
								%>
								<%
								if (start == first) {
									break;
								}
								%>

								<%
								}
								%>
							</div>
							<div class="d-flex ml-5 mt-1">
								<%
								for (start = first + 1; start < totalRoomCount; start++) {
								%>
								<input type="checkbox" id="<%=start%>"
									class="d-flex justify-content-center mr-1" name="seatNumber"
									style="border: 1px solid black; width: 30px; height: 30px"
									value="<%=start%>">

								<%
								if (start == secondSpace) {
								%>
								&nbsp; &nbsp; &nbsp;
								<%
								}
								%>
								<%
								if (start == second) {
									break;
								}
								%>
								<%
								}
								%>
							</div>
							<br>
							<div class="d-flex ml-5">
								<%
								for (start = second + 1; start < totalRoomCount; start++) {
								%>
								<input type="checkbox" id="<%=start%>"
									class="d-flex justify-content-center mr-1" name="seatNumber"
									style="border: 1px solid black; width: 30px; height: 30px"
									value="<%=start%>">

								<%
								if (start == thirdSpace) {
								%>
								&nbsp; &nbsp; &nbsp;
								<%
								}
								%>
								<%
								if (start == third) {
									break;
								}
								%>

								<%
								}
								%>
							</div>

							<div class="d-flex ml-5 mt-1">
								<%
								for (start = third + 1; start < totalRoomCount; start++) {
								%>
								<input type="checkbox" id="<%=start%>"
									class="d-flex justify-content-center mr-1" name="seatNumber"
									style="border: 1px solid black; width: 30px; height: 30px"
									value="<%=start%>">

								<%
								if (start == foursSpace) {
								%>
								&nbsp; &nbsp; &nbsp;
								<%
								}
								%>
								<%
								if (start == fours) {
									break;
								}
								%>
								<%
								}
								%>
							</div>
							<br>
							<div class="d-flex mt-2">
								<%
								for (start = fours + 1; start <= totalRoomCount; start++) {
								%>
								<input type="checkbox" id="<%=start%>"
									class="d-flex justify-content-center mr-1 disabled"
									name="seatNumber"
									style="border: 1px solid black; width: 30px; height: 30px"
									value="<%=start%>">

								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
				<div class="">
					<div class="d-flex  justify-content-center">
						<div class="d-flex mr-4 mt-5 ">
							<p>📍 위치 : ${store.storeAddress}</p>
						</div>

						<input type="hidden" value="${store.storeAddress}"
							id="store-address"> <input type="hidden"
							value="${store.storeName}" id="store-name">
					</div>
					<div class="d-flex justify-content-center">
						<div id="map"
							style="width: 80%; height: 300px; justify-content: center"></div>
					</div>
				</div>



			</c:otherwise>
		</c:choose>
	</form>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript">
	$('document').ready(function() {
		$('#startTime').timepicker({
			timeFormat : 'HH:mm',
			interval : 10,
			startTime : '${nowTimeOnlyHour}',
			dynamic : false,
			dropdown : true,
			scrollbar : true,

			change : function(time) {
				var element = $(this), text;
				var timepicker = element.timepicker();
				text = timepicker.format(time);
				timeCheck();
			}
		});
		$('#endTime').timepicker({
			timeFormat : 'HH:mm',
			interval : 10,
			startTime : '${nowTimeOnlyHour}',
			dynamic : false,
			dropdown : true,
			scrollbar : true,
		});
		$()
	});
</script>

<script type="text/javascript" src="/js/store.js"></script>
<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript" src="/js/wish-list.js"></script>
<%@ include file="../layout/footer.jsp"%>