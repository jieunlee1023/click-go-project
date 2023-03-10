<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<br>
<br>

<div class="container">
	<form action="/board/save" method="POST">
		<input type="hidden" id="id" value="${principal.user.id }"
			required="required">

		<div class="form-group-board">
			<label for="username">작성자</label> <input type="text" name="username"
				id="username" class="form-control"
				value="${principal.user.username }" readonly="readonly">
		</div>
		<br>
		<div class="form-group-board">
			<label for="content">제목</label> <input type="text" name="title"
				id="title" class="form-control" value="${board.title }"
				required="required">
		</div>

		<div class="form-group-board">
			<label for="content">내용</label>
			<textarea name="content" id="content" rows="5"
				class="form-control content" required="required">
				${board.content }
			</textarea>
		</div>

		<div class="d-flex justify-content-between mb-5 ">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" name="secret"
					id="secret"> <label class="form-check-label">비밀글 설정</label>
			</div>
			<button type="submit" class="btn board--save mt-3" id="btn--write"
				>글 작성</button>
		</div>
	</form>
</div>

<script>
	$('.content').summernote({
		placeholder : '내용을 입력해주세요',
		tabsize : 2,
		height : 300,
	});
	

	function boardWrite() {
		Swal.fire({
			icon : 'success',
			text : '게시글 작성에 성공하셨습니다.',
		}).then(function() {
			location.href = "/board/list";
		});
	}
</script>

<script type="text/javascript" src="/js/board.js"></script>
<br>
<br>
<br>
<%@ include file="../layout/shortFooter.jsp"%>



