<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<c:forEach var="store" items="${storeList}">
	<div class="container d-flex">
		<div class="media border mt-3"
			style="width: 1150px; height: 510px; border-radius: 15px;">
			<div class="d-flex-column">
				<a href="/storeFranchise/store-franchise-my${store.id}"> <img
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

<%@ include file="../layout/footer.jsp"%>