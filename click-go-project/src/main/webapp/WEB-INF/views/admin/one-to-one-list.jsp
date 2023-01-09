<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container">
	<div id="answer-header">
		<h1>1:1&nbsp;문의글&nbsp;목록</h1>
	</div>
	<div class="d-flex justify-content-end">
		<a id="btn--back" class="btn" href="./main">돌아가기</a>
	</div>
	<br> <br> <br> <br>
	<div id="answer-body">
		<div class="d-flex flex-column">

			<table class="table" id="answer-list-table">
				<thead>
					<tr>
						<th>문의접수번호</th>
						<th>답변여부</th>
						<th>제목</th>
						<th>유저닉네임</th>
						<th>문의시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="askList" items="${askList }">
						<tr>
							<td>${askList.id }</td>
							<td>답변여부</td>
							<td><a href="/admin/one-to-one-answer/${askList.id}">${askList.title }</a></td>
							<td>${askList.user.username }</td>
							<td>${askList.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="d-flex justify-content-center"></div>
	</div>

</div>




















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

