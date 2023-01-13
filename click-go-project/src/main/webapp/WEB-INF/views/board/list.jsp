<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container" id="board--list">
	<br> <br>
	<div class=" d-flex" id="board--list--top">


		<!-- 글쓰기버튼 -->
		<div>
			<form class="form-inline" action="/board/write-form" method="get">
				<button type="submit" class="btn" id="btn--write">글쓰기</button>
			</form>
		</div>

		<!-- 검색 -->
		<div class="">
			<form action="/board/search" class="" method="get">
				<input type="text" class="" placeholder="검색어를 입력하세요." name="q" value="${q }" id="board--search--input">
				<button class="btn" id="board--search--btn" type="submit">검색</button>
			</form>
		</div>

	</div>


	<div id="board--list--main--title" class="border-top border-bottom pt-2 ">
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
			<p>조회수</p>
		</div>
		<div class="col-lg-title">
			<p>등록시간</p>
		</div>
	</div>


	<c:forEach var="board" items="${boards.content}">
		<c:if test="${board.secretType eq 'PRIVATE'}">
			<c:choose>
				<c:when test="${board.user.id eq principal.user.id || principal.user.role eq 'ADMIN'}">
					<!-- 작성자이거나 관리자일 때 -->
					<!--  확인 가능하고 -->

					<div class="board--list--main--main border-bottom">
						<div class="col-lg-board-list-item">
							<p id="board--id">${board.id }</p>
						</div>
						<div class="col-lg-board-list-item">
							<a id="board--title" href="/board/${board.id }"> <img src="/image/secret.png" width="15px"> ${board.title} (${board.csReply.size()}) 

							</a>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--user--name">${board.user.username }</p>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--user--name">${board.count }</p>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--date">
								<fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd" />
								&nbsp;&nbsp;(<span id="time-ago-${board.id}"></span>
							</p>
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
							<a class="board--title--secret" id="board--title"> <img src="/image/secret.png" width="15px"> 비밀글입니다
							</a>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--user--name">${board.user.username }</p>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--user--name">${board.count }</p>
						</div>
						<div class="col-lg-board-list-item">
							<p id="board--date">
								<fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd" />
								&nbsp;&nbsp;(<span id="time-ago-${board.id}"></span>
							</p>
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
					<a id="board--title" href="/board/${board.id }">${board.title} (${board.csReply.size()}) </a>
				</div>
				<div class="col-lg-board-list-item">
					<p id="board--user--name">${board.user.username }</p>
				</div>
				<div class="col-lg-board-list-item">
					<p id="board--user--name">${board.count }</p>
				</div>
				<div class="col-lg-board-list-item ">
					<p id="board--date">
						<fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd" />
						&nbsp;&nbsp;(<span id="time-ago-${board.id}"></span>
					</p>

				</div>
			</div>
		</c:if>
		<script type="text/javascript">
			//언제 등록했는지 시간 확인
			var boardId = "${board.id}";
			var postTime = new Date("${board.createDate}");
			var currentTime = new Date();
			var diff = currentTime - postTime;
			var diffInSeconds = diff / 1000;
			var diffInMinutes = diffInSeconds / 60;
			var diffInHours = diffInMinutes / 60;
			var diffInDays = diffInHours / 24;

			if (diffInSeconds < 60) {
				document.getElementById("time-ago-" + boardId).innerHTML = "방금전)";
			} else if (diffInMinutes < 60) {
				document.getElementById("time-ago-" + boardId).innerHTML = Math
						.round(diffInMinutes)
						+ "분전)";
			} else if (diffInHours < 24) {
				document.getElementById("time-ago-" + boardId).innerHTML = Math
						.round(diffInHours)
						+ "시간전)";
			} else if (diffInDays < 1) {
				document.getElementById("time-ago-" + boardId).innerHTML = Math
						.round(diffInDays)
						+ "일 전)";
			}
		</script>
	</c:forEach>

	<div class="m-5">
		<ul class="pagination justify-content-center" style="border-radius: 0px;">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li class="page-item ${boards.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${boards.number - 1 }"
				id="page--previous">이전</a></li>

			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage eq num }">
						<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }" id="page--select">${num }</a></li>

					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" id="page--no--select" href="?q=${q }&page=${num -1 }">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item ${boards.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${boards.number + 1 }" id="page--next">다음</a></li>
		</ul>
	</div>
</div>


<br>
<br>

<script type="text/javascript">
	$().ready(function() {
		$(".board--title--secret").click(function() {
			Swal.fire({
				icon : 'warning',
				text : '비밀글은 작성자만 확인 가능합니다.',
			});
		});
	});
</script>


<%@ include file="../layout/shortFooter.jsp"%>



