<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>
			🔔 전체 신고 내역 <a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>

	</div>
</div>


<div class="container">
	<table class="table" id="answer-list-table">
		<thead>
			<tr style="text-align: center;">
				<th>고유번호</th>
				<th>제목</th>
<!-- 				<th>신고타입</th> -->
				<th>가맹점명</th>
				<th>이용자</th>
				<th>답변 여부</th>
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

<%-- 					<c:choose>
						<c:when test="${report.reportType eq 'USER'}">
							<td style="color: blue;" id="report--admin--type"><p>유저신고</p></td>
						</c:when>
						<c:otherwise>
							<td style="color: red;" id="report--admin--type"><p>가맹점신고</p></td>
						</c:otherwise>
					</c:choose> --%>

					<td><p>id: ${report.store.id }, ${report.store.storeName}</p></td>
					<td><p>id: ${report.user.id }, ${report.user.username}</p></td>

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


	<br> <br> <br>
	<div class="d-flex justify-content-center">
		<ul class="pagination">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<li
				class="page-item ${storeList.first ? isDisabled : isNotDisabled } "><a
				class="page-link" href="?page=${storeList.number - 1 }"
				id="page--previous">이전</a></li>
			<c:forEach var="num" items="${pageNumbers }">
				<c:choose>
					<c:when test="${nowPage eq num }">
						<li class="page-item"><a class="page-link"
							href="?q=${q }&page=${num - 1 }" id="page--select">${num }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							id="page--no--select" href="?q=${q }&page=${num - 1 }">${num }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${storeList.last ? isDisabled : isNotDisabled }"><a
				class="page-link" href="?page=${storeList.number + 1 }"
				id="page--next">다음</a></li>

		</ul>

	</div>

	<br>

</div>


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

