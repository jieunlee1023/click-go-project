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
	<input type="hidden" id="userId" value="${user.id}"> <input
		type="hidden" id="storeId" value="${store.id}">


	<div id="view-more-title">
		<div>📛 신고하기</div>
	</div>
	<hr>
	<h5>회원님의 신고가 보다 양질의 서비스를 만듭니다.</h5>


	<c:choose>
		<c:when test="${role eq 'HOST'}">
			<br>
			<div class="form-group-board">
				<label for="username">가맹점명</label> 
				<input type="text" name="username"
					id="username" class="form-control" value="${store.storeName}"
					readonly="readonly">
			</div>
			<div class="form-group-board">
				<label for="username">신고할 대상</label> 
				<input type="text" name="username"
					id="username" class="form-control" value="${store.user.username}"
					readonly="readonly">
			</div>
			<div class="form-group-board">
				<label for="content">제목</label> <input type="text" name="title"
					id="title" class="form-control">
			</div>

			<div class="form-group-board">
				<label for="content">내용</label>
				<textarea name="content" id="content" rows="5"
					class="form-control content">
			</textarea>
			</div>
		</c:when>
		<c:otherwise>
			<div class="form-group-board">
				<label for="username">작성자</label> <input type="text" name="username"
					id="username" class="form-control" value="${user.username}"
					readonly="readonly">
			</div>
			<br>
			<div class="form-group-board">
				<label for="content">제목</label> <input type="text" name="title"
					id="title" class="form-control">
			</div>

			<div class="form-group-board">
				<label for="content">내용</label>
				<textarea name="content" id="content" rows="5"
					class="form-control content">
			</textarea>
			</div>
		</c:otherwise>
	</c:choose>

	<div class="d-flex justify-content-end mt-3 ">
		<button type="button" class="btn" id="btn--save">신고하기</button>
	</div>
</div>

<script>
	$('.content').summernote({
		placeholder : '내용을 입력해주세요',
		tabsize : 2,
		height : 400,
	});
</script>

<br>
<br>
<br>
<script type="text/javascript" src="/js/report.js"></script>
<%@ include file="../../../layout/shortFooter.jsp"%>
