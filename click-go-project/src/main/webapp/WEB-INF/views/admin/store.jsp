<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<br>
<div class="container" id="">
	<div id="view-more-title">
		<div>
			🌞 가맹점 관리 <a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>
	</div>
	<hr>
</div>

<div class="container">

	<div class="input-group mb-3 justify-content-end">
		<form action="/admin/store-search" method="get" class="form-inline">
			<input type="text" class="form-control" placeholder="USER 검색하기"
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="search--franchise">검색</button>
			</div>
		</form>
	</div>


	<div class="d-flex flex-column" id="admin-store-section">
		<div class="table-responsive-sm">
			<table class="table" id="answer-list-table">
				<thead>
					<tr style="text-align: center;">
						<th>가맹점 ID</th>
						<th>이용자 ID</th>
						<th>가맹점명</th>
						<th>이용가격</th>
						<th>주소</th>
						<th>좌석수</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="store" items="${stores.content }">
						<tr style="text-align: center;">
							<td>${store.id }</td>
							<td>${store.user.id }</td>
							<td>${store.storeName }</td>
							<td>${store.price }</td>
							<td>${store.storeAddress }</td>
							<td>${store.storeTotalRoomCount }</td>
							<td >${store.storeTEL }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<br> <br>

	<div class="d-flex justify-content-center">
		<ul class="pagination" style="border-radius: 0px">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li class="page-item ${users.first ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${users.number - 1 }" id="page--previous">이전</a></li>

			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage eq num }">
						<li class="psge-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" id="page--select">${num } </a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item ${users.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${users.number + 1 }" id="page--next">다음</a></li>
		</ul>

	</div>

</div>

<br>
<br>
<br>
<br>






<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

