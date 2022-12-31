<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<div class="d-flex justify-content-center">

	<div>
		<div class="main_link d-flex ">
			<h4 class="m-5"><a href="/store/main" >전체 보기</a></h4>
				<c:forEach var="category" items="${categories}">
					<h4 class="m-5"><a href="/store/main?pageName=${category}" >${category}</a></h4>
				</c:forEach>
		</div>
	<a href="#" class="d-flex justify-content-end mr-4">지도로 보기</a>
<br>
<br>
		<div class="d-flex-column"> 
				<c:forEach var="store" items="${stores.content}">
					<%@ include file="../common/store.jsp"%>
				</c:forEach>
		</div>  
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
