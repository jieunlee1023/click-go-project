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
	<hr>
</div>


<div class="container">
	<div class="d-flex border-bottom" id="report--admin--header">
		<div id="report--admin--number">번호</div>
		<div id="report--admin--title">제목</div>
		<div id="report--admin--type">신고타입</div>
		<div id="report--admin--store">가맹점</div>
		<div id="report--admin--client">이용자</div>
		<div id="report--admin--status">답변 여부</div>
	</div>

	<c:forEach var="report" items="${reports.content}">
		<div class="d-flex  border-bottom" id="report--admin--list">
			<div id="report--admin--number">${report.id}</div>
			<a id="report--admin--title" href="/report/detail/${report.id}">${report.title}
			</a>
			<c:choose>
				<c:when test="${report.reportType eq 'USER'}">
					<div style="color: blue;" id="report--admin--type">유저신고</div>
				</c:when>
				<c:otherwise>
					<div style="color: red;" id="report--admin--type">가맹점신고</div>
				</c:otherwise>
			</c:choose>

			<div id="report--admin--store">id: ${report.store.id },
				${report.store.storeName}</div>
			<div id="report--admin--client">id: ${report.user.id },
				${report.user.username}</div>
			<c:choose>
				<c:when test="${report.approveStatus eq 'COMPLETED'}">
					<div style="color: grey;" id="report--admin--status">${report.approveStatus}</div>
				</c:when>
				<c:otherwise>
					<div style="color: orange;" id="report--admin--status">${report.approveStatus}</div>
				</c:otherwise>
			</c:choose>


		</div>
	</c:forEach>
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

