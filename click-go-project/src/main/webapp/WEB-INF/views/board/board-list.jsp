<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<!--  -->

<div class="container">

	<!-- 제목 -->
	<div class="d-flex justify-content-start">
		<h1 class="display-4">Click-Go Board !!!</h1>
	</div>

	<!-- 글쓰기버튼 -->
	<div class="mb-5 d-flex justify-content-end">
		<form class="form-inline" action="/board/board-write-form">
			<button type="submit" class="btn btn-outline-success" id="btn--write">글쓰기</button>
		</form>
	</div>

	<div class="input-group mt-5 mb-5 d-flex justify-content-end">
		<form action="/board/search" class="form-inline" method="get">
			<input type="text" class="form-control mr-2" placeholder="검색" name="q" value="${q }">
			<button class="btn btn-outline-dark" type="submit">검색</button>
		</form>
	</div>



	<!-- 내용시작 -->
	<!-- <div class="container row" style="float: none; margin: 100 auto;"> -->


	<div class="row border-top border-bottom pt-2">
		<div class="col-lg">
			<p class="font-weight-bold" style="font-family: monospace; font-weight: light;">번호</p>
		</div>
		<div class="col-lg">
			<p class="font-weight-bold" style="font-family: monospace; font-weight: light;">제목</p>
		</div>
		<div class="col-lg">
			<p class="font-weight-bold" style="font-family: monospace; font-weight: light;">글쓴이</p>
		</div>
		<div class="col-lg">
			<p class="font-weight-bold" style="font-family: monospace; font-weight: light;">등록시간</p>
		</div>
	</div>

	<c:forEach var="board" items="${boards.content}">
		<%-- <c:if test="${board.secretType} }">
			<c:choose>
				<c:when test="${board.user.id eq principal.user.id || principal.user.role eq 'ADMIN'}">
				
				</c:when>
			</c:choose>
		</c:if> --%>
		<div class="row border-bottom">
			<ul class="list-group list-group-flush">
				<li class="list-group-item d-flex justify-content-between">
					<div class="col-lg">
						<p class="font-weight-light" style="color: gray; font-family: sans-serif; font-weight: lighter;">${board.id }</p>
					</div>
					<div class="col-lg">
						<a class="font-weight-light" href="/board/${board.id }" style="text-decoration: none; color: black; font-family: monospace;">${board.title}</a>
					</div>
					<div class="col-lg">
						<p class="font-weight-light" style="color: gray; font-family: sans-serif; font-weight: light;">${board.user.username }</p>
					</div>
					<div class="col-lg">
						<p class="font-weight-light" style="color: gray">
							<small>${board.createDate }</small>
						</p>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>



	<div class="m-5"></div>
	<ul class="pagination justify-content-center">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotDisabled" value=""></c:set>
		<li class="page-item ${boards.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${boards.number - 1 }">이전</a></li>
		<!-- 반복문 처리 하기-->
		<!-- 1 2 3, 1 2 3 4 , 1 2 3 4 5  -->
		<c:forEach var="num" items="${pageNumbers }">
			<c:choose>
				<c:when test="${nowPage eq num }">
					<!-- http://localhost:9090/board/search?q=%EC%95%84%EB%8B%88 -->
					<!-- 0 부터 시작 컨트롤러에서 +1 -->
					<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" style="color: black">${num }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<li class="page-item ${boards.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${boards.number + 1 }">다음</a></li>

	</ul>

</div>













<%@ include file="../layout/footer.jsp"%>




