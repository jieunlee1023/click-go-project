<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>📝 리뷰 내역</div>
	</div>
	<hr>
	<br>
</div>
<div class="d-flex justify-content-center">

	<c:choose>
		<c:when test="${principal.user.role eq 'GEUST'}">

			<div class="d-flex-column">
				<br> <br> <br>
				<c:choose>
					<c:when test="${empty reviewList.content}">
						<div class="d-flex justify-content-center">
							<div id="franchise--none">
								<br>
								<div>현재 작성하신 리뷰가 존재하지 않습니다.</div>
								<span style="color: #6478ff; font-size: 15px;">"${principal.user.username}""님의
									리뷰는 click-go와 가맹점 개선에 큰 힘이 됩니다</span> <br> <br> <br> <br>
							</div>
						</div>

					</c:when>

					<c:otherwise>
						<c:forEach var="review" items="${reviewList.content}">
							<div class="media border mt-3"
								style="width: 800px; height: 50px; border-radius: 15px;">
								<div class="media-body">
									<a href="/review/detail/${review.id}">
										<div class="d-flex justify-content-between m-2 ml-3">
											<h5>${review.content}</h5>
											<div>
												<span class="m-1 mr-2">${review.store.storeName}</span> <span
													class="m-1 mr-2">${review.createDate}</span> <span
													class="m-1 mr-2">${review.starScore}</span>
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</c:when>
		<c:otherwise>
			<div class="d-flex-column">
				<br> <br>
				<c:choose>
					<c:when test="${empty reviewList.content}">

						<div class="d-flex justify-content-center">
							<div id="franchise--none">
								<br>
								<div>현재 작성하신 리뷰가 존재하지 않습니다.</div>
								<span style="color: #6478ff; font-size: 15px;"> click-go는
									가맹점주님의 성공을 위해 최선을 다 할 것입니다.</span> <br> <br> <br> <br>
							</div>
						</div>

					</c:when>
					<c:otherwise>
						<c:forEach var="review" items="${reviewList.content}">
							<div class="media border mt-3"
								style="width: 1000px; height: 50px; border-radius: 15px;">
								<div class="media-body">
									<a href="/review/detail/${review.id}">
										<div class="d-flex justify-content-between m-2 ml-3">
											<h5>${review.content}</h5>
											<div>
												<div class="d-flex justify-content-between">
													<span class="m-1 mr-2">${review.user.username}님</span> <span
														class="m-1 mr-2">${review.store.storeName}</span> <span
														class="m-1 mr-2">게시 날짜 :${review.createDate}</span> <span
														class="m-1 mr-2">평점 :${review.starScore}</span>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<%@ include file="../../../layout/footer.jsp"%>