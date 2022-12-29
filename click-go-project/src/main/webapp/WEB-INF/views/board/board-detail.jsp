<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">


	<button class="btn bg-secondary" onclick="history.back();">돌아가기</button>
	<c:if test="${board.user.id == principal.user.id }">
		<a class="btn bg-secondary" id="" href="/board/${board.id }/update-form">수정하기</a>
		<button type="button" class="btn bg-secondary" id="btn--delete">삭제하기</button>
	</c:if>

	<div>
		<input type="hidden" id="board-id" value="${board.id }"> 글 번호 : <span> <i>${board.id }</i>
		</span>
	</div>
	<div>
		글 작성자 : <span>${board.user.username }</span>
	</div>

	<span>제목 : </span>
	<div class="container p-3 my-3 border">
		<h3>${board.title }</h3>
	</div>


	<span>내용 : </span>
	<div class="container p-3 my-3 border">${board.content }</div>

	<br> <br> <br> <br>
	<div class="card">
		<div class="card-body">
			<textarea rows="1" cols="form-control" id="reply--content"></textarea>
		</div>

		<div class="card-footer">
			<button type="button" class="btn bg-secondary" id="btn-reply-save">등록</button>
		</div>
	</div>
	<br>
	<div class="card">
		<div class="card-header">댓글목록 :</div>

		<ul class="list-group" id="reply--box">
			<c:forEach var="reply" items="${board.csReply }">
				<li class="list-group-item d-flex justify-content-between" id="reply--${reply.id }">
					<div>${reply.content }</div>
					<div class="d-flex">
						<div>작성자 : &nbsp;${reply.user.username }&nbsp;&nbsp;&nbsp;</div>

						<c:if test="${reply.user.id eq principal.user.id }">
							<button type="button" class="btn btn-danger badge" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">삭제</button>
						</c:if>
					</div>

				</li>
			</c:forEach>

		</ul>
	</div>


</div>



















<script type="text/javascript" src="/js/board.js"></script>

<%@ include file="../layout/footer.jsp"%>



