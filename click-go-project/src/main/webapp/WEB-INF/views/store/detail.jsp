<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<br>
<div class="container" id="store-update">
	<c:if test="${store.user.id eq principal.user.id}">
		<div id="view-more-title">
			<div>๐ ๋งค์ฅ ๊ด๋ฆฌ</div>
		</div>
		<span style="color: black">: ์ด์ฉ์์๊ฒ ๋ณด๋ ๊ฐ๊ฒ์ ํ๋ฉด ์๋๋ค.</span>
		<span style="color: black">์๋ ์์ ๋ฒํผ์ ๋๋ฌ ์ ๋ณด๋ ์ด๋ฏธ์ง๋ฅผ ๋ณ๊ฒฝํด๋ณด์ธ์!</span>
	</c:if>
	<hr>
</div>
<br>

<div class="container">
	<c:choose>
		<c:when test="${empty store}">
			<br>
			<div class="container d-flex">
				<h1 class="" style="font-weight: bold;">์ฅ.. ๊ด๋ฆฌ์์๊ฒ ๋ฌธ์ํด์ฃผ์ธ์.</h1>
			</div>
		</c:when>
		<c:otherwise>
			<div class=" justify-content-center ">

				<div>
					<div class="d-flex" style="align-items: flex-end;">
						<c:choose>
							<c:when test="${store.category.id eq 'PC๋ฐฉ' }">
								<h1 class="" style="font-weight: bold;">๐ป
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '๋ธ๋๋ฐฉ' }">
								<h1 class="" style="font-weight: bold;">๐ค
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '๋์ ๋ธ๋๋ฐฉ' }">
								<h1 class="" style="font-weight: bold;">๐ต
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '๋น๊ตฌ์ฅ' }">
								<h1 class="" style="font-weight: bold;">๐ฑ
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '๋ณผ๋ง์ฅ' }">
								<h1 class="" style="font-weight: bold;">๐ณ
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '์คํฌ๋ฆฐ์ผ๊ตฌ์ฅ' }">
								<h1 class="" style="font-weight: bold;">โพ
									${store.storeName}</h1>
							</c:when>

						</c:choose>


						<input type="hidden" value="${likeStoresEntity.id }"
							id="likeStoreId">
						<c:choose>
							<c:when
								test="${likeStoresEntity.likeStore eq false || empty likeStoresEntity}">
								<button type="button" id="store--wish--emptyheart"
									data-toggle="tooltip" data-placement="right"
									title="ํํธ๋ฅผ ํด๋ฆญํ์ฌ ์์๋ฆฌ์คํธ๋ฅผ ๋ฑ๋กํด๋ณด์ธ์!" data-like-btn='emptyHeartBtn'>โก</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="store--wish--heart"
									data-like-btn='heartBtn'>โฅ</button>
							</c:otherwise>
						</c:choose>

						<input type="hidden" value="${store.id }" id="storeId">
						<c:if test="${store.user.id eq principal.user.id}">
							<div class="store-detail-update">
								<a href="/care-store/update/${store.id}">์์ ํ๊ธฐ</a>
							</div>
						</c:if>
					</div>
				</div>


				<c:choose>
					<c:when test="${empty store.storeTEL}">
						<p class="store-detail-tel">๐ : ํ์ฌ ๊ฐ๊ฒ ์ฐ๋ฝ์ฒ๋ ๋ฑ๋ก ๋์ง ์์์ด์ ใ ใ </p>
					</c:when>
					<c:otherwise>
						<p class="store-detail-tel">๐ : ${store.storeTEL}</p>
					</c:otherwise>
				</c:choose>

				<a class="" id="kakaotalk-sharing-btn" href="javascript:;"> <img
					src="/image/kakao.png" alt="์นด์นด์คํก ๊ณต์  ๋ณด๋ด๊ธฐ ๋ฒํผ" width="200px" />
				</a> <br>
				<br>
				<br>
				<form action="/reservation/${store.id}" method="post"
					id="doReservation">
					<div class="justify-content-center">
						<div class="d-flex justify-content-center">
							<div>
								<input type="date" name="startDate" id="startDate"
									value="2023-02-09" min="2023-02-09" max="${maxDate}">
							</div>
							<div>
								<input type="date" name="endDate" id="endDate"
									value="2023-02-09" min="2023-02-09" max="${maxDate}">
							</div>
							<div>
								<input type="text" class="timepicker" name="startTime"
									id="startTime" value="${nowTime}" min="${nowTime}">
							</div>
							<div>
								<input type="text" class="timepicker" name="endTime"
									id="endTime" value="${nowTimeOnlyHour}"
									min="${nowTimeOnlyHour}">
							</div>
							<input type="hidden" id="storeId" value="${store.id }">
							<button type="submit" id="btn--time-check">์์ฝ ํ๊ธฐ</button>
						</div>
						<br> <br>
						<c:choose>
							<c:when test="${store.category.id eq 'PC๋ฐฉ' }">
								<%@ include file="../layout/pc-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '๋ธ๋๋ฐฉ' }">
								<%@ include file="../layout/singing-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '๋น๊ตฌ์ฅ' }">
								<%@ include file="../layout/billiard-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '๋์ ๋ธ๋๋ฐฉ' }">
								<%@ include file="../layout/coin-singing-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '๋ณผ๋ง์ฅ' }">
								<%@ include file="../layout/bowling-club.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '์คํฌ๋ฆฐ์ผ๊ตฌ์ฅ' }">
								<%@ include file="../layout/screen-ballpark.jsp"%>
							</c:when>
						</c:choose>

						<br>
						<div class="d-flex justify-content-center">
							<c:forEach var="image" items="${images}">
								<c:if test="${image.store.id eq store.id }">

									<div class="store-detail-main-img">
										<img src="http://localhost:7777/storeImage/${image.imageUrl}"
											alt="๊ฐ๊ฒ ์ฌ์ง" id="store-detail-img">

									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</form>
			</div>
			<div class="">
				<div class="d-flex  justify-content-center">
					<div class="d-flex mr-4 mt-5 ">
						<p>๐ ์์น : ${store.storeAddress}</p>
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

</div>


<br>
<br>
<div class="container">
	<h4 id="test style"
		onclick="
		if(plain.style.display=='none') {
		 plain.style.display=''; test.innerText = 'โ ๋ฆฌ๋ทฐ ์ ๊ธฐ'
		 } else {
			 plain.style.display = 'none';
			test.innerText = 'โ ๋ฆฌ๋ทฐ ๋ณด๊ธฐ'
		}">
		โ ๋ฆฌ๋ทฐ ๋ณด๊ธฐ</h4>
	<hr>
</div>
<div class="container" id="plain" style="display: none">

	<div class="d-flex flex-column pr-2 pl-2" style="background-color:">

		<c:forEach var="review" items="${reviewList }">
			<div class="m-3">

				<div class="mb-2" id="" style="background-color:; width: 10%;">
					<img alt="ํ๋กํ" src="/image/profile.png"
						style="width: 50%; border-radius: 50%">
				</div>
				<div class="mb-2" style="background-color:">
					<div class="mb-2">
						<c:choose>
							<c:when test="${review.starScore eq '1' }">โญ</c:when>
							<c:when test="${review.starScore eq '2' }">โญโญ</c:when>
							<c:when test="${review.starScore eq '3' }">โญโญโญ</c:when>
							<c:when test="${review.starScore eq '4' }">โญโญโญโญ</c:when>
							<c:when test="${review.starScore eq '5' }">โญโญโญโญโญ</c:when>
						</c:choose>
					</div>
					<div class="mb-2">
						<p>${review.user.username}๋</p>
					</div>
					<hr>
				</div>
				<div class="mb-2">
					<p>${review.content}</p>
				</div>
				<hr>
			</div>
		</c:forEach>
	</div>
</div>

<br>
<br>
<br>
<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript">
	$('document').ready(function() {
		$('#startTime').timepicker({
			timeFormat : 'HH:mm',
			interval : 10,
			startTime : '${nowTime}',
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
			startTime : '${nowTime}',
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
	});

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	});

	$(this).ready(function() {
		timeCheck();
		reservationIndex.addMap('${store.storeAddress}', '${store.storeName}');
	})
</script>
<script>
	let image = $("#store-detail-img").attr("src");
	Kakao.Share
			.createDefaultButton({
				container : '#kakaotalk-sharing-btn',
				objectType : 'location',
				address : `${store.storeAddress}`,
				addressTitle : `${store.storeName}`,
				content : {
					title : `Click Go - ${store.storeName}`,
					description : `์ต๊ณ ์ ์ธ๊ธฐ๋ฅผ ๋๋ ${store.storeName}`,
					imageUrl : image,
					link : {
						mobileWebUrl : 'http://localhost:7777',
						webUrl : 'http://localhost:7777',
					},
				},
				social : {
					likeCount : 286,
					commentCount : 45,
					sharedCount : 845,
				},
				buttons : [
						{
							title : '์น์ผ๋ก ๋ณด๊ธฐ',
							link : {
								mobileWebUrl : `http://localhost:7777/store/detail/${store.id}`,
								webUrl : `http://localhost:7777/store/detail/${store.id}`,
							},
						}, ],
			});
</script>
<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript" src="/js/wish-list.js"></script>
<%@ include file="../layout/footer.jsp"%>