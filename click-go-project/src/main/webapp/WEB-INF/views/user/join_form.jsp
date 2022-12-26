<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>
<br>
<div class="container">
	<form>
		<div class="form-group">
			<label for="username">username:</label> <input type="text"
				class="form-control" placeholder="Enter username" id="username"
				value="min">
		</div>
		<div class="form-group">
			<label for="password">password:</label> <input type="password"
				class="form-control" placeholder="Enter password" id="password"
				value="123">
		</div>
		<div class="form-group">
			<label for="email">Email:</label> <input type="email"
				class="form-control" placeholder="Enter email" id="email"
				value="a@naver.com">
		</div>
		<div class="form-group">
			<label for="phoneNumber">phoneNumber:</label> <input type="text"
				class="form-control" placeholder="Enter phoneNumber"
				id="phoneNumber" value="010-1111-1111">
		</div>
		<div class="form-group">
			<label for="role">role:</label> <input type="text"
				class="form-control" placeholder="Enter role" id="role"
				value="ADMIN">
		</div>
	</form>
	<button type="button" id="btn--save" class="btn btn-primary">sign
		up</button>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>