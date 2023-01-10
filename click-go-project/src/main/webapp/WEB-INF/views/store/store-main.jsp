<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>

<div class="container">


	<nav class="mynav">
		<ul>
			<li><a href="/store/main">전체 보기</a></li>

			<c:forEach var="category" items="${categories}">
				<a href="/store/main?pageName=${category}">${category}</a>
			</c:forEach>

		</ul>
	</nav>
	

	<div class="search--container">
		<form>
			<div class="finder">
				<div class="finder__outer">
					<div class="finder__inner">
						<div class="finder__icon" ref="icon"></div>
						<input class="finder__input" type="text" name="q" />
					</div>
				</div>
			</div>
		</form>
	</div>

	<br> <br> <input type="hidden" id="store-size"
		value="${stores.content.size()}">
	<div class="support-grid"></div>

	<div class="band">
		<c:forEach var="store" items="${stores.content }">
			<div class="item-2">
				<a href="/store/detail/${store.id}" class="main--card" style="	text-decoration: none;"
						rel="pulse-grow" id="hover-shadow"> 
				<c:forEach
						var="image" items="${images }" varStatus="status">
						<c:if test="${store.id eq  image.store.id}">
							<img class="thumb"
								src="http://localhost:7777/storeImage/${image.imageUrl}">
						</c:if>
					</c:forEach>
					<div class="main--card--text">
						<h1 id="main--card--text--h1">${store.storeName}</h1>
						<span>📍 ${store.storeAddress}</span>
						<span>⭐ 리뷰평점!!</span>
					</div>
				</a>
			</div>

		</c:forEach>
	</div>

</div>
<br>
<br>
<br><br><br>

<script type="text/javascript" src="/js/store.js"></script>
<%@ include file="../layout/footer.jsp"%>
