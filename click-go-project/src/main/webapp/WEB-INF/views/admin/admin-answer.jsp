<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container">
	<div id="answer-header" style="background-color: orange">
		<h1>여긴헤드더</h1>
	</div>
	
	<div id="answer-body" style="background-color: pink">
		<h1>여긴바디더</h1>
		<c:forEach var="ooo" items="">
		<div class="d-flex justify-content-center">
			<p>zz</p>
		</div>
		</c:forEach>
	</div>

</div>




















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

