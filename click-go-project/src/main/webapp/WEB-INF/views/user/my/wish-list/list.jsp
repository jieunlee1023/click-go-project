<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="notice">
	<div id="view-more-title">
		<div>π μ¦κ²¨μ°ΎκΈ°</div>
		<br>
	</div>

	<span style="color: black">: μμ£Ό κ°λ κ³³μ λ±λ‘νμλ©΄ λμ± νΈνκ² μμ½μ νμ€ μ
		μμ΅λλ€.</span> <br>
	<hr>
	<br>
	<c:choose>
		<c:when test="${empty myLikeStoresList}">
			<div class="d-flex justify-content-center">
				<div id="franchise--none">
					<br> <br>
					<div>
						νμ¬ μ¦κ²¨μ°ΎκΈ°μ λ±λ‘νμ  κ°λ§Ήμ μ΄ <br> μ‘΄μ¬νμ§ μμ΅λλ€ !
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
						<h2 class="" style="font-weight: bold;">βΎ
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
									id="wishlist--btn-a">κ΅¬κ²½νλ¬κ°κΈ°!</a>
							</div>
						</div>
						<span>π ${myLikeStoresList.store.storeAddress}</span>
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