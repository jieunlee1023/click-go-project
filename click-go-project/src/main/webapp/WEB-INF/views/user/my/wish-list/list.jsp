<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="notice">
	<div id="view-more-title">
		<div>💖 즐겨찾기</div>
		<br>
	</div>
	<span style="color: black">: 자주 가는 곳을 등록하시면 더욱 편하게 예약을 하실 수
		있습니다.</span> <br>
	<hr>
	<div class="d-flex-column justify-content-center ml-5">
		<c:choose>
			<c:when test="${empty likeStores.content}">

				<div class="d-flex justify-content-center">
					<div id="franchise--none">
						<br> <br>
						<div>현재 즐겨찾기에 등록하신 가맹점이 <br> 존재하지 않습니다 !</div>
						<br>
					</div>
				</div>


			</c:when>
			<c:otherwise>

				<div class="container d-flex justify-content-center">
					<div class="m-5 pr-5">
						<c:forEach var="category" items="${categoryEntitys}">
							<br>
							<div class="d-flex-column">
								<a href="/wish-list?kategory=${category}">${category}</a>
							</div>
						</c:forEach>
					</div>


					<c:forEach var="likeStore" items="${likeStores.content}">
						<div class="container d-flex">
							<div class="media border mt-3"
								style="width: 700px; height: 410px; border-radius: 15px;">
								<div class="d-flex-column">
									<img src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
										style="width: 700px; height: 300px; border-radius: 15px;">
									<div class="media-body">
										<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
											<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
												<h5 class="" style="font-weight: bold;">${likeStore.store.storeName}</h5>
											</div>
											<div class="d-flex mr-4 mt-3 justify-content-end">
												<span>${likeStore.store.storeAddress}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<%@ include file="../../../layout/footer.jsp"%>