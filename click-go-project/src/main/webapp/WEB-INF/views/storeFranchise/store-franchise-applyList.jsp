<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex justify-content-between">
		<h1>가맹점 신청 내역</h1>
	</div>

	<br><br>
	<div class="d-flex justify-content-between">
		<p>번호</p>
		<p>제목</p>
		<p>등록일</p>
	</div>
	<c:forEach var="board" items="${boards.content}">
		<div class="d-flex justify-content-between">
			<div class="d-flex justify-content-between">
				<ul class="list-group list-group-flush ">
					<li class="list-group-item d-flex justify-content-start">
						<p class="text-danger">
							<small>${board.id }</small>
						</p> <a href="/board/${board.id }" class="col"><small>${board.title}</small> </a>
						<p class="text-danger">
							<small>${board.user.username }</small>
						</p>
						<p>
							<small>${board.createDate }</small>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</c:forEach>


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
					<li class="page-item active"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<li class="page-item ${boards.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${boards.number + 1 }">다음</a></li>
	</ul>


</div>

<script type="text/javascript" src="/js/storeFranchise.js"></script>
<%@ include file="../layout/footer.jsp"%>