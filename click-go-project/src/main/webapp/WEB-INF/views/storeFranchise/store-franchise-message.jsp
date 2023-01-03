<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container " id="franchise--list">

	<div id="view-more-title">
		<div>📩 가맹점 신청서</div>
	</div>
<hr>

<c:choose>
	<c:when test="${waitMsg eq 0 }">
		<div class="d-flex justify-content-center">
			<div id="franchise--none">
				<br>
				<br>
				<div>아무런 신청이 들어오지 않았습니다!</div>
				<br>
				<br>
				<br>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="msg" items="${message}">
			<c:if test="${msg.state eq 'WAIT' }">
				<input type="hidden" value="${message.size() }" id="msgSize">
				<div class="d-flex justify-content-center m-5">
						<input type="hidden"
							value="http://localhost:7777/licence/${msg.licenseImageUrl}"
							id="licenseImageUrl${message.indexOf(msg)}"> <input
							type="hidden"
							value="http://localhost:7777/layout/${msg.layoutImageUrl}"
							id="layoutImageUrl${message.indexOf(msg)}">

						<section class="main-card">
							<div class="card-content">
								<div class="content-left">
									<img class="full-img"
										src="http://localhost:7777/licence/${msg.licenseImageUrl}"
										alt="사업자등록증">
								</div>
								<div class="content-right">
									<button type="button" class="btn btn-danger"
										id="btn--store-franchise-approve-${message.indexOf(msg)}">가맹점
										승인</button>
									<button type="button" class="btn btn-warning"
										id="btn--store-franchise-reject-${message.indexOf(msg)}">가맹점
										거절</button>
									<br><br>
									<span>신청서 ID: </span> <span
								id="franchiseId${message.indexOf(msg)}">${msg.id}</span>
								<span>가맹점주ID : </span> <span id="userId${message.indexOf(msg)}">${msg.user.id}</span>
									<h2>
										<span>가맹점명 : </span> <span
											id="storeName${message.indexOf(msg)}">${msg.storeName}</span>
									</h2>
							
							<span>카테고리 :</span> <span
								id="category${message.indexOf(msg)}">${msg.category.id}</span>
							<br> <span>가맹점 번호 : </span> <span
								id="storeTel${message.indexOf(msg)}">${msg.storeTEL}</span><br>
							<span>가맹점 주소 : </span> <span
								id="storeAddress${message.indexOf(msg)}">${msg.storeAddress}</span><br>
							<span>가맹점 총 자리 갯수 : </span> <span
								id="storeTotalRoomCount${message.indexOf(msg)}">${msg.storeTotalRoomCount}</span><br>
							<span>10분당 이용 금액 : ₩</span> <span
								id="price${message.indexOf(msg)}">${msg.price}</span><br> <br>
							<br>

									<div class="mini-imgs">
										<img class="mini-img"
											src="http://localhost:7777/licence/${msg.licenseImageUrl}"
											alt="사업자등록증" onclick="location.href = 'http://localhost:7777/licence/${msg.layoutImageUrl}'"> <img class="mini-img"
											src="http://localhost:7777/layout/${msg.layoutImageUrl}"
											alt="가게 자리 배치도" onclick="location.href = 'http://localhost:7777/layout/${msg.layoutImageUrl}'"> 
									</div>
								</div>
							</div>
						</section>

					</div>

			</c:if>
		</c:forEach>
	</c:otherwise>
</c:choose>

</div>

<script type="text/javascript" src="/js/storeFranchise.js"></script>

<script type="text/javascript">
	var fullImg = document.querySelector(".full-img");
	var miniImg = document.querySelectorAll(".mini-img");

	function changeImg(x) {

		var targetImg = miniImg[x - 1];
		var imgAttr = targetImg.getAttribute("src");

		fullImg.setAttribute("src", imgAttr);

	}
</script>

<%@ include file="../layout/footer.jsp"%>