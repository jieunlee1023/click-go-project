<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div id="store--main">
		<div class="d-flex justify-contet-center ">
			<div>
				<h2>${store.storeName}</h2>
				<p class="store-main-address">📍 주소 : ${store.storeAddress}</p>
			</div>
			<a id="store-in-btn" href="/store/detail/${store.id}">Click Go! </a>
		</div>
		<br>
		<div class=" d-flex store-main">

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
<br>

