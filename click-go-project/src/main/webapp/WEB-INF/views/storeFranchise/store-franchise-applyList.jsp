<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex justify-content-between">
		<h1>가맹점 신청 내역</h1>
	</div>

	<br> <br>
	<div>
		<div class="d-flex justify-content-between">
			<div style="width: 100px; height: 50px; text-align: center">등록번호</div>
			<div style="width: 100px; height: 50px; text-align: center">카테고리</div>
			<div style="width: 100px; height: 50px; text-align: center">가게명</div>
			<div style="width: 130px; height: 50px; text-align: center">가게번호</div>
			<div style="width: 100px; height: 50px; text-align: center">등록일</div>
			<div style="width: 100px; height: 50px; text-align: center">상태</div>
			<div style="width: 100px; height: 50px; text-align: center">거절이유</div>

		</div>
		<c:forEach var="msg" items="${message}">
			<c:if test="${principal.user.id eq msg.user.id }">
				<c:choose>
					<c:when test="${msg.state eq 'APPROVE'}">
						<div class="d-flex justify-content-between">
							<div style="width: 100px; height: 50px; text-align: center">${10000+msg.id }</div>
							<div style="width: 100px; height: 50px;; text-align: center">${msg.category.id}</div>
							<div style="width: 100px; height: 50px; text-align: center">${msg.storeName}</div>
							<div style="width: 130px; height: 50px; text-align: center">${msg.storeTEL}</div>
							<div style="width: 100px; height: 50px; text-align: center">${msg.applyDate}</div>
							<div style="width: 100px; height: 50px; text-align: center; color: blue;">${msg.state}</div>
							<small style="width: 100px; height: 50px; text-align: center">${msg.rejectReason}</small>
						</div>
					</c:when>
					<c:when test="${msg.state eq 'REJECT'}">
						<div class="d-flex justify-content-between">
							<div style="width: 100px; height: 50px; text-align: center">${10000+msg.id }</div>
							<div style="width: 100px; height: 50px;; text-align: center">${msg.category.id}</div>
							<div style="width: 100px; height: 50px; text-align: center">${msg.storeName}</div>
							<div style="width: 130px; height: 50px; text-align: center">${msg.storeTEL}</div>
							<div style="width: 100px; height: 50px; text-align: center">${msg.applyDate}</div>
							<div style="width: 100px; height: 50px; text-align: center; color: red;">${msg.state}</div>
							<small style="width: 100px; height: 50px; text-align: center">${msg.rejectReason}</small>
						</div>
					</c:when>
					<c:otherwise>
						<div class="d-flex justify-content-between">
							<div style="width: 100px; height: 50px; text-align: center">${10000+msg.id }</div>
							<div style="width: 100px; height: 50px;; text-align: center">${msg.category.id}</div>
							<div style="width: 100px; height: 50px; text-align: center">${msg.storeName}</div>
							<div style="width: 130px; height: 50px; text-align: center">${msg.storeTEL}</div>
							<div style="width: 100px; height: 50px; text-align: center">${msg.applyDate}</div>
							<div style="width: 100px; height: 50px; text-align: center; color: orange;">${msg.state}</div>
							<small style="width: 100px; height: 50px; text-align: center">${msg.rejectReason}</small>
						</div>
					</c:otherwise>

				</c:choose>


			</c:if>
		</c:forEach>
	</div>





</div>

<script type="text/javascript" src="/js/storeFranchise.js"></script>
<%@ include file="../layout/footer.jsp"%>