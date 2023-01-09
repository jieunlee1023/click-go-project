<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container">
	<div id="answer-header">
		<h1>답변할리스트</h1>
	</div>
	<br>
	<br>
	<br>
	<br>

	<div id="answer-body">
		<div class="d-flex flex-column">

			<table class="table" id="answer-list-table">
				<thead>
					<tr>
						<th>문의접수번호</th>
						<th>유저닉네임</th>
						<th>제목</th>
						<th>문의내용</th>
						<th>문의한아이디의고유번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="askList" items="${askList }">
						<tr>
							<td>${askList.id }</td>
							<td>${askList.user.username }</td>
							<td><a href="/admin/one-to-one-answer/${askList.id}">${askList.title }</a></td>
							<td>${askList.content }</td>
							<td>${askList.user.id }</td>
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

