<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<div class="container">
	<form action="">
		<input type="hidden" id="id" value="${principal.user.id }">

		<div class="form-group">
			<label for="title" id="board-id" data-id="${board.id }">글 번호 : ${board.id }</label>
		</div>

		<div class="form-group">
			<label for="username">유저id번호 </label> <input type="text" name="username" id="username" class="form-control" value="${principal.user.id }"
				readonly="readonly">
		</div>

		<div class="form-group">
			<label for="content">제목</label> <input type="text" name="title" id="title" class="form-control" value="${board.title }">
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea name="content" id="content" rows="5" class="form-control content">
				${board.content }
			</textarea>

		</div>
	</form>
	<button type="button" id="btn--update" class="btn btn-primary">글 수정하기</button>
</div>

<script>
	$('.content').summernote({
		placeholder : '내용을 입력해주세요',
		tabsize : 2,
		height : 300
	});
</script>

<script type="text/javascript" src="/js/board.js">
	
</script>



<%@ include file="../layout/footer.jsp"%>






