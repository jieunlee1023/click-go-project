<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container d-flex justify-content-start pl-5">
	<h1 style="font-weight: bold;">신고 내역</h1>
</div>
<div class="d-flex justify-content-center">

	<c:choose>
		<c:when test="${principal.user.role eq 'GEUST'}">

			<div class="d-flex-column">
				<br> <br> <br>
				<c:choose>
					<c:when test="${empty reports.content}">
						<h1>현재 신고하신 내역이 존재하지 않습니다.</h1>
						<h5>click go는 ${principal.user.username}님의 편안함을 위해 최선을 다 할
							것입니다.</h5>
					</c:when>

					<c:otherwise>
						<c:forEach var="report" items="${reports.content}">
							<div class="media border mt-3"
								style="width: 800px; height: 50px; border-radius: 15px;">
								<div class="media-body">
									<a href="/report/detail/${report.id}">
										<div class="d-flex justify-content-between m-2 ml-3">
											<h5>${report.title}</h5>
											<div>
												<span class="m-1 mr-2">${report.store.storeName}</span> <span
													class="m-1 mr-2">${report.approveStatus}</span>
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
			<c:choose>
				<c:when test="${myList == 0}">
					<div class="mr-5 mt-5">
						<div class="mr-5">
							<br>
							<div class="d-flex-column">
								<div class="m-4">
									<a href="/report/report-list/1">내 가게가 받은 신고 내역 보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="mr-5 mt-5">
						<div class="mr-5">
							<br>
							<div class="d-flex-column">
								<div class="m-4">
									<a href="/report/report-list/0">내가 보낸 신고 내역 보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="d-flex-column">
				<br> <br> <br>
				<c:choose>
					<c:when test="${empty reports.content}">
						<h1>현재 신고하신 내역이 존재하지 않습니다.</h1>
						<h5>click go는 사장님의 성공을 위해 최선을 다 할 것입니다.</h5>
					</c:when>
					<c:otherwise>
						<c:forEach var="report" items="${reports.content}">
							<div class="media border mt-3"
								style="width: 800px; height: 50px; border-radius: 15px;">
								<div class="media-body">
									<a href="/report/detail/${report.id}">
										<div class="d-flex justify-content-between m-2 ml-3">
											<h5>${report.title}</h5>
											<div>
												<span class="m-1 mr-2">${report.user.username}</span> <span
													class="m-1 mr-2">${report.approveStatus}</span>
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