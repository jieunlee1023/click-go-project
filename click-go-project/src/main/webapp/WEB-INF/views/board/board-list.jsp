<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<div class="container">
	<div class="d-flex justify-content-between">
		<h1>클릭꼬 고객센터</h1>
		<form class="form-inline" action="/board/board-form">
			<button type="submit" class="btn btn-outline-info" id="btn--write">글쓰기</button>
		</form>
	</div>

	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="검색할래?" name=""
			value="">
		<div class="input-group-append">
			<span class="input-group-text">검색할래?</span>
		</div>
	</div>


	<div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">First item</li>
			<li class="list-group-item">Second item</li>
			<li class="list-group-item">Third item</li>
			<li class="list-group-item">Fourth item</li>
		</ul>
	</div>

	<%-- <ul class="pagination justify-content-center">
		<c:set></c:set>
	
	
	</ul> --%>






</div>
















<%@ include file="../layout/footer.jsp"%>




