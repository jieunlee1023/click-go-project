<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<c:forEach var="msg" items="${message}">
<input type="hidden" value="${message.size() }" id="msgSize">
<div class="d-flex justify-content-center m-5">
		<div class="card " style="width: 400px">
		<!-- 	<img class="card-img-top" src="${msg.storeLicense}" alt="사업자 등록증"> -->
			<div class="card-body ">
				<span>사용자ID : </span> <span id="userId${message.indexOf(msg)}">${msg.user.id}</span> <br>
				<span>사용자이름: </span> <span>${msg.user.username}</span> <br> <br> 
				<span>신청서 ID: </span> <span id="franchiseId${message.indexOf(msg)}">${msg.id}</span> <br> <br> 
				<span>카테고리 :</span> <span>${msg.category}</span> <br> 
				<span>가게명 : </span> <span>${msg.storeName}</span><br> 
				<span>가게번호 : </span> <span>${msg.storeTEL}</span><br>
				<span>가게주소 : </span> <span>${msg.storeAddress}</span><br> 
				<br><br>
				<button type="button" class="btn btn-danger" 
				id="btn--store-franchise-approve-${message.indexOf(msg)}">가맹점 등록</button>
			</div>
		</div>

		<br>
	</div>

</c:forEach>
<script type="text/javascript" src="/js/storeFranchise.js"></script>

<%@ include file="../layout/footer.jsp"%>