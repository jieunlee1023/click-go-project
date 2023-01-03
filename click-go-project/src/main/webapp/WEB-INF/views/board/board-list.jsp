<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container" id="board--list">
	<br> <br>
	<div class=" d-flex" id="board--list--top">


		<!-- 글쓰기버튼 -->
		<div>
			<form class="form-inline" action="/board/board-write-form">
				<button type="submit" class="btn" id="btn--write">글쓰기</button>
			</form>
		</div>

		<!-- 검색 -->
		<div class="">
			<form action="/board/search" class="" method="get">
				<input type="text" class="" placeholder="검색어를 입력하세요." name="q"
					value="${q }" id="board--search--input">
				<button class="btn" id="board--search--btn" type="submit">검색</button>
			</form>
		</div>

	</div>


	<div id="board--list--main--title"
		class="border-top border-bottom pt-2 ">
		<div class="col-lg-title">
			<p>번호</p>
		</div>
		<div class="col-lg-title">
			<p>제목</p>
		</div>
		<div class="col-lg-title">
			<p>글쓴이</p>
		</div>
		<div class="col-lg-title">
			<p>등록시간</p>
		</div>
	</div>


	<c:forEach var="board" items="${boards.content}">
		<c:if test="${board.secretType eq 'PRIVATE'}">
			<c:choose>
				<c:when
					test="${board.user.id eq principal.user.id || principal.user.role eq 'ADMIN'}">
					<!-- 작성자이거나 관리자일 때 -->
					<!--  확인 가능하고 -->

					<div class="board--list--main--main border-bottom">
						<div class="col-lg-board-list-item">
							<p id="board--id">${board.id }</p>
						</div>
						<div class="col-lg-board-list-item">
							<a id="board--title" href="/board/${board.id }"> <img
								src="/image/secret.png" width="15px"> 비밀글입니다
							</a>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--user--name">${board.user.username }</p>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--date">${board.createDate }</p>
						</div>
					</div>

				</c:when>
				<c:otherwise>

					<!--  확인 불가능 -->

					<div class="board--list--main--main border-bottom">
						<div class="col-lg-board-list-item">
							<p id="board--id">${board.id }</p>
						</div>
						<div class="col-lg-board-list-item">
							<a id="board--title" onclick="alert('비밀글은 작성자만 확인 가능합니다.')">
								<img src="/image/secret.png" width="15px"> 비밀글입니다
							</a>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--user--name">${board.user.username }</p>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--date">${board.createDate }</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</c:if>

		<!-- 공개글 -->
		<c:if test="${board.secretType eq 'PUBLIC'}">

			<div class="board--list--main--main border-bottom">
				<div class="col-lg-board-list-item">
					<p id="board--id">${board.id }</p>
				</div>

				<div class="col-lg-board-list-item">
					<a id="board--title" href="/board/${board.id }">${board.title}</a>
				</div>
				<div class="col-lg-board-list-item">
					<p id="board--user--name">${board.user.username }</p>
				</div>
				<div class="col-lg-board-list-item">
					<p id="board--date">${board.createDate }</p>
				</div>
			</div>


		</c:if>



	</c:forEach>



	<div class="m-5"></div>
	<ul class="pagination justify-content-center"
		style="border-radius: 0px;">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotDisabled" value=""></c:set>
		<li class="page-item ${boards.first ? isDisabled : isNotDisabled } "><a
			class="page-link" href="?page=${boards.number - 1 }"
			id="page--previous">이전</a></li>
		<!-- 반복문 처리 하기-->
		<!-- 1 2 3, 1 2 3 4 , 1 2 3 4 5  -->
		<c:forEach var="num" items="${pageNumbers }">
			<c:choose>
				<c:when test="${nowPage eq num }">
					<!-- http://localhost:9090/board/search?q=%EC%95%84%EB%8B%88 -->
					<!-- 0 부터 시작 컨트롤러에서 +1 -->
					<li class="page-item"><a class="page-link"
						href="?q=${q }&page=${num - 1 }"
						id="page--select">${num }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						id="page--no--select"
						href="?q=${q }&page=${num - 1 }">${num }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<li class="page-item ${boards.last ? isDisabled : isNotDisabled }"><a
			class="page-link" href="?page=${boards.number + 1 }"
			id="page--next">다음</a></li>

	</ul>

</div>


<br>
<br>

<%@ include file="../layout/shortFooter.jsp"%>




