<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<div class="container" id="store-update">
	<div id="view-more-title">
		<div>🌟 매장 관리</div>
	</div>
	<span style="color: #6478ff">: 이용자들이 보는 가게의 화면을 꾸며보세요 !</span>
	<hr>
	<br>
</div>
<br>

<form action="/reservation/1" method="post">
	<div class="d-flex-column justify-content-center">
		<c:choose>
			<c:when test="${empty store}">
				<br>
				<div class="container d-flex">
					<h2 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h2>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container">
					<div class="d-flex justify-content-center">
						<div>
							<input type="date" name="startDate" id="startDate"
								value="${nowDate}" min="${nowDate}" max="${maxDate}">
						</div>
						<div>
							<input type="date" name="endDate" id="endDate" value="${nowDate}"
								min="${nowDate}" max="${maxDate}">
						</div>
						<div>
							<input type="text" class="timepicker" name="startTime"
								id="startTime" value="시간을 선택해주세요." min="${nowTime}">
						</div>
						<div>
							<input type="text" class="timepicker" name="endTime" id="endTime"
								value="시간을 선택해주세요." min="${nowTime}">
						</div>
						<input type="hidden" id="storeId" value="${store.id }">
						<button type="button" id="btn--time-check">예약 하기</button>
					</div>


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
										<p>지점 : ${store.storeAddress}</p>
										<p>카테고리 : ${store.category}</p>
										<p>총 자릿수 : ${store.storeTotalRoomCount}</p>

										<c:choose>
											<c:when test="${empty store.storeTEL}">
												<p>가게 연락처는 등록 되지 않았어요 ㅠㅠ</p>
											</c:when>
											<c:otherwise>
												<p>가게 연락처 : ${store.storeTEL}</p>
											</c:otherwise>
										</c:choose>

										<c:if test="${role eq 'HOST'}">
											<a href="/care-store/update/${store.id}">수정</a>
										</c:if>
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

							<div class="d-flex justify-content-center"
								style="border: 1px solid black; width: 550px; height: 245px">
								<div class=" ml-1 mt-4">

									<div class="d-flex ml-4">
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
									<div class="d-flex ml-4 mt-1">
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
									<div class="d-flex ml-4">
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

									<div class="d-flex ml-4 mt-1">
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
							<button type="submit">예약</button>
						</div>
					</div>
					
					
					
					
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<br>
</form>
<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript">
$('document').ready(function () {
	$('input.timepicker').timepicker({
            timeFormat: 'HH:mm',
            interval: 10,
            startTime: '${nowTimeOnlyHour}',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
    });
</script>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../layout/footer.jsp"%>