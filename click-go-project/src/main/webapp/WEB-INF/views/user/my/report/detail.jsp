<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>

<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>⛔ 신고 관리</div>
	</div>
	<hr>
</div>


<div class="container">
	<div class="media border mt-3" style="width: 100%; height: 50px;">
		<div id="report-detail-title">제목 : ${report.title}</div>
	</div>
	<div class="media border mt-3" style="width: 100%; height: 300px;">
		<div class="mr-3 m-1">${report.content}</div>
	</div>
	<br>
	<div class="card">
		<div class="card-header">📌</div>
		<c:forEach var="reportReply" items="${reportReplys }">
			<c:if test="${report.id eq reportReply.report.id }">

				<div class="d-flex justify-content-between ml-3 mr-3 mb-1 mt-1">
					<div>↪ 답변 : ${reportReply.content}</div>
					<div>작성자 : 관리자</div>
				</div>

			</c:if>
		</c:forEach>

		<c:if test="${principal.user.role eq 'ADMIN' }">
			<form action="/report/reply/save" method="post">
				<input type="hidden" value="${report.id }" name="reportId">
				<div class="d-flex justify-content-between border-top">
					<input class="m-2" id="admin--input" type="text"
						placeholder="답변을 남겨주세요." name="content">
					<button type="submit" id="admin--report--btn">발송하기</button>
				</div>
			</form>

		</c:if>
	</div>
	<c:if test="${principal.user.role eq 'ADMIN' }">
		<div class="d-flex justify-content-end">
			<a href="/admin/user" style="text-decoration: none; color: red;">신고 설정하기</a>
		</div>
	</c:if>
</div>
<br>
<br>
<br>
<%@ include file="../../../layout/footer.jsp"%>