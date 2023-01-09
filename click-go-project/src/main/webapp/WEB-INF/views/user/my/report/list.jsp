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
				<div class="container">
					<div class="d-flex border-bottom" id="report--header">
						<div id="report--number">번호</div>
						<div id="report--title">제목</div>
						<div id="report--storeName">가맹점명</div>
						<div id="report--status">관리자 댓글</div>
					</div>
					<c:forEach var="report" items="${reports.content}">
						<div class="d-flex  border-bottom" id="report--list">
							<div id="report--number">${report.id}</div>
							<a id="report--title" href="/report/detail/${report.id}">
								${report.title} </a>
							<div id="report--storeName">${report.store.storeName}</div>
							<div id="report--status">${report.approveStatus}</div>

						</div>
					</c:forEach>
				</div>
				</c:otherwise>
			</c:choose>
		</div>

	</c:when>
	<c:otherwise>
		<br>
		<div class="container d-flex justify-content-start">
			<a href="/report/list/0" style="text-decoration: none;"
				class="report-list">💥 내가 보낸 신고 내역 보기</a> 
				<a href="/report/list/1"
				style="text-decoration: none;" class="report-list">💥 내 가게가 받은
				신고 내역 보기</a>
		</div>
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
				<div class="container">
					<div class="d-flex border-bottom" id="report--header">
						<div id="report--number">번호</div>
						<div id="report--title">제목</div>
						<div id="report--storeName">신고</div>
						<div id="report--status">관리자 댓글</div>
					</div>
					<c:forEach var="report" items="${reports.content}">
						<div class="d-flex  border-bottom" id="report--list">
							<div id="report--number">${report.id}</div>
							<a id="report--title" href="/report/detail/${report.id}">
								${report.title} </a>
							<div id="report--storeName">${report.user.username}</div>
							<div id="report--status">${report.approveStatus}</div>

						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
<br>
<br>
<br>
<%@ include file="../../../layout/footer.jsp"%>