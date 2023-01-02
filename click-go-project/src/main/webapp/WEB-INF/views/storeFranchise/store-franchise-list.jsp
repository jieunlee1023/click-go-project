<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container ">
	<div class="d-flex justify-content-center">
		<h1>가맹점 리스트</h1>
	</div>

	<div class="input-group mb-3 justify-content-center">
		<form action="/storeFranchise/store-franchise-list/search" class="form-inline" method="get">
			<input type="text" class="form-control" placeholder="검색" name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn bg-secondary">가게명으로검색</button>
			</div>
		</form>
	</div>



	<c:forEach var="store" items="${storeList.content}">
		<div class="d-flex justify-content-center mb-1">
			<div class="card " style="width: 500px">

				<div class="card-body ">
					<span>대표: </span> <span>${store.user.username}</span><br> <br> <span>카테고리 : </span> <span>${store.category}</span><br> <span>가게명
						: </span> <span>${store.storeName}</span><br> <span>가게번호 : </span> <span>${store.storeTEL}</span><br> <span>가게주소 : </span> <span>${store.storeAddress}</span><br>

					<span>이미지 : </span> <span>${store.image}</span><br>


				</div>
			</div>

			<br>
		</div>

	</c:forEach>

	<div class="d-flex justify-content-center">
		<ul class="pagination">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li class="page-item ${storeList.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${storeList.number - 1 }">이전</a></li>
			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage eq num }">
						<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" style="color: black">${num }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${storeList.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${storeList.number + 1 }">다음</a></li>

		</ul>

	</div>


</div>

<%@ include file="../layout/footer.jsp"%>



