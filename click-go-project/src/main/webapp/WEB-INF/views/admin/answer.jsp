<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container">
	<div id="answer-header" style="background-color: orange">
		<h1>여긴헤드더</h1>
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
					<h1>제목이: ${ooo.title }</h1>
					<h1>컨텐트: ${ooo.content }</h1>
				</div>
			</c:forEach>
		
		</div>
		<div class="d-flex justify-content-center"></div>
	</div>

</div>




















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

