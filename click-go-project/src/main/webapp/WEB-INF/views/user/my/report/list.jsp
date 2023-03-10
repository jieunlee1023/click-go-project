<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>π μ κ³  λ΄μ­</div>
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
							<div>νμ¬ μ κ³ νμ  λ΄μ­μ΄ μ‘΄μ¬νμ§ μμ΅λλ€.</div>
							<span style="color: black; font-size: 15px;"> click goλ
								"${principal.user.username}""λμ νΈμν¨μ μν΄ μ΅μ μ λ€ ν  κ²μλλ€.</span> <br>
							<br> <br> <br>
						</div>
					</div>
				</c:when>

				<c:otherwise>


					<div class="container">
						<table class="table" id="answer-list-table">
							<thead>
								<tr style="text-align: center;">
									<th>κ³ μ λ²νΈ</th>
									<th>μ λͺ©</th>
									<th>κ°λ§Ήμ λͺ</th>
									<th>κ΄λ¦¬μ λκΈ</th>
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
				class="report-list">π£ λ΄κ° λ³΄λΈ μ κ³  λ΄μ­ λ³΄κΈ°</a> <a href="/report/list/1"
				style="text-decoration: none;" class="report-list">π₯ λ΄ κ°κ²κ° λ°μ
				μ κ³  λ΄μ­ λ³΄κΈ°</a>
		</div>
		<br>

		<c:choose>
			<c:when test="${empty reports.content}">

				<div class="d-flex justify-content-center">
					<div id="franchise--none">
						<br>
						<div>νμ¬ μ κ³ νμ  λ΄μ­μ΄ μ‘΄μ¬νμ§ μμ΅λλ€.</div>
						<span style="color: black; font-size: 15px;"> click goλ
							κ°λ§Ήμ μ£Όλμ μ±κ³΅μ μν΄ μ΅μ μ λ€ ν  κ²μλλ€.</span> <br> <br> <br> <br>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<div class="container">
					<table class="table" id="answer-list-table">
						<thead>
							<tr style="text-align: center;">
								<th>κ³ μ λ²νΈ</th>
								<th>μ λͺ©</th>
								<th>κ°λ§Ήμ λͺ</th>
								<th>κ΄λ¦¬μ λκΈ</th>
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