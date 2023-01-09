<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<div class="container d-flex-column justify-content-end">

	<div class="media border mt-3"
		style="width: 1000px; height: 70px; border-radius: 15px;">
		<div class="media-body">
			<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
				<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
					<h3 class="" style="font-weight: bold;">${report.title}</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="media border mt-3"
		style="width: 1000px; height: 350px; border-radius: 15px;">
		<div class="media-body">
			<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
				<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
					<p class="mr-3 m-1">${report.content}</p>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="card">
		<c:choose>
			<c:when test="${empty reportReply}">
				<div class="card-header">관리자의 답변</div>
				<ul class="list-group" id="reply--box">
					<li class="list-group-item d-flex justify-content-between">
						<div>빠른 시일 내로 답변 드리겠습니다. 감사합니다.</div>
						<div class="d-flex">
							<div>작성자 :
								&nbsp;관리자&nbsp;&nbsp;&nbsp;</div>
						</div>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<div class="card-header">관리자의 답변</div>
				<ul class="list-group" id="reply--box">
					<li class="list-group-item d-flex justify-content-between">
						<div>${reportReply.content}</div>
						<div class="d-flex">
							<div>작성자 :
								&nbsp;${reportReply.user.username}&nbsp;&nbsp;&nbsp;</div>
						</div>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<%@ include file="../../../layout/footer.jsp"%>