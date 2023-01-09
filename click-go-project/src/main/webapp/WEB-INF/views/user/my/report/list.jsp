<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>🔔 신고 내역</div>
	</div>
	<hr>
</div>


<c:choose>
	<c:when test="${principal.user.role eq 'GEUST'}">

		<div class="d-flex-column">
			<c:choose>
				<c:when test="${empty reports.content}">
					<div class="d-flex justify-content-center">
						<div id="franchise--none">
							<br>
							<div>현재 신고하신 내역이 존재하지 않습니다.</div>
							<span style="color: black; font-size: 15px;"> click go는
								"${principal.user.username}""님의 편안함을 위해 최선을 다 할 것입니다.</span> <br>
							<br> <br> <br>
						</div>
					</div>

				</c:when>

				<c:otherwise>
					<c:forEach var="report" items="${reports.content}">
						<div class="container d-flex justify-content-center">
							<a href="/report/detail/${report.id}">
								<div>${report.title}</div>
								<div class="m-1 mr-2">${report.store.storeName}</div>
								<div class="m-1 mr-2">${report.approveStatus}</div>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${myList == 0}">
				<br>
				<div class="container d-flex justify-content-end ">
					<a href="/report/report-list/1" style="text-decoration: none;"
						class="report-list">💥 내 가게가 받은 신고 내역 보기</a>
				</div>
			</c:when>
			<c:otherwise>
				<br>
				<div class="container d-flex justify-content-start">
					<a href="/report/report-list/0" style="text-decoration: none;"
						class="report-list">💥 내가 보낸 신고 내역 보기</a>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="d-flex-column">
			<br>
			<c:choose>
				<c:when test="${empty reports.content}">

					<div class="d-flex justify-content-center">
						<div id="franchise--none">
							<br>
							<div>현재 신고하신 내역이 존재하지 않습니다.</div>
							<span style="color: black; font-size: 15px;"> click go는
								가맹점주님의 성공을 위해 최선을 다 할 것입니다.</span> <br> <br> <br> <br>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<c:forEach var="report" items="${reports.content}">
						<a href="/report/detail/${report.id}">
								<div>${report.title}</div>
								<div class="m-1 mr-2">${report.store.storeName}</div>
								<div class="m-1 mr-2">${report.approveStatus}</div>
						</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</c:otherwise>
</c:choose>

<br>
<br>
<br>
<%@ include file="../../../layout/footer.jsp"%>