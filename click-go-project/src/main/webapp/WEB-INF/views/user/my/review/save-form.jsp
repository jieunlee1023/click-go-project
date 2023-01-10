<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<br>
<br>

<div class="container">
	<input type="hidden" id="storeId" value="${store.id}">

	<div id="view-more-title">
		<div>📝 리뷰 작성하기</div>
	</div>
	<hr>
	<h5>회원님의 리뷰가 보다 양질의 서비스를 만듭니다.</h5>
	<br>

		<form action="/review/save/${store.id}" 
		class="mb-3" name="myform" id="myform" method="post">
	<div class="form-group-board">
		<label for="username">작성자</label> <input type="text" name="username"
			id="username" class="form-control" value="${principal.user.username}"
			readonly="readonly">
	</div>
	<br>

	<div class="form-group-board">
		<label for="content">제목</label> <input type="text" name="title"
			id="title" class="form-control">
	</div>
	
		<div class="form-group-board">

			<span class=" text-bold ">별점 : </span>
			<br>
			<fieldset>
				<input type="radio" name="starScore" value="5" id="rate1"><label
					for="rate1" id="starLabel">★</label>
				<input type="radio" name="starScore" value="4" id="rate2"><label
					for="rate2" id="starLabel">★</label>
				<input type="radio" name="starScore" value="3" id="rate3"><label
					for="rate3" id="starLabel">★</label>
				<input type="radio" name="starScore" value="2" id="rate4"><label
					for="rate4" id="starLabel">★</label>
				<input type="radio" name="starScore" value="1" id="rate5"><label
					for="rate5" id="starLabel">★</label>
			</fieldset>
				<div>
				<textarea class="col-auto form-control" type="text" id="reviewContents"  
								name="content" 
						  		placeholder="리뷰 작성 시 포인트 100p 지급!!"></textarea>
				</div>
									
		</div>

	<div class="d-flex justify-content-end mt-3 ">
		<button type="submit" class="btn" id="btn--save">등록하기</button>
	</div>
		</form>
</div>
<br>
<br>
<br>
<script type="text/javascript" src="/js/review.js"></script>
<%@ include file="../../../layout/shortFooter.jsp"%>
