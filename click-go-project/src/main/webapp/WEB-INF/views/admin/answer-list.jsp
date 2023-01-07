<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container">
	<div id="answer-header" style="background-color: orange">
		<h1>답변할리스트</h1>
		<div class="d-flex flex-row">
			<div></div>

		</div>


	</div>

	<div id="answer-body" style="background-color: pink">
		<div class="d-flex flex-column">
			<c:forEach var="ooo" items="${ooos }">
				<div>
					<h1>user아이디: ${ooo.user.id }</h1>
					<h1>ooo아이디: ${ooo.id }</h1>
					<a href="/admin/one-on-one-answer/${ooo.id}">유저아이디: ${principal.user.username } 제목이: ${ooo.title }</a>
					<h1>문의제목: a태그해야함 ${ooo.title }</h1>
					<h1>문의내용: ${ooo.content }</h1>
				</div>
			</c:forEach>
			이거하는중 0105
		</div>
		<div class="d-flex justify-content-center"></div>
	</div>

</div>




















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

