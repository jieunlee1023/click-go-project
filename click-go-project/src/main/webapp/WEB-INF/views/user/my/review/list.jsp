<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>📝 리뷰 내역</div>
	</div>
	<span style="color: black"> 리뷰를 확인해보세요!</span>
	<hr>
	<br>

</div>


<c:choose>
	<c:when test="${principal.user.role eq 'GEUST'}">

		<div class="d-flex-column">
			<c:choose>
				<c:when test="${empty reviewList.content}">
					<div class="d-flex justify-content-center">
						<div id="franchise--none">
							<br>
							<div>현재 작성하신 리뷰가 존재하지 않습니다.</div>
							<span style="color: black; font-size: 15px;">"${principal.user.username}""님의
								리뷰는 click-go와 가맹점 개선에 큰 힘이 됩니다</span> <br> <br> <br> <br>
						</div>
					</div>

				</c:when>

				<c:otherwise>

					<div class="container">
						<table class="table" id="answer-list-table">
							<thead>
								<tr style="text-align: center;">
									<th>고유번호</th>
									<th>리뷰내용</th>
									<th>가맹점명</th>
									<th>별점</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="review" items="${reviewList.content}">
									<tr style="text-align: center;">
										<td><p>${review.id }</p></td>
										<td><p style="overflow: hidden; text-overflow: ellipsis;">
												<a href="/review/detail/${review.id}"
													style="text-decoration: none; color: black;">
													${review.content }</a>
											</p></td>
										<td><p>${review.store.storeName }</p></td>
										<td><p>
												<c:choose>

													<c:when test="${review.starScore eq '1' }">⭐</c:when>
													<c:when test="${review.starScore eq '2' }">⭐⭐</c:when>
													<c:when test="${review.starScore eq '3' }">⭐⭐⭐</c:when>
													<c:when test="${review.starScore eq '4' }">⭐⭐⭐⭐</c:when>
													<c:when test="${review.starScore eq '5' }">⭐⭐⭐⭐⭐</c:when>

												</c:choose>
											</p></td>
										<td><p>${review.createDate }</p></td>

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
		<c:choose>
			<c:when test="${empty reviewList.content}">

				<div class="d-flex justify-content-center">
					<div id="franchise--none">
						<br>
						<div>현재 작성하신 리뷰가 존재하지 않습니다.</div>
						<span style="color: black; font-size: 15px;"> click-go는
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
								<th>리뷰내용</th>
								<th>가맹점명</th>
								<th>별점</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="review" items="${reviewList.content}">
								<tr style="text-align: center;">
									<td><p>${review.id }</p></td>
									<td><p  style="overflow: hidden; text-overflow: ellipsis;">
											<a href="/review/detail/${review.id}"
												style="text-decoration: none; color: black;">
												${review.content }</a>
										</p></td>
									<td><p>${review.store.storeName }</p></td>
									<td><p>
											<c:choose>

												<c:when test="${review.starScore eq '1' }">⭐</c:when>
												<c:when test="${review.starScore eq '2' }">⭐⭐</c:when>
												<c:when test="${review.starScore eq '3' }">⭐⭐⭐</c:when>
												<c:when test="${review.starScore eq '4' }">⭐⭐⭐⭐</c:when>
												<c:when test="${review.starScore eq '5' }">⭐⭐⭐⭐⭐</c:when>

											</c:choose>
										</p></td>
									<td><p>${review.user.username }</p></td>
									<td><fmt:formatDate value="${review.createDate }"
											pattern="yyyy-MM-dd hh시 mm분" /></td>

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
<br><br>
<br>
<br>
<%@ include file="../../../layout/footer.jsp"%>