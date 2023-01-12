<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>
			👨‍💻 회원 관리 <a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>
	</div>
	신고횟수가 3일 경우 user에게 경고창을 전송할 수 있습니다. <br> 신고횟수가 5일 경우 해당 user를 탈퇴시킬
	수 있습니다.
</div>

<div class="container">
	<div class="input-group mb-3 justify-content-end">
		<form action="/admin/user-search" method="get" class="form-inline">
			<input type="text" class="form-control" placeholder="USER 검색하기"
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="search--franchise">검색</button>
			</div>
		</form>
	</div>


	<div class="">
		<table class="table" id="answer-list-table">
			<thead>
				<tr style="text-align: center;">
					<th>고유번호</th>
					<th>role</th>
					<th>Id</th>
					<th>전화번호</th>
					<th>e-mail</th>
					<th>신고횟수</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users.content }">
					<tr style="text-align: center;">
						<td><p id="user--id-${user.id}">${user.id }</p></td>
						<c:choose>
							<c:when test="${user.role eq 'HOST' }">
								<td style="color: red;"><p>${user.role }</p></td>
							</c:when>
							<c:when test="${user.role eq 'GEUST' }">
								<td style="color: blue;"><p>${user.role }</p></td>
							</c:when>
							<c:otherwise>
								<td style="color: black;"><p>${user.role }</p></td>
							</c:otherwise>
						</c:choose>

						<td><p class=""
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${user.username }</p></td>
						<td><p>${user.phoneNumber }</p></td>
						<td><p>${user.email }</p></td>
						<td style="color: orange;"><c:if
								test="${user.role  != 'ADMIN'}">
								<button type="button" class="admin-user-report-btn"
									id="admin-user-report-btn-minus"
									onclick="admin.minus(${user.id});">➖</button>
								<span id="user--reportCount-${user.id }">
									${user.reportCount }</span>
								<button type="button" class="admin-user-report-btn"
									id="admin-user-report-btn-plus"
									onclick="admin.plus(${user.id});">➕</button>
								<c:if test="${user.reportCount  == 3 && user.cautionStatus == false}">
									<br>
									<a href="#" style="color: red;"
										onclick="admin.caution(${user.id});">경고 주기</a>
								</c:if>
								<c:if
									test="${user.reportCount  >= 5}">
									<br>
									<c:if test="${user.role != 'BLACKLIST'}">
										<a href="#" style="color: red;"
											onclick="admin.blacklist(${user.id});">정지시키기</a>
									</c:if>
									<c:if test="${user.role == 'BLACKLIST'}">
										<a href="#" style="color: red;"
											onclick="admin.cancelBlacklist(${user.id});">정지풀기</a>
									</c:if>
								</c:if>
							</c:if></td>
						<td>${user.point }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br> <br> <br> <br>
		<!--  1== true -->
		<!--  0== false-->
		<div class="d-flex justify-content-center">
			<ul class="pagination" style="border-radius: 0px">
				<c:set var="isDisabled" value="disabled"></c:set>
				<c:set var="isNotDisabled" value=""></c:set>
				<li class="page-item ${users.first ? isDisabled : isNotDisabled }"><a
					class="page-link" href="?page=${users.number - 1 }"
					id="page--previous">이전</a></li>

				<c:forEach var="num" items="${pageNumbers }">
					<c:choose>
						<c:when test="${nowPage eq num }">
							<li class="psge-item"><a class="page-link"
								href="?q=${q }&page=${num - 1 }" id="page--select">${num } </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item ${users.last ? isDisabled : isNotDisabled }"><a
					class="page-link" href="?page=${users.number + 1 }" id="page--next">다음</a></li>
			</ul>

		</div>
		<script src="/js/admin.js"></script>
	</div>
	<br>
</div>

<script src="/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>