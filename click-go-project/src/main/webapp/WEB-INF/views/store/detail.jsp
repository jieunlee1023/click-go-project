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

<form action="/reservation/${store.id}?paymentType=KAKAO" method="post">
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
						<button type="submit" id="btn--time-check">예약 하기</button>
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
										<p>카테고리 : ${store.category.id}</p>
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
							<c:choose>
								<c:when test="${store.category.id eq 'PC방' }">
									<%@ include file="../layout/pc-room.jsp"%>
								</c:when>
							</c:choose>
						</div>
						<input type="hidden" value="${store.storeAddress}"
							id="store-address"> <input type="hidden"
							value="${store.storeName}" id="store-name">
					</div>
					<div>
						<br>
					</div>
					<div id="map" style="width: 700px; height: 350px;"></div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript" src="/js/reservation.js"></script>
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


<%@ include file="../layout/footer.jsp"%>