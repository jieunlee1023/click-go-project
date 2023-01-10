<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="notice">
	<div id="view-more-title">
		<div>💖 즐겨찾기</div>
		<br>
	</div>

	<span style="color: black">: 자주 가는 곳을 등록하시면 더욱 편하게 예약을 하실 수
		있습니다.</span> <br>
	<hr>
	<br>
	<c:choose>
		<c:when test="${empty myLikeStoresList}">
			<div class="d-flex justify-content-center">
				<div id="franchise--none">
					<br> <br>
					<div>
						현재 즐겨찾기에 등록하신 가맹점이 <br> 존재하지 않습니다 !
					</div>
					<br>
				</div>
			</div>
		</c:when>

		<c:otherwise>

			<div class="container wishlist ">

				<c:forEach var="myLikeStoresList" items="${myLikeStoresList}">
					<div class="wishlist--main border" id="myLikeStoresList-${myLikeStoresList.id}">
						<div class="d-flex justify-content-end">
							<button id="wishList--delete--btn" onclick="wishList.delete(${myLikeStoresList.id})">X</button>
						</div>
						<h2 class="" style="font-weight: bold;">◾
							${myLikeStoresList.store.storeName}</h2>
						<br>
						<c:forEach var="image" items="${images }">
							<c:if test="${myLikeStoresList.store.id eq  image.store.id}">
								<img src="http://localhost:7777/storeImage/${image.imageUrl}"
									style="width: 300px; height: 300px; border-radius: 50%;">
							</c:if>
						</c:forEach>
						<div>
							<br>
							<div id="wishlist--btn">
								<a href="/store/detail/${myLikeStoresList.store.id }"
									id="wishlist--btn-a">구경하러가기!</a>
							</div>
						</div>
						<span>📍 ${myLikeStoresList.store.storeAddress}</span>
					</div>

				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<br>
<br>
<br>
<script type="text/javascript" src="/js/wish-list.js"></script>
<%@ include file="../../../layout/footer.jsp"%>