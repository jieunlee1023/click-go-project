<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container" id="store-franchise-apply-list">
	<br>
	<div id="view-more-title">
		<div>🧾 가맹점 신청목록</div>
	</div>
	<br>

	<div>
		<div
			class="d-flex justify-content-between border-top border-bottom pt-3">
			<div style="width: 100px; height: 50px; text-align: center">등록번호</div>
			<div style="width: 100px; height: 50px; text-align: center">카테고리</div>
			<div style="width: 100px; height: 50px; text-align: center">가게명</div>
			<div style="width: 130px; height: 50px; text-align: center">가게번호</div>
			<div style="width: 100px; height: 50px; text-align: center">등록일</div>
			<div style="width: 100px; height: 50px; text-align: center">상태</div>
			<div style="width: 100px; height: 50px; text-align: center">거절사유</div>

		</div>
		<c:forEach var="msg" items="${message}">
			<c:if test="${principal.user.id eq msg.user.id }">
				<c:choose>
					<c:when test="${msg.state eq 'APPROVE'}">
						<div class="d-flex justify-content-between border-bottom"
							id="applylist--list">
							<div style="width: 100px; height: 50px;">
								<p>${10000+msg.id }</p>
							</div>
							<div style="width: 100px; height: 50px;">
								<p>${msg.category.id}</p>
							</div>
							<div style="width: 100px; height: 50px;">
								<p>${msg.storeName}</p>
							</div>
							<div style="width: 130px; height: 50px;">
								<p>${msg.storeTEL}</p>
							</div>
							<div style="width: 100px; height: 50px;">${msg.applyDate}</div>
							<div
								style="width: 100px; height: 50px; text-align: center; color: blue;">
								<p>${msg.state}</p>
							</div>
							<small style="width: 100px; height: 50px;">${msg.rejectReason}</small>
						</div>
					</c:when>
					<c:when test="${msg.state eq 'REJECT'}">
						<div class="d-flex justify-content-between border-bottom"
							id="applylist--list">
							<div style="width: 100px; height: 50px;">
								<p>${10000+msg.id }</p>
							</div>
							<div style="width: 100px; height: 50px;">
								<p>${msg.category.id}</p>
							</div>
							<div style="width: 100px; height: 50px;">
								<p>${msg.storeName}</p>
							</div>
							<div style="width: 130px; height: 50px;">
								<p>${msg.storeTEL}</p>
							</div>
							<div style="width: 100px; height: 50px;">${msg.applyDate}</div>
							<div
								style="width: 100px; height: 50px; text-align: center; color: red;">
								<p>${msg.state}</p>
							</div>
							<small style="width: 100px; height: 50px;">${msg.rejectReason}</small>
						</div>
					</c:when>
					<c:otherwise>
						<div class="d-flex justify-content-between border-bottom"
							id="applylist--list">
							<div style="width: 100px; height: 50px;">
								<p>${10000+msg.id }</p>
							</div>
							<div style="width: 100px; height: 50px;">
								<p>${msg.category.id}</p>
							</div>
							<div style="width: 100px; height: 50px;">
								<p>${msg.storeName}</p>
							</div>
							<div style="width: 130px; height: 50px;">
								<p>${msg.storeTEL}</p>
							</div>
							<div style="width: 100px; height: 50px;"><fmt:formatDate value="${msg.applyDate}" pattern="yyyy-MM-dd" /></div>
							<div
								style="width: 100px; height: 50px; text-align: center; color: orange;">
								<p>${msg.state}</p>
							</div>
							<small style="width: 100px; height: 50px;">${msg.rejectReason}</small>
						</div>
					</c:otherwise>
				</c:choose>


			</c:if>
		</c:forEach>
	</div>



</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script type="text/javascript" src="/js/storeFranchise.js"></script>
<%@ include file="../layout/footer.jsp"%>