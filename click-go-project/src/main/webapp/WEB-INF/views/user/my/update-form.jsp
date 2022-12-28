<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<br>
<br>
<div class="container d-flex justify-content-center"
	style="width: 500px">
	<div class="container">
		<c:choose>
			<c:when test="${empty principal.user.loginType}">
				<form>
					<input type="hidden" value="${principal.user.id}" id="id">
					<input type="hidden" value="" id="password">
					<div class="form-group ">
						<label for="username" class="d-flex m-0" style="font-size: 13px">아이디</label>
						<input type="text" class="form-control " id="username"
							style="border-radius: 0px" value="${principal.user.username}"
							readonly="readonly">
					</div>
					<c:if test="${empty principal.user.loginType }">
						<input type="hidden" value="${principal.user.username}"
							id="username">
						<input type="hidden" value="${principal.user.id}" id="id">
						<div class="form-group">
							<label for="email" class="d-flex m-0" style="font-size: 13px">새
								비밀번호</label> <input type="text" class="form-control" id="new--pwd"
								style="border-radius: 0px" value="">
						</div>
						<div class="form-group">
							<label for="phoneNumber" class="d-flex m-0"
								style="font-size: 13px">비밀번호 확인</label> <input type="text"
								class="form-control" style="border-radius: 0px"
								id="new--pwd-check" value="">
						</div>
					</c:if>
					<div class="form-group">
						<label for="email" class="d-flex m-0" style="font-size: 13px">이메일</label>
						<input type="email" class="form-control" id="email"
							style="border-radius: 0px" value="${principal.user.email}">
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="d-flex m-0"
							style="font-size: 13px">휴대전화</label> <input type="text"
							class="form-control" style="border-radius: 0px" id="phoneNumber"
							value="${principal.user.phoneNumber}">
					</div>
					<br>
				</form>
				<br>
				<div class="form-control d-flex justify-content-center color-"
					id="joinbutton" style="border-radius: 0px;">
					<button type="button" id="btn--update" class="d-flex widt"
						style="border: none; background-color: white;">finish</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group ">
					<label for="username" class="d-flex m-0" style="font-size: 13px">아이디</label>
					<input type="text" class="form-control " id="username"
						style="border-radius: 0px" value="${principal.user.username}"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="password" class="d-flex m-0" style="font-size: 13px">비밀번호</label>
					<input type="text" class="form-control" style="border-radius: 0px"
						value="소셜 가입자는 열람하실 수 없습니다." readonly="readonly">
				</div>
				<div class="form-group">
					<label for="email" class="d-flex m-0" style="font-size: 13px">이메일</label>
					<input type="email" class="form-control" style="border-radius: 0px"
						value="소셜 가입자는 열람하실 수 없습니다." readonly="readonly">
				</div>
				<div class="form-group">
					<label for="phoneNumber" class="d-flex m-0" style="font-size: 13px">휴대전화</label>
					<input type="text" class="form-control" style="border-radius: 0px"
						value="소셜 가입자는 열람하실 수 없습니다." readonly="readonly">
				</div>
				<br>
			</c:otherwise>
		</c:choose>


	</div>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../../layout/footer.jsp"%>