<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>🌟 매장 관리</div>
	</div>
	<span style="color: #6478ff">: 이용자들이 보는 가게의 화면을 꾸며보세요 !</span>
	<hr>
	<br>
</div>

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
				<%@ include file="../../../common/store.jsp"%>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<br>
<%@ include file="../../../layout/footer.jsp"%>