<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container">
	<h1>매장 관리</h1>
	<h5>이용자들이 보는 가게의 화면을 꾸며보세요 !</h5>
</div>
<br>
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;
<div class="d-flex-column justify-content-center">
	<c:choose>
		<c:when test="${empty stores}">
			<br>
			<br>
			<br>
			<br>
			<div class="container d-flex">
				<h2 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h2>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="store" items="${stores}">
				<%@ include file="../../../common/store.jsp" %>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<br>
<%@ include file="../../../layout/footer.jsp"%>