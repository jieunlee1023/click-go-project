<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>🔔 신고 내역</div>
	</div>
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
						<table class="table" id="answer-list-table">
							<thead>
								<tr style="text-align: center;">
									<th>고유번호</th>
									<th>제목</th>
									<th>가맹점명</th>
									<th>관리자 댓글</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="report" items="${reports.content}">
									<tr style="text-align: center;">
										<td><p>${report.id}</p></td>
										<td><p>
												<a id="report--title" href="/report/detail/${report.id}">
													${report.title} </a>
											</p></td>
										<td><p>${report.store.storeName}</p></td>
										<c:choose>
											<c:when test="${report.approveStatus eq 'COMPLETED'}">

												<td style="color: grey;" id="report--status"><p>${report.approveStatus}</p></td>
											</c:when>
											<c:otherwise>
												<td style="color: orange;" id="report--status"><p>${report.approveStatus}</p></td>
											</c:otherwise>
										</c:choose>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>




				</c:otherwise>
			</c:choose>
		</div>

	</c:when>
	<c:otherwise>
		<br>
		<div class="container d-flex justify-content-start">
			<a href="/report/list/0" style="text-decoration: none;"
				class="report-list">💣 내가 보낸 신고 내역 보기</a> <a href="/report/list/1"
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
					<table class="table" id="answer-list-table">
						<thead>
							<tr style="text-align: center;">
								<th>고유번호</th>
								<th>제목</th>
								<th>가맹점명</th>
								<th>관리자 댓글</th>
							</tr>
						</thead>
						<tbody>


							<c:forEach var="report" items="${reports.content}">
								<tr style="text-align: center;">
									<td><p>${report.id}</p></td>
									<td><p>
											<a id="report--title" href="/report/detail/${report.id}">
												${report.title} </a>
										</p></td>
									<td><p>${report.store.storeName}</p></td>
									<c:choose>
										<c:when test="${report.approveStatus eq 'COMPLETED'}">

											<td style="color: grey;" id="report--status"><p>${report.approveStatus}</p></td>
										</c:when>
										<c:otherwise>
											<td style="color: orange;" id="report--status"><p>${report.approveStatus}</p></td>
										</c:otherwise>
									</c:choose>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../../../layout/footer.jsp"%>