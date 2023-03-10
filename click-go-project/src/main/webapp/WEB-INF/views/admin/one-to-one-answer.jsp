<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<br>
<div class="container mb-5" id="">
	<div id="view-more-title">
		<div>
			<c:choose>
				<c:when test="${principal.user.role eq 'ADMIN' }">
				π€ 1:1 λ¬Έμ λ΅λ³ <a id="btn--back" class="btn" href="/admin/one-to-one-list">λμκ°κΈ°</a>
				</c:when>
				<c:otherwise>
					<button class="btn" id="btn--back" onclick="history.back();">λμκ°κΈ°</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<hr>
</div>



<form action="/admin/one-to-one-answer" method="post">
	<input type="hidden" value="${askEntity.id}" name="askId" required="required"> <input type="hidden" value="${principal.user.id }"
		name="userId" required="required">
	<div class="container">
		<div class="card">
			<div class="container p-4 bg-light">
				<div class="d-flex flex-column">
					<p>No.${askEntity.id }</p> <p>${askEntity.user.username }</p>
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
						<span>μλλ κ³ κ°λμ΄ λ¬Έμνμ  λ΄μ©μλλ€.</span><br>
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
					<button type="submit" id="btn" class="btn">λ΅λ³νκΈ°</button>
				</div>
			</div>
		</c:if>
	</div>
	<br> <br> <br>




	<div class="container">
		<div class="card">
			<div class="container p-4 bg-light">
				<div class="d-flex flex-column">
					<p>λ¬Έμλ²νΈ : ${askEntity.id }</p>
					<p>λ¬Έμμ : ${askEntity.user.username }</p>
				</div>
				<hr>
				<div class="d-flex justify-content-center">
					<h5>${askEntity.title }&nbsp;μ λν λ΅λ³</h5>
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
						<span>μλνμΈμ ν΄λ¦­κ³  μ΄μμμλλ€</span><br> <br> <span>μλλ λ¬Έμνμ  λ΄μ©μ λ΅λ³μλλ€</span>
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
						<span>κΆκΈν μ¬ν­μ΄ μμΌμλ©΄ μΈμ λ μ§ λ¬Έμν΄μ£ΌμκΈΈ λ°λλλ€</span> <br> <br> <span>κ°μ¬ν©λλ€.</span>
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


