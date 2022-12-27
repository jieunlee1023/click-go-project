<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<br>
<div class="container d-flex justify-content-center"
	style="width: 500px">
	<div class="container">
		<c:if test="${empty principal.user.loginType }">
			<input type="hidden" value="${principal.user.username}" id="username">
			<input type="hidden" value="${principal.user.id}" id="id">
			<form>
				<div class="form-group">
					<label for="email" class="d-flex m-0" style="font-size: 13px">새
						비밀번호</label> <input type="email" class="form-control" id="new--pwd"
						style="border-radius: 0px" value="">
				</div>
				<div class="form-group">
					<label for="phoneNumber" class="d-flex m-0" style="font-size: 13px">비밀번호
						확인</label> <input type="text" class="form-control"
						style="border-radius: 0px" id="new--pwdcheck" value="">
				</div>
				<br>
			</form>
			<div class="form-control d-flex justify-content-center color-"
				id="btn--pwd" style="border-radius: 0px;">
				<button type="button" id="btn--pwd" class="d-flex widt"
					style="border: none; background-color: white;">finish</button>
			</div>
		</c:if>
	</div>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>