<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>
			๐จโ๐ป ํ์ ๊ด๋ฆฌ <a id="btn--back" class="btn" href="./main">๋์๊ฐ๊ธฐ</a>
		</div>
	</div>
	์ ๊ณ ํ์๊ฐ 3์ผ ๊ฒฝ์ฐ user์๊ฒ ๊ฒฝ๊ณ ์ฐฝ์ ์ ์กํ  ์ ์์ต๋๋ค. <br> ์ ๊ณ ํ์๊ฐ 5์ผ ๊ฒฝ์ฐ ํด๋น user๋ฅผ ํํด์ํฌ
	์ ์์ต๋๋ค.
</div>

<div class="container">
	<div class="input-group mb-3 justify-content-end">
		<form action="/admin/user-search" method="get" class="form-inline">
			<input type="text" class="form-control" placeholder="USER ๊ฒ์ํ๊ธฐ"
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="search--franchise">๊ฒ์</button>
			</div>
		</form>
	</div>


	<div class="">
		<table class="table" id="answer-list-table">
			<thead>
				<tr style="text-align: center;">
					<th>๊ณ ์ ๋ฒํธ</th>
					<th>role</th>
					<th>Id</th>
					<th>์ ํ๋ฒํธ</th>
					<th>e-mail</th>
					<th>์ ๊ณ ํ์</th>
					<th>ํฌ์ธํธ</th>
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
									onclick="admin.minus(${user.id});">โ</button>
								<span id="user--reportCount-${user.id }">
									${user.reportCount }</span>
								<button type="button" class="admin-user-report-btn"
									id="admin-user-report-btn-plus"
									onclick="admin.plus(${user.id});">โ</button>
								<c:if test="${user.reportCount  == 3 && user.cautionStatus == false}">
									<br>
									<a href="#" style="color: red;"
										onclick="admin.caution(${user.id});">๊ฒฝ๊ณ  ์ฃผ๊ธฐ</a>
								</c:if>
								<c:if
									test="${user.reportCount  >= 5}">
									<br>
									<c:if test="${user.role != 'BLACKLIST'}">
										<a href="#" style="color: red;"
											onclick="admin.blacklist(${user.id});">์ ์ง์ํค๊ธฐ</a>
									</c:if>
									<c:if test="${user.role == 'BLACKLIST'}">
										<a href="#" style="color: red;"
											onclick="admin.cancelBlacklist(${user.id});">์ ์งํ๊ธฐ</a>
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
					id="page--previous">์ด์ </a></li>

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
					class="page-link" href="?page=${users.number + 1 }" id="page--next">๋ค์</a></li>
			</ul>

		</div>
		<script src="/js/admin.js"></script>
	</div>
	<br>
</div>

<script src="/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>