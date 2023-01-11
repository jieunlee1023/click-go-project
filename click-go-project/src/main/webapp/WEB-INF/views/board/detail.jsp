<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">

	<div class="d-flex justify-content-end mt-5">
		<a id="btn--back" class="btn" href="/board/list">뒤로가기</a>
		<c:if test="${board.user.id == principal.user.id }">
			<a class="btn" id="btn--update--css" href="/board/${board.id }/update-form">수정</a>
			<button type="button" class="btn" id="btn--delete">삭제</button>
		</c:if>
	</div>

	<div class="d-flex justify-content-start">
		<div class="board--detail--top">
			<div>
				<input type="hidden" id="board-id" value="${board.id }">글 번호&nbsp;:&nbsp;<span> ${board.id }</span>
			</div>
			<div>
				<span>글 작성자&nbsp;:&nbsp;${board.user.username }</span>
			</div>
			<div class="d-flex justify-content-start">
				<span>등록시간&nbsp;:&nbsp;${board.createDate }</span>
			</div>
		</div>
	</div>
	<br>
	<div class="container" id="board--deatil--title">
		<h3>${board.title }</h3>
	</div>

	<div class="container" id="board--deatil--content">
		<h5>${board.content }</h5>
	</div>

	<div class="d-flex justify-content-end"></div>
	<br> <br>
	<form action="/board/${board.id }/reply" method="post">
		<div class="board--detail--card">
			<div class="card-header">🗨️</div>

			<ul class="list-group" id="reply--box">


				<c:forEach var="reply" items="${board.csReply }">
					<c:if test="${reply.secret == true }">
						<c:choose>
							<c:when test="${reply.user.id eq principal.user.id || principal.user.role eq 'ADMIN' }">

								<li class="list-group-item" id="reply--${reply.id }">
									<div class="d-flex justify-content-between ml-3 border-bottom" id="reply-row">
										<div class="reply-nick">
											<span>&nbsp; ↪&nbsp;${reply.user.username } </span>
										</div>
										<div class="col ml-5">
											<p>&nbsp;${reply.content }</p>
										</div>
										<div class="d-flex justify-content-end mr-3">
											<span>&nbsp;${reply.createDate }</span>
										</div>
										<div class="d-flex justify-content-end mr-3">
											<div>
												<button type="button" class="mr-4" id="btn-reply-delete" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">✖</button>
											</div>
										</div>
									</div>
								</li>
							</c:when>

							<c:otherwise>
								<div class="d-flex flex-start ml-2 border-bottom" id="reply-row">
									<span>&nbsp; ↪ &nbsp;<img src="/image/secret.png" width="15px">&nbsp;비밀댓글 입니다.
									</span>

								</div>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:if test="${reply.secret == false }">
						<li class="list-group-item" id="reply--${reply.id }">
							<div class="d-flex justify-content-between ml-3 border-bottom" id="reply-row">
								<div class="reply-nick">
									<span> ↪&nbsp;&nbsp;${reply.user.username } </span>
								</div>
								<div class="col ml-5">
									<p>&nbsp;${reply.content }</p>
								</div>
								<div class="d-flex justify-content-end mr-3">
									<span>&nbsp;${reply.createDate }</span>
								</div>
								<div class="d-flex justify-content-end mr-3">
									<div>
										<c:if test="${reply.user.id eq principal.user.id }">
											<button type="button" class="mr-4" id="btn-reply-delete" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">✖</button>
										</c:if>
									</div>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class="card" id="card--body">
			<div class="card-body d-flex justify-content-center">
				<label>✏️</label> <input type="text" id="reply--content" name="content" required="required">
				<div class="d-flex ">
					<div class="form-check form-check-inline ml-3 ">
						<label class="form-check-label">🔒</label> <input class="form-check-input" type="checkbox" name="secret" id="secret">
					</div>
					<button type="submit" class="btn" id="btn-reply-save">댓글 작성</button>
				</div>
			</div>

		</div>
	</form>
</div>
<br>
<br>
<script type="text/javascript" src="/js/board.js"></script>
<br>
<br>


<%@ include file="../layout/footer.jsp"%>

