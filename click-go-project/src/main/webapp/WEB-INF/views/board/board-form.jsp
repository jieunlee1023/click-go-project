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

<!--  -->
<div class="container">

	<!-- <form action="/api/board" method="post"> -->
	
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div class="form-group">
			<label for="title">TITLE</label> 
			<input type="text" name="title" id="title" class="form-control">
		</div>

		<div class="form-group">
			<label for="content">CONTENT</label>
			<textarea class="content" name="content" id="content" rows="5" class="form-control content"></textarea>
		</div>
		
		<div class="d-flex justify-content-between">
			<div>

				<span>비밀글Check > </span><input type="checkbox" checked>
			</div>
			<div>
			</div>
				<button type="button" id="btn--save" class="btn btn-primary">ENTER</button>
		</div>
	<!-- </form> -->




</div>





<script>
	$('.content').summernote({
		placeholder : 'insert',
		tabsize : 2,
		height : 300
	});
</script>



<script type="text/javascript" src="/js/board.js"></script>

<%@ include file="../layout/footer.jsp"%>






