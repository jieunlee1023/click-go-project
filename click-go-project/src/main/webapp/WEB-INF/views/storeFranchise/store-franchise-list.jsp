<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container ">
	<div class="d-flex justify-content-center">
		<h1>가맹점 리스트</h1>
	</div>

	<div class="input-group mb-3 justify-content-center">
		<form action="/board/search" class="form-inline" method="get">
			<input type="text" class="form-control" placeholder="검색" name="q"
				value="${q }">
			<div class="input-group-append ml-2">
				<button type="button" class="btn bg-secondary">검색</button>
			</div>
		</form>
	</div>



	<c:forEach var="store" items="${storeList}">
		<div class="d-flex justify-content-center mb-1">
			<div class="card " style="width: 500px">
			
				<div class="card-body ">
					<span>대표: </span> 
					<span>${store.user.username}</span><br>
					<br>
			
					<span>카테고리 : </span> 
					<span>${store.category}</span><br>
					<span>가게명 : </span> 
					<span>${store.storeName}</span><br>
					<span>가게번호 : </span> 
					<span>${store.storeTEL}</span><br>
					<span>가게주소 : </span> 
					<span>${store.storeAddress}</span><br>

					<span>이미지 : </span> 
					<span>${store.image}</span><br>
				
		
				</div>
			</div>

			<br>
		</div>

	</c:forEach>
</div>

<%@ include file="../layout/footer.jsp"%>