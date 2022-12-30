<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container">
	<h1>매장 관리</h1>
	<h5>이용자들이 보는 가게의 화면을 꾸며보세요 !</h5>
</div>
<br>
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;
<div class="d-flex-column justify-content-center">
	<c:choose>
		<c:when test="${empty stores}">
			<br>
			<br>
			<br>
			<br>
			<div class="container d-flex">
				<h2 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h2>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="store" items="${stores}">
				<div class="container d-flex">
					<div class="media border mt-3"
						style="width: 1150px; height: 510px; border-radius: 15px;">
						<div class="d-flex-column">
							<a href="/care-store/detail/${store.id}"> <img
								src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
								style="width: 1150px; height: 400px; border-radius: 15px;">
								<div class="media-body">
									<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
										<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
											<h5 class="" style="font-weight: bold;">${store.storeName}</h5>
										</div>
										<div class="d-flex mr-4 mt-3 justify-content-end">
											<span>${store.storeAddress}</span> 
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<br>
<%@ include file="../../../layout/footer.jsp"%>