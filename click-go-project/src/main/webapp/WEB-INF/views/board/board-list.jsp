<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<div class="container">
	<div class="d-flex justify-content-between">
		<h1>클릭꼬 고객센터</h1>
		<form class="form-inline" action="/board/board-form">
			<button type="submit" class="btn btn-outline-info" id="btn--write">글쓰기</button>
		</form>
	</div>

	<div class="input-group mb-3">
		<form action="/board/search" class="form-inline" method="get">
			<input type="text" class="form-control" placeholder="검색할래?" name="q" value="${q }">
			<div class="input-group-append">
				<button class="btn bg-secondary">검색할래?</button>
			</div>
		</form>
	</div>
</div>

<c:forEach var="board" items="${boards}">
	<div class="container">
		<div class="list-group">
			<a href="/board/${board.id }" class="list-group-item list-group-item-action">${board.title }</a>
		</div>
	</div>
</c:forEach>

<ul class="pagination justify-content-center">
	<c:set var="isDisabled" value="disabled"></c:set>
	<c:set var="isNotDisabled" value=""></c:set>
	<li class="page-item ${boards.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${boards.number - 1 }">Previous</a></li>
	<!-- 반복문 처리 하기-->
	<!-- 1 2 3, 1 2 3 4 , 1 2 3 4 5  -->
	<c:forEach var="num" items="${pageNumbers }">
		<c:choose>
			<c:when test="${nowPage eq num }">
				<!-- http://localhost:9090/board/search?q=%EC%95%84%EB%8B%88 -->
				<!-- 0 부터 시작 컨트롤러에서 +1 -->
				<li class="page-item active"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<li class="page-item ${boards.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${boards.number + 1 }">Next</a></li>

</ul>




</div>
















<%@ include file="../layout/footer.jsp"%>




