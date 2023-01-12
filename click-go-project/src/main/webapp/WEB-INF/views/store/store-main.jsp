<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>

<div class="container">
<!-- 검색 -->
		<div class="">
			<form action="/store/main" class="" method="get">
				<input type="text" class="" placeholder="검색어를 입력하세요." name="q" value="${q }" id="board--search--input">
				<button class="btn" id="board--search--btn" type="submit">검색</button>
			</form>
		</div>

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
						<input class="finder__input" type="text" name="q" value="${q }"/>
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
				<a href="/store/detail/${store.id}" class="main--card"
					style="text-decoration: none;" rel="pulse-grow" id="hover-shadow">
					<c:forEach var="image" items="${images }" varStatus="status">
						<c:if test="${store.id eq  image.store.id}">
							<img class="thumb"
								src="http://localhost:7777/storeImage/${image.imageUrl}">
						</c:if>
					</c:forEach>
					<div class="main--card--text">
						<h1 id="main--card--text--h1">${store.storeName}</h1>
						<span>📍 ${store.storeAddress}</span>
						<c:set var="a" value="${starScoreMap.get(store.id)}"></c:set>
						<c:out value="${a}"></c:out>
						<c:if test="${a eq 1}">⭐</c:if>
						<c:if test="${a eq 2}">⭐⭐</c:if>
						<c:if test="${a eq 3}">⭐⭐⭐</c:if>
						<c:if test="${a eq 4}">⭐⭐⭐⭐</c:if>
						<c:if test="${a eq 5}">⭐⭐⭐⭐⭐</c:if>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	
	
	<div class="m-5">
		<ul class="pagination justify-content-center" style="border-radius: 0px;">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li class="page-item ${storess.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${storess.number - 1 }"
				id="page--previous">이전</a></li>
			<!-- 반복문 처리 하기-->
			<!-- 1 2 3, 1 2 3 4 , 1 2 3 4 5  -->
			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage1 eq num }">
						<!-- http://localhost:9090/board/search?q=%EC%95%84%EB%8B%88 -->
						<!-- 0 부터 시작 컨트롤러에서 +1 -->
						<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" id="page--select">${num }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${storess.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${storess.number + 1 }" id="page--next">다음</a></li>

		</ul>
	</div>
	
	
	
	

</div>
<br>
<br>
<br>
<br>
<br>



<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript" src="/js/store.js"></script>
<%@ include file="../layout/footer.jsp"%>
