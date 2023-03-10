<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>


<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>π λ¦¬λ·° μμΈ</div>
	</div>
	<hr>
</div>


<div class="container">

	<div class="d-flex justify-content-between">
		<p>μμ±μ : ${review.user.username}λ</p>
		<p>
			λ³μ 
			<c:choose>
				<c:when test="${review.starScore eq '1' }">β­</c:when>
				<c:when test="${review.starScore eq '2' }">β­β­</c:when>
				<c:when test="${review.starScore eq '3' }">β­β­β­</c:when>
				<c:when test="${review.starScore eq '4' }">β­β­β­β­</c:when>
				<c:when test="${review.starScore eq '5' }">β­β­β­β­β­</c:when>
			</c:choose>
		</p>
	</div>
	<p>μμ±μΌ : ${review.createDate}</p>
	<div class="media border mt-3 p-3" style="width: 100%; height: 300px;">
		<p>λ΄μ© : ${review.content}</p>
	</div>

	<br>
	<c:choose>
		<c:when test="${empty reviewReply}">

			<div>βͺ π μ¬μ₯λμ λ΅λ³</div>
			<br>

			<c:choose>
				<c:when test="${role eq 'HOST'}">


					<div class="d-flex justify-content-between border-bottom">
						<input type="text" class="form-control"
							style="border: none;" autofocus
							id="reply" placeholder="μ¬μ₯λ ! μλμ΄ λ€μ  λ¦¬λ·°μ λκΈμ μμ±ν΄μ£ΌμΈμ !"> 
							<input
							type="hidden" id="id" value="${review.id}">
						<button type="button" id="btn--save-review-reply"
							style="border: none; background-color: rgb(0, 0, 0, 0.2); width: 100px;">μμ±
							μλ£</button>
					</div>
				</c:when>
				<c:otherwise>
					<ul class="list-group" id="reply--box">
						<li class="list-group-item d-flex justify-content-between">
							<div>μ¬μ₯λ λ΅λ³μ κΈ°λ€λ¦¬λ μ€μ΄μμ!</div>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>

		</c:when>
		<c:otherwise>
			<div>βͺ π μ¬μ₯λμ λ΅λ³ (κ°λ§Ήμ λͺ : ${reviewReply.review.store.storeName})</div>
			<ul class="list-group" id="reply--box">
				<li class="list-group-item d-flex justify-content-between ml-5">
					<div>Β· ${reviewReply.content}</div>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
<script type="text/javascript" src="/js/review.js"></script>
<br><br><br><br><br>
<%@ include file="../../../layout/footer.jsp"%>