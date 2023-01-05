<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">

	<br> <br> <br>

	<div class="d-flex justify-content-start">
		<h1>회원조회</h1>
	</div>

	<div class="d-flex justify-content-end">
		<form action="/admin/user-search" method="get">
			<input type="text" placeholder="검색할거야?ㅎ" name="q" value="${q }" id="">
			<button class="btn" type="submit">검색하기</button>
		</form>
	</div>

	<br> <br> <br>
	<div></div>
	<div class="d-flex flex-column" style="">
		<div class="row border-bottom p-2">
			<div class="col-sm-3">고유번호</div>
			<div class="col-sm-3">Id</div>
			<div class="col-sm-3">전화번호</div>
			<div class="col-sm-3">e-mail</div>
		</div>

		<div class="d-flex flex-column">
			<c:forEach var="user" items="${users.content }">
				<div class="border-bottom  p-2">
					<div class="row">
						<div class="col-sm-3">
							<p>${user.id }</p>
						</div>
						<div class="col-sm-3">
							<p class="" style="width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${user.username }</p>
						</div>
						<div class="col-sm-3">
							<p>${user.phoneNumber }</p>
						</div>
						<div class="col-sm-3">
							<p>${user.email }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<br>
		<br>

		<div class="d-flex justify-content-center">
			<ul class="pagination" style="border-radius: 0px">
				<c:set var="isDisabled" value="disabled"></c:set>
				<c:set var="isNotDisabled" value=""></c:set>
				<li class="page-item ${users.first ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${users.number - 1 }"
					style="color: white; background-color: #6478ff; border: none;">이전</a></li>

				<c:forEach var="num" items="${pageNumbers }">
					<c:choose>
						<c:when test="${nowPage eq num }">
							<li class="psge-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" style="color: white; background-color: #6478ff; border: none">${num }
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" style="color: #96bbff; background-color: #6478ff; border: none;"
								href="?q=${q }&page=${num - 1 }">${num }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item ${users.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${users.number + 1 }"
					style="color: white; background-color: #6478ff; border: none;">다음</a></li>
			</ul>

		</div>

	</div>

</div>













<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>


