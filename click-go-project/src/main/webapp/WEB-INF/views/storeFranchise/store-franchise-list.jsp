<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container " id="franchise--list">

	<div id="view-more-title">
		<div>🏤 가맹점 목록</div>
	</div>

	<div class="input-group mb-3 justify-content-end">
		<form action="/storeFranchise/store-franchise-list/search"
			class="form-inline" method="get">
			<input type="text" class="form-control" placeholder="가게명을 입력해주세요."
				name="q" value="${q }">
			<div class="input-group-append ml-2">
				<button type="submit" class="btn" id="search--franchise">검색</button>
			</div>
		</form>
	</div>


	<c:choose>
		<c:when test="${storeSearch == 0}">
			<div class="d-flex justify-content-center">
				<div id="franchise--none">
					<div>검색하신 "${q }" 와/과</div>
					<div>관련된 가맹점이 존재하지 않습니다.</div>
					<div>확인 후 다시 검색해주세요!</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="d-flex" style="flex-wrap: wrap;">
				<c:forEach var="store" items="${storeList.content}">


					<div class="franchise--main">
						<div id="franchise--main--img">
							<img alt="가맹점 가게 사진" src="${image}"
								style="width: 300px; height: 300px;">
						</div>

						<div class="franchise--main--text">
							<input id="franchise--main--text--val"
								value="[ 대표 ] ${store.user.username} "><br> <input
								id="franchise--main--text--val"
								value="[ 카테고리 ] ${store.category} "><br> <input
								id="franchise--main--text--val"
								value="[ 가맹점명 ] ${store.storeName} "><br> <input
								id="franchise--main--text--val"
								value="[ 가맹점번호 ] ${store.storeTEL} "><br> <input
								id="franchise--main--text--val"
								value="[ 가맹점주소 ] ${store.storeAddress} "><br>
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
						id="page--previous">이전</a></li>
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
						id="page--next">다음</a></li>

				</ul>

			</div>


		</c:otherwise>

	</c:choose>



</div>

<br>
<br>
<br>
<%@ include file="../layout/footer.jsp"%>



