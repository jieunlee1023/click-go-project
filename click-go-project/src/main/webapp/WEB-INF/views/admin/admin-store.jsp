<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>




<div class="container" id="admin-store">

	<div class="d-flex justify-content-center" id="admin-header" style="background-color: orange">
		<h1>이와하라가가니</h1>
	</div>
	<div class="d-flex justify-content-end">
		<form action="/admin/store-search" method="get">
			<input type="text" placeholder="검색할거야?ㅎ" name="q" value="${q }" id="">
			<button class="btn" type="submit">검색하기</button>
		</form>
	</div>

	<div class="d-flex flex-column" id="admin-store-section" style="background-color: pink">
		<div class="d-flex justify-content-between" id="list-header">
			<div>
				<p>id</p>
			</div>
			<div>
				<p>userid</p>
			</div>
			<div>
				<p>storename</p>
			</div>
			<div>
				<p>price</p>
			</div>
			<div>
				<p>storeaddress</p>
			</div>
			<div>
				<p>storeTotalRoomCount</p>
			</div>
			<div>
				<p>tel</p>
			</div>
		</div>

		<div class="d-flex flex-column" id="admin-list" style="background-color: white">
			<c:forEach var="store" items="${stores.content }">
				<div class="d-flex justify-content-between" id="list-body-heart">
					<div>
						<p>${store.id }</p>
					</div>
					<div>
						<p>${store.user.id }</p>
					</div>
					<div>
						<p>${store.storeName }</p>
					</div>
					<div>
						<p>${store.price }</p>
					</div>
					<div>
						<p>${store.storeAddress }</p>
					</div>
					<div>
						<p>${store.storeTotalRoomCount }</p>
					</div>
					<div>
						<p>${store.storeTEL }</p>
					</div>
				</div>
			</c:forEach>
		</div>

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






















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

