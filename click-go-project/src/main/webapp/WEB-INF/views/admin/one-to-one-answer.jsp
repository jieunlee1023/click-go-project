<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<div class="container">
	<div id="answer-header">
		<h1>문의 답변 페이지</h1>
	</div>
	<br> <br> <br> <br>

	<form action="/admin/one-to-one-answer" method="post">
		<input type="hidden" value="${askEntity.id}" name="askId"> <input type="hidden" value="${principal.user.id }" name="userId">
		<div class="d-flex media border p-5">
			<img src="/image/admin/bul2.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width: 80px;">
			<div class="media-body p-2">
				<div class="border-bottom m-2" id="answer-box">
					<h3>${askEntity.title }</h3>
				</div>
				<div class="m-4 border-bottom" id="answer-box">
					<h4>${askEntity.content }</h4>
				</div>

				<br> <br>

				<div class="media p-3">
					<img src="/image/admin/bul4.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width: 60px;">
					<div class="media-body p-2">
						<div class="border-bottom">
							<h3>문의하신 내용의 답변입니다</h3>
						</div>
						<c:forEach var="answerlist" items="${answerList }">
							<c:if test="${askEntity.id eq answerlist.oneToOneAsk.id }">
								<div class="m-4 border-bottom" id="answer-box">
									<h3>${answerlist.content }</h3>
								</div>
							</c:if>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<c:if test="${principal.user.role eq 'ADMIN' }">
			<div class="d-flex flex-column border">
				<textarea name="content" rows="5" cols="10"></textarea>
				<div>
					<button type="submit">답변하기</button>
				</div>
			</div>
		</c:if>
	</form>


	<br> <br> <br> <br>
	<%-- <div>
		<p>문의하신 제목 :</p>
		<p>제목>>>${askEntity.title }</p>
	</div>

	<div>
		<p>문의하신 내용 :</p>
		<p>내용 >>> ${askEntity.content }</p>
	</div>
	<div>
		<form action="/admin/one-to-one-answer" method="post">
			<input type="hidden" value="${askEntity.id}" name="askId"> <input type="hidden" value="${principal.user.id }" name="userId">
			<c:if test="${principal.user.role eq 'ADMIN' }">
				<textarea name="content" rows="1" cols="6">
			</textarea>
				<button type="submit">삥뽕</button>
			</c:if>


			<c:forEach var="answerlist" items="${answerList }">
				<c:if test="${askEntity.id eq answerlist.oneToOneAsk.id }">
					<div>답변 : : : : ${answerlist.content }</div>

				</c:if>
			</c:forEach>
		</form>

	</div> --%>




</div>














<%@ include file="../layout/footer.jsp"%>