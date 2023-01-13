<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>

<div class="container">


<br><br>
	<nav class="mynav">
		<ul>
			<li><a href="/store/main" style="margin-right: 30px;">전체 보기</a></li>

			<c:forEach var="category" items="${categories}">
				<a style="margin-right: 30px;" href="/store/main?pageName=${category}&q=${q}">${category}</a>
			</c:forEach>

		</ul>
	</nav>
	
		<div class="input-group mb-3 justify-content-end">
		<form action="/store/main?q=${q}"
			class="form-inline" method="get">
			<input type="text" class="form-control" placeholder="검색어를 입력하세요."
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="search--franchise">검색</button>
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
						<h2 id="main--card--text--h1">${store.storeName}</h2>
						<span>📍 ${store.storeAddress}</span>
						<br>
						<c:set var="a" value="${starScoreMap.get(store.id)}"></c:set>
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
			<li class="page-item ${stores.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${stores.number - 1 }&q=${q}"
				id="page--previous">이전</a></li>
			<!-- 반복문 처리 하기-->
			<!-- 1 2 3, 1 2 3 4 , 1 2 3 4 5  -->
			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage eq num }">
						<!-- http://localhost:9090/board/search?q=%EC%95%84%EB%8B%88 -->
						<!-- 0 부터 시작 컨트롤러에서 +1 -->
						<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" id="page--select">${num }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${stores.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${stores.number + 1 }&q=${q}" id="page--next">다음</a></li>

		</ul>
	</div>
	
	
	
	

</div>
<br>
<br>
<br>
<br>
<br>



<script type="text/javascript" src="/js/reservation.js"></script>
<%@ include file="../layout/footer.jsp"%>
