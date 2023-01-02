<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">

	<div class="d-flex justify-content-start mt-5">
		<button id="btn--back" class="btn " onclick="history.back();">←</button>
		<c:if test="${board.user.id == principal.user.id }">
			<a class="btn" id="btn--update--css"
				href="/board/${board.id }/update-form">수정</a>
			<button type="button" class="btn" id="btn--delete">삭제</button>
		</c:if>
	</div>

	<div class="d-flex justify-content-start">
		<div class="board--detail--top">
			<div>
				<input type="hidden" id="board-id" value="${board.id }"> 글
				번호 :<span> ${board.id } </span>
			</div>
			<div>
				글 작성자 : <span> ${board.user.username }</span>
			</div>
			<div class="d-flex justify-content-end">
				등록시간 : <span> ${board.createDate }</span>

			</div>
		</div>
	</div>
	<br>
	<div class="container" id="board--deatil--title">
		<h5>제목 : ${board.title }</h5>
	</div>

	<div class="container" id="board--deatil--content">
		<h5>${board.content }</h5>
	</div>

	<div class="d-flex justify-content-end"></div>
	<br> <br>

	<div class="board--detail--card">
		<div class="card-header">💬</div>

		<ul class="list-group" id="reply--box">
			<c:forEach var="reply" items="${board.csReply }">

				<li class="list-group-item" id="reply--${reply.id }">
					<div class="d-flex justify-content-between p-0">
						<p class="ml-3">
						↪
							<small id="small--item">&nbsp;${reply.user.username }&nbsp;
								(${reply.createDate })&nbsp; : ${reply.content }</small>
						</p>

						<div>
							<c:if test="${reply.user.id eq principal.user.id }">
								<button type="button" class="mr-4"  id="btn-reply-delete"
									onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">삭제</button>

							</c:if>
						</div>
					</div>
				</li>

			</c:forEach>

		</ul>
	</div>
	<div class="card" id="card--body">

		<div class="card-body d-flex justify-content-between">

			<input type="text" id="reply--content">
			<button type="button" class=""
				id="btn-reply-save">등록</button>

		</div>
	</div>


</div>

<br>
<br>
<script type="text/javascript" src="/js/board.js"></script>

<%@ include file="../layout/footer.jsp"%>



