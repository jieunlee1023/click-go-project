<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<br>
<div class="container" id="">
	<div id="view-more-title">
		<div>
			👥 1:1 문의 <a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>
	</div>
	<hr>
</div>


<div class="container">
	
		<div class="input-group mb-3 justify-content-end">
		<form action="/admin/one-to-one-search" method="get" class="form-inline">
			<input type="text" class="form-control" placeholder="검색어를 입력하세요."
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="board--search--btn">검색</button>
			</div>
		</form>
	</div>
	

	<div id="answer-body">
		<div class="d-flex flex-column">

			<table class="table" id="answer-list-table">
				<thead>
					<tr style="text-align: center;">
						<th>문의접수번호</th>
						<th>답변여부</th>
						<th>제목</th>
						<th>유저닉네임</th>
						<th>문의시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="asklist" items="${askPage.content }">
						<tr style="text-align: center;">
							<td>${asklist.id }</td>
							<td><c:choose>
									<c:when test="${asklist.answer eq '0'}">답변 대기</c:when>
									<c:otherwise>답변 완료</c:otherwise>
								</c:choose></td>
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
<br>
<br>


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

