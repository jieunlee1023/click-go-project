<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<div class="container">
	<form action="" >
		<input type="hidden" id="id" value="${principal.user.id }">

		<div class="form-group-board" id="board--update--id">
			<label for="title" id="board-id" data-id="${board.id }">※ 글 번호 : ${board.id }</label>
		</div>

		<div class="form-group-board">
			<label for="username"> 작성자 </label> <input type="text" name="username" id="username" class="form-control" value="${principal.user.username }"
				readonly="readonly">
		</div>


		<div class="form-group-board">
			<label for="content">제목</label> <input type="text" name="title" id="title" class="form-control" value="${board.title }">
		</div>

		<div class="form-group-board">
			<label for="content">내용</label>
			<textarea name="content" id="content" rows="5" class="form-control content">
				${board.content }
			</textarea>

		</div>


		<div class="d-flex justify-content-end mb-5 ">
			<!-- <div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" name="secret" id="secret"> <label class="form-check-label">비밀글 설정 추후업뎃</label>
			</div> -->
			<button type="button" id="btn--update" class="btn board--save mt-3">수정하기</button>
		</div>
	</form>
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






