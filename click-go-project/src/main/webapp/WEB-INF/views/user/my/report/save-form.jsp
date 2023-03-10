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
		<div>π μ κ³ νκΈ°</div>
	</div>
	<hr>
	<h5>νμλμ μ κ³ κ° λ³΄λ€ μμ§μ μλΉμ€λ₯Ό λ§λ­λλ€.</h5>


	<c:choose>
		<c:when test="${role eq 'HOST'}">
			<br>
			<div class="form-group-board">
				<label for="username">κ°λ§Ήμ λͺ</label> 
				<input type="text" name="username"
					id="username" class="form-control" value="${store.storeName}"
					readonly="readonly">
			</div>
			<div class="form-group-board">
				<label for="username">μ κ³ ν  λμ</label> 
				<input type="text" name="username"
					id="username" class="form-control" value="${user.username}"
					readonly="readonly">
			</div>
			<div class="form-group-board">
				<label for="content">μ λͺ©</label> <input type="text" name="title"
					id="title" class="form-control">
			</div>

			<div class="form-group-board">
				<label for="content">λ΄μ©</label>
				<textarea name="content" id="content" rows="5"
					class="form-control content">
			</textarea>
			</div>
		</c:when>
		<c:otherwise>
			<div class="form-group-board">
				<label for="username">μμ±μ</label> <input type="text" name="username"
					id="username" class="form-control" value="${user.username}"
					readonly="readonly">
			</div>
			<br>
			<div class="form-group-board">
				<label for="content">μ λͺ©</label> <input type="text" name="title"
					id="title" class="form-control">
			</div>

			<div class="form-group-board">
				<label for="content">λ΄μ©</label>
				<textarea name="content" id="content" rows="5"
					class="form-control content">
			</textarea>
			</div>
		</c:otherwise>
	</c:choose>

	<div class="d-flex justify-content-end mt-3 ">
		<button type="button" class="btn" id="btn--save">μ κ³ νκΈ°</button>
	</div>
</div>

<script>
	$('.content').summernote({
		placeholder : 'λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ',
		tabsize : 2,
		height : 400,
	});
</script>

<br>
<br>
<br>
<script type="text/javascript" src="/js/report.js"></script>
<%@ include file="../../../layout/shortFooter.jsp"%>
