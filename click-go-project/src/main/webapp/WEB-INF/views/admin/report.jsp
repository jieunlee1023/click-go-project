<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>
			๐ ์ ์ฒด ์ ๊ณ  ๋ด์ญ <a id="btn--back" class="btn" href="./main">๋์๊ฐ๊ธฐ</a>
		</div>

	</div>
</div>


<div class="container">
	<table class="table" id="answer-list-table">
		<thead>
			<tr style="text-align: center;">
				<th>๊ณ ์ ๋ฒํธ</th>
				<th>์ ๋ชฉ</th>
				<th>์ ๊ณ ํ์</th> 
				<th>๊ฐ๋งน์ ๋ช</th>
				<th>์ด์ฉ์</th>
				<th>๋ต๋ณ ์ฌ๋ถ</th>
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

					<c:choose>
						<c:when test="${report.reportType eq 'USER'}">
							<td style="color: blue;" id="report--admin--type"><p>์ ์ ์ ๊ณ </p></td>
						</c:when>
						<c:otherwise>
							<td style="color: red;" id="report--admin--type"><p>๊ฐ๋งน์ ์ ๊ณ </p></td>
						</c:otherwise>
					</c:choose> 

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
				id="page--previous">์ด์ </a></li>
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
				id="page--next">๋ค์</a></li>

		</ul>

	</div>

	<br>

</div>


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

