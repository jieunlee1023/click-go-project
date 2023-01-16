<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<div class="container d-flex justify-content-center" id="update--form">
	<div class="container">
		<c:choose>
			<c:when test="${principal.user.loginType eq 'CLICKGO'}">
				<form>
					<input type="hidden" value="${principal.user.id}" id="id">
					<input type="hidden" value="" id="password">
					<div class="form-group ">
						<label for="username" class="d-flex m-0">아이디</label> <input
							type="text" class="form-control " id="username"
							value="${principal.user.username}" readonly="readonly">
					</div>
					<c:if test="${principal.user.loginType eq 'CLICKGO'}">
						<input type="hidden" value="${principal.user.username}"
							id="username">
						<input type="hidden" value="${principal.user.id}" id="id">
						<div class="form-group">
							<label for="email" class="d-flex m-0">새 비밀번호</label> <input
								type="password" class="form-control" id="new--pwd">
						</div>
						<div class="form-group">
							<label for="phoneNumber" class="d-flex m-0"
								style="font-size: 13px">비밀번호 확인</label> <input type="password"
								class="form-control" id="new--pwd-check">
						</div>
					</c:if>
					<div class="form-group">
						<label for="email" class="d-flex m-0">이메일</label> <input
							type="email" class="form-control" id="email"
							value="${principal.user.email}">
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="d-flex m-0">휴대전화</label>
						<input type="text" class="form-control" id="phoneNumber"
							value="${principal.user.phoneNumber}">
					</div>
					<br>
				</form>
				<br>
				<div class="form-control d-flex justify-content-center color-"
					id="joinbutton">
					<button type="button" id="btn--update" class="d-flex" style="background-color: transparent;">회원
						정보 수정하기</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group ">
					<label for="username" class="d-flex m-0">아이디</label> <input
						type="text" class="form-control " id="username"
						value="${principal.user.username}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="password" class="d-flex m-0">비밀번호</label> <input
						type="text" class="form-control" value="소셜 가입자는 열람하실 수 없습니다."
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="email" class="d-flex m-0">이메일</label> <input
						type="email" class="form-control" value="소셜 가입자는 열람하실 수 없습니다."
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="phoneNumber" class="d-flex m-0">휴대전화</label> <input
						type="text" class="form-control" value="소셜 가입자는 열람하실 수 없습니다."
						readonly="readonly">
				</div>
				<br>
			</c:otherwise>
		</c:choose>


	</div>
</div>
<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../../layout/footer.jsp"%>