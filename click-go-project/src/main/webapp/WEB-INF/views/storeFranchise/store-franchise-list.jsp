<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container " id="franchise--list">

	<div id="view-more-title">
		<div>๐ค ๊ฐ๋งน์  ๋ชฉ๋ก</div>
	</div>
<hr>
	<div class="input-group mb-3 justify-content-end">
		<form action="/storeFranchise/store-franchise-list/search"
			class="form-inline" method="get">
			<input type="text" class="form-control" placeholder="๊ฐ๊ฒ๋ช์ ์๋ ฅํด์ฃผ์ธ์."
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="search--franchise">๊ฒ์</button>
			</div>
		</form>
	</div>


	<c:choose>
		<c:when test="${storeSearch == 0}">
			<div class="d-flex justify-content-center">
				<div id="franchise--none">
					<div>๊ฒ์ํ์  "${q }" ์/๊ณผ</div>
					<div>๊ด๋ จ๋ ๊ฐ๋งน์ ์ด ์กด์ฌํ์ง ์์ต๋๋ค.</div>
					<div>ํ์ธ ํ ๋ค์ ๊ฒ์ํด์ฃผ์ธ์!</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="d-flex" style="flex-wrap: wrap;">
				<c:forEach var="store" items="${storeList.content}">


					<div class="franchise--main">
						<div id="franchise--main--img">
						<c:forEach
						var="image" items="${images }" varStatus="status">
						<c:if test="${store.id eq  image.store.id}">
							<img 
								src="http://localhost:7777/storeImage/${image.imageUrl}"
								style="width: 100%;  border-radius: 10px;"
								>
						</c:if>
					</c:forEach>
						</div>

						<div class="franchise--main--text">
							<input id="franchise--main--text--val"
								value="[ ๋ํ ] ${store.user.username} "><br> <input
								id="franchise--main--text--val"
								value="[ ์นดํ๊ณ ๋ฆฌ ] ${store.category.id} "><br> <input
								id="franchise--main--text--val"
								value="[ ๊ฐ๋งน์ ๋ช ] ${store.storeName} "><br> <input
								id="franchise--main--text--val"
								value="[ ๊ฐ๋งน์ ๋ฒํธ ] ${store.storeTEL} "><br> <input
								id="franchise--main--text--val"
								value="[ ๊ฐ๋งน์ ์ฃผ์ ] ${store.storeAddress} "><br>
						</div>
					</div>
					<br>


				</c:forEach>
			</div>
			<br>
			<br>
			<br>
			<div class="d-flex justify-content-center">
				<ul class="pagination">
					<c:set var="isDisabled" value="disabled"></c:set>
					<c:set var="isNotDisabled" value=""></c:set>
					<li
						class="page-item ${storeList.first ? isDisabled : isNotDisabled } "><a
						class="page-link" href="?page=${storeList.number - 1 }"
						id="page--previous">์ด์ </a></li>
					<c:forEach var="num" items="${pageNumbers }">
						<c:choose>
							<c:when test="${nowPage eq num }">
								<li class="page-item"><a class="page-link"
									href="?q=${q }&page=${num - 1 }" id="page--select">${num }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<li
						class="page-item ${storeList.last ? isDisabled : isNotDisabled }"><a
						class="page-link" href="?page=${storeList.number + 1 }"
						id="page--next">๋ค์</a></li>

				</ul>

			</div>


		</c:otherwise>

	</c:choose>



</div>

<br>
<br>
<br>
<%@ include file="../layout/footer.jsp"%>



