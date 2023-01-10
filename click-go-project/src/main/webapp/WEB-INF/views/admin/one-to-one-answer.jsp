<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<br>
<div class="container mb-5" id="">
	<div id="view-more-title">
		<div>
			<c:choose>
				<c:when test="${principal.user.role eq 'ADMIN' }">
				👤 1:1 문의 답변 <a id="btn--back" class="btn" href="/admin/one-to-one-list">돌아가기</a>
				</c:when>
				<c:otherwise>
					<button class="btn" id="btn--back" onclick="history.back();">돌아가기</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<hr>
</div>



<form action="/admin/one-to-one-answer" method="post">
	<input type="hidden" value="${askEntity.id}" name="askId" required="required"> <input type="hidden" value="${principal.user.id }" name="userId" required="required">
	<div class="container">
		<div class="card">
			<div class="card-header bg-light text-dark">
				<div class="d-flex flex-column">
					<span>No.${askEntity.id }</span> <span>${askEntity.user.username }</span>
					<hr>
					<div>
						<h5 class="d-flex justify-content-center">&nbsp;${askEntity.title }</h5>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-2 border-right">
						<div class="d-flex justify-content-center">
							<img alt="" src="/image/q.png" style="width: 30%;">
						</div>
					</div>
					<div class="col-9 pl-3">
						<span>아래는 고객님이 문의하신 내용입니다.</span><br>
						<hr>
						<div class="card img-fluid " style="width: 100%; border: none;">
							<div class="d-flex justify-content-center">
								<img class="card-img-top" src="/image/logo.png" alt="Card image" style="width: 50%; opacity: 0.1;">
							</div>
							<div class="card-img-overlay">${askEntity.content }</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<br> <br> <br>
	<div class="container">
		<c:if test="${principal.user.role eq 'ADMIN' }">
			<div class="d-flex flex-column border">
				<textarea name="content" rows="5" cols="10" required="required"></textarea>
				<div class="d-flex justify-content-center">
					<button type="submit" id="btn" class="btn">답변하기</button>
				</div>
			</div>
		</c:if>
	</div>
	<br> <br> <br>




	<div class="container">
		<div class="card">
			<div class="card-header bg-light text-dark">
				<div class="d-flex flex-column">
					<span>문의번호 : ${askEntity.id }</span> <span>문의자 : ${askEntity.user.username }</span>
					<hr>
					<div>
						<h5 class="d-flex justify-content-center">${askEntity.title }&nbsp;의대한답변</h5>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-2 border-right">
						<div class="d-flex justify-content-center">
							<img alt="" src="/image/favicon.png" style="width: 30%;">
						</div>
					</div>
					<div class="col-9 pl-3">
						<span>안녕하세요 클릭고 운영자입니다</span><br> <br> <span>아래는 문의하신 내용의 답변입니다</span>
						<hr>
						<div class="card img-fluid " style="width: 100%; border: none;">
							<div class="d-flex justify-content-center">
								<img class="card-img-top" src="/image/logo.png" alt="Card image" style="width: 50%; opacity: 0.1;">
							</div>
							<div class="card-img-overlay">
								<c:forEach var="answerlist" items="${answerList }">
									<c:if test="${askEntity.id eq answerlist.oneToOneAsk.id }">
										<span>${answerlist.content }</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<hr>
						<span>궁금한 사항이 있으시면 언제든지 문의해주시길 바랍니다</span> <br> <br> <span>감사합니다.</span>
					</div>

				</div>
			</div>
		</div>
	</div>
</form>








<br>
<br>
<br>





<%@ include file="../layout/footer.jsp"%>


