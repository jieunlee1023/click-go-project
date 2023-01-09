<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container mb-5">
	<div id="answer-header">
		<h1>1:1&nbsp;문의글&nbsp;목록</h1>

		<div class="d-flex justify-content-end">
			<a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>
		<!-- 검색 -->
	</div>
	<br> <br>

	<div class="d-flex justify-content-end m-5">
		<form action="/admin/one-to-one-search" class="" method="get">
			<input type="text" class="" placeholder="검색어를 입력하세요." name="q" value="${q }" id="board--search--input">
			<button class="btn" id="board--search--btn" type="submit">검색</button>
		</form>
	</div>
	<div id="answer-body">
		<div class="d-flex flex-column">

			<table class="table" id="answer-list-table">
				<thead>
					<tr>
						<th>문의접수번호</th>
						<th>답변여부</th>
						<th>제목</th>
						<th>유저닉네임</th>
						<th>문의시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="asklist" items="${askPage.content }">
						<tr>
							<td>${asklist.id }</td>
							<td>답변여부</td>
							<td><a href="/admin/one-to-one-answer/${asklist.id}">${asklist.title }</a></td>
							<td>${asklist.user.username }</td>
							<td>${asklist.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="d-flex justify-content-center"></div>
	</div>



	<div class="m-5">
		<ul class="pagination justify-content-center" style="border-radius: 0px;">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li class="page-item ${askPage.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${askPage.number - 1 }"
				id="page--previous">이전</a></li>
			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage eq num }">
						<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" id="page--select">${num }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${askPage.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${askPage.number + 1 }" id="page--next">다음</a></li>

		</ul>
	</div>












</div>




















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

