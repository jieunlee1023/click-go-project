<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>


<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>📂 리뷰 상세</div>
	</div>
	<hr>
</div>


<div class="container">

	<div class="d-flex justify-content-between">
		<p>작성자 : ${review.user.username}님</p>
		<p>
			별점
			<c:choose>
				<c:when test="${review.starScore eq '1' }">⭐</c:when>
				<c:when test="${review.starScore eq '2' }">⭐⭐</c:when>
				<c:when test="${review.starScore eq '3' }">⭐⭐⭐</c:when>
				<c:when test="${review.starScore eq '4' }">⭐⭐⭐⭐</c:when>
				<c:when test="${review.starScore eq '5' }">⭐⭐⭐⭐⭐</c:when>
			</c:choose>
		</p>
	</div>
	<p>작성일 : ${review.createDate}</p>
	<div class="media border mt-3 p-3" style="width: 100%; height: 300px;">
		<p>내용 : ${review.content}</p>
	</div>

	<br>
	<c:choose>
		<c:when test="${empty reviewReply}">

			<div>↪ 💖 사장님의 답변</div>
			<br>

			<c:choose>
				<c:when test="${role eq 'HOST'}">


					<div class="d-flex justify-content-between border-bottom">
						<input type="text" class="form-control"
							style="border: none;" autofocus
							id="reply" placeholder="사장님 ! 손님이 다신 리뷰의 댓글을 작성해주세요 !"> 
							<input
							type="hidden" id="id" value="${review.id}">
						<button type="button" id="btn--save-review-reply"
							style="border: none; background-color: rgb(0, 0, 0, 0.2); width: 100px;">작성
							완료</button>
					</div>
				</c:when>
				<c:otherwise>
					<ul class="list-group" id="reply--box">
						<li class="list-group-item d-flex justify-content-between">
							<div>사장님 답변을 기다리는 중이에요!</div>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>

		</c:when>
		<c:otherwise>
			<div>↪ 💖 사장님의 답변 (가맹점명 : ${reviewReply.review.store.storeName})</div>
			<ul class="list-group" id="reply--box">
				<li class="list-group-item d-flex justify-content-between ml-5">
					<div>· ${reviewReply.content}</div>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
<script type="text/javascript" src="/js/review.js"></script>
<%@ include file="../../../layout/footer.jsp"%>