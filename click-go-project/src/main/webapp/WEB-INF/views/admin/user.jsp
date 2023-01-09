<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex justify-content-end">
		<a id="btn--back" class="btn" href="./main">돌아가기</a>
	</div>
	<br> <br> <br>

	<div class="d-flex justify-content-start">
		<h1>회원조회</h1>
	</div>

	<div class="d-flex justify-content-end">
		<form action="/admin/user-search" method="get">
			<input type="text" placeholder="유저검색" name="q" value="${q }" id="">
			<button class="btn btn-light" id="btn" type="submit">검색하기</button>
		</form>
	</div>

	<br> <br> <br>

	<div id="answer-body">
		<div class="d-flex flex-column">

			<table class="table" id="answer-list-table">
				<thead>
					<tr>
						<th>고유번호</th>
						<th>유저네임</th>
						<th>전화번호</th>
						<th>e-mail</th>
						<th>가입날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users.content }">
						<tr>
							<td><p>${user.id }</p></td>
							<td><p class="" style="width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${user.username }</p></td>
							<td><p>${user.phoneNumber }</p></td>
							<td><p>${user.email }</p></td>
							<td>${user.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="d-flex justify-content-center"></div>
	</div>




	<br> <br>

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



<br>
<br>
<br>
<br>






<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>


