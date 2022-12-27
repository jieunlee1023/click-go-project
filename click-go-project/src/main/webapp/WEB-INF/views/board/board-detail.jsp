<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">

	
	<button class="btn bg-secondary" onclick="history.back();">돌아가기</button>
	<c:if test="${board.user.id == principal.user.id }">
		<a class="btn bg-secondary" id="" href="/home/board/${board.id }/update_form">수정하기</a>
		<button class="btn bg-secondary" id="btn--delete">삭제하기</button>
	</c:if>
	
	<div>
		<input type="hidden" id="board-id" value="${board.id }">
		글 번호 : <span>
					<i>${board.id }</i>
					</span>
	</div>
	<div>
		글 작성자 : <span>${board.user.username }</span>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
</div>





















<%@ include file="../layout/footer.jsp"%>



