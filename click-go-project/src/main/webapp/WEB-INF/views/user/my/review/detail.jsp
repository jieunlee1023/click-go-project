<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<div class="container d-flex-column justify-content-end">

	<div class="media border mt-3"
		style="width: 1000px; height: 350px; border-radius: 15px;">
		<div class="media-body">
			<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
				<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
					<p class="mr-3 m-1">${review.user.username}님</p>
					<p class="mr-3 m-1">별점 : ${review.starScore}</p>
				</div>
				<p class="mr-3 m-1">${review.createDate}</p>
				<p class="mr-3 m-1">${review.content}</p>
			</div>
		</div>
	</div>
	<br>
	<div class="card">
		<c:choose>
			<c:when test="${empty reviewReply}">
				<div class="card-header">사장님의 답변</div>

				<c:choose>
					<c:when test="${role eq 'HOST'}">
					<div class="d-flex justify-content-between">
							<input type="text" class="form-control" style="border: none;" id="reply"
								value="사장님 ! 손님이 다신 리뷰의 댓글을 작성해주세요 !">
								<input type="hidden" id="id" value="${review.id}">
						<button type="button" id="btn--save-review-reply"  
					style="border: none; background-color: white; width: 150px">작성 완료</button>
					</div>
					</c:when>
					<c:otherwise>
						<ul class="list-group" id="reply--box">
							<li class="list-group-item d-flex justify-content-between">
								<div>사장님이 바쁘신가봐요 ㅠㅠ</div>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>

			</c:when>
			<c:otherwise>
				<div class="card-header">사장님의 답변</div>
				<ul class="list-group" id="reply--box">
					<li class="list-group-item d-flex justify-content-between">
						<div>${reviewReply.content}</div>
						<div class="d-flex">
							<div>작성자 :
								&nbsp;${reviewReply.review.store.storeName}&nbsp;&nbsp;&nbsp;</div>
						</div>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script type="text/javascript" src="/js/review.js"></script>
<%@ include file="../../../layout/footer.jsp"%>