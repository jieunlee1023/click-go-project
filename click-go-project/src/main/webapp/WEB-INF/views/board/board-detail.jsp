<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">

	<div class="d-flex justify-content-end mb-3">
		<button class="btn bg-secondary" onclick="history.back();">돌아가기</button>
	</div>

	<div class="d-flex justify-content-end border-top">
		<div class="mt-4">
			<div>
				<input type="hidden" id="board-id" value="${board.id }"> 글 번호 : <span style="color: gray"> <i>${board.id }</i>
				</span>
			</div>
			<div>
				글 작성자 : <span style="color: gray"><small>${board.user.username }</small></span>
			</div>
			<div class="d-flex justify-content-end">
				<p class="font-weight-light mr-2" style="color: black">등록시간 :</p>
				<br>
				<p class="font-weight-light" style="color: gray">
					<small>${board.createDate }</small>
				</p>
			</div>
		</div>
	</div>

	<div class="container p-3 my-3 border-top border-bottom">
		<h1>
			<small>${board.title }</small>
		</h1>
	</div>

	<div class="container p-5  border-bottom">${board.content }</div>

	<div class="d-flex justify-content-end m-5">
		<c:if test="${board.user.id == principal.user.id }">
			<a class="btn bg-secondary" id="" href="/board/${board.id }/update-form">수정</a>
			<div class="ml-3"></div>
			<button type="button" class="btn bg-secondary" id="btn--delete">삭제</button>
		</c:if>
	</div>


	<br>
	<div class="card">
		<div class="card-header">💬</div>

		<ul class="list-group" id="reply--box">

			<c:forEach var="reply" items="${board.csReply }">

				<li class="list-group-item" id="reply--${reply.id }">
					<div class="d-flex justify-content-between">
						<div class="border-bottom pb-2">
							<p style="color: gray">
								<small>&nbsp;${reply.user.username }&nbsp;&nbsp;&nbsp; (${reply.createDate }) </small>
							</p>
						</div>


						<div>
							<c:if test="${reply.user.id eq principal.user.id }">
								<button type="button" class="btn btn-danger badge" onclick="boardIndex.replyDelete(${board.id}, ${reply.id });">삭제</button>
							</c:if>
						</div>
					</div>

					<div class="border-bottom p-3">${reply.content }</div>



				</li>

			</c:forEach>

		</ul>
	</div>
	<div class="card">

		<div class="card-body">
			💬
			<textarea class="form-control" rows="5" id="reply--content" name="text"></textarea>
			<!-- <textarea rows="1" cols="form-control" id="reply--content"></textarea> -->
		</div>
	</div>
	<div class="card-footer">
		<button type="button" class="btn bg-secondary" id="btn-reply-save">등록</button>
	</div>


</div>



















<script type="text/javascript" src="/js/board.js"></script>

<%@ include file="../layout/footer.jsp"%>



