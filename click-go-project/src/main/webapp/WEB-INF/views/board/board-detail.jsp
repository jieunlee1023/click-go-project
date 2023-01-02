<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">

	<div class="d-flex justify-content-start mt-5">
		<button id="btn--back" class="btn " onclick="history.back();">←</button>
		<c:if test="${board.user.id == principal.user.id }">
			<a class="btn" id="btn--update--css" href="/board/${board.id }/update-form">수정</a>
			<button type="button" class="btn" id="btn--delete">삭제</button>
		</c:if>
	</div>

	<div class="d-flex justify-content-start">
		<div class="board--detail--top">
			<div>
				<input type="hidden" id="board-id" value="${board.id }"> 글 번호 :<span> ${board.id } </span>
			</div>
			<div>
				글 작성자 : <span> ${board.user.username }</span>
			</div>
			<div class="d-flex justify-content-start">
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
	<form action="/board/${board.id }/reply" method="post">
		<div class="board--detail--card">
			<div class="card-header">💬</div>

			<ul class="list-group" id="reply--box">
				<%-- <c:forEach var="reply" items="${board.csReply }">
				
				<li class="list-group-item" id="reply--${reply.id }">
					<div class="d-flex justify-content-between p-0">
						<p class="ml-3">
							↪ <small id="small--item">&nbsp;${reply.user.username }&nbsp; (${reply.createDate })&nbsp; : ${reply.content }</small>
						</p>

						<div>
							<c:if test="${reply.user.id eq principal.user.id }">
								<button type="button" class="mr-4" id="btn-reply-delete" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">삭제</button>

							</c:if>
						</div>
					</div>
				</li>

			</c:forEach> --%>

				<c:forEach var="reply" items="${board.csReply }">
					<c:if test="${reply.secret == true }">
						<c:choose>
							<c:when test="${reply.user.id eq principal.user.id || principal.user.role eq 'ADMIN' }">

								<li class="list-group-item" id="reply--${reply.id }">
									<div class="d-flex justify-content-between p-0">
										<p class="ml-3">
											↪ <small id="small--item">&nbsp;${reply.user.username }&nbsp; (${reply.createDate })&nbsp; : ${reply.content }</small>
										</p>

										<div>
											<button type="button" class="mr-4" id="btn-reply-delete" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">삭제</button>
										</div>
									</div>
								</li>
							</c:when>

							<c:otherwise>
								<p class="ml-3">
									↪ <small id="small--item"><img src="/image/secret.png" width="15px">비밀댓글입니다</small>
								</p>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:if test="${reply.secret == false }">
						<li class="list-group-item" id="reply--${reply.id }">
							<div class="d-flex justify-content-between p-0">
								<p class="ml-3">
									↪ <small id="small--item">&nbsp;${reply.user.username }&nbsp; (${reply.createDate })&nbsp; : ${reply.content }</small>
								</p>

								<div>
									<c:if test="${reply.user.id eq principal.user.id }">
										<button type="button" class="mr-4" id="btn-reply-delete" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">삭제</button>

									</c:if>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class="card" id="card--body">


			<div class="card-body d-flex justify-content-between">

				<input type="text" id="reply--content" name="content">
				<button type="submit" class="" id="">등록</button>

				<div class="form-check form-check-inline mt-3">
					<input class="form-check-input" type="checkbox" name="secret" id="secret"> 
					<label class="form-check-label"></label>
				</div>
			</div>


		</div>


	</form>
</div>
<br>
<br>
<script type="text/javascript" src="/js/board.js"></script>

<%@ include file="../layout/footer.jsp"%>

