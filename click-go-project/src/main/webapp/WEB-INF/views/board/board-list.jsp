<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<%--   <c:if  test="${boards.secret == true}">
    <c:choose>
        <c:when test="${boards.user eq member.vo.userid || member.authorities eq '[ROLE_ADMIN, ROLE_MEMBER]'}"> <!-- 작성자이거나 관리자일 때 -->
            <td><a href="get${pageMaker.cri.listLink}&bno=${board.bno}" class="text-secondary text-center"><i class="icofont-lock"></i><c:out value="${board.title}"/><span class="text-muted small"> [${board.replyCnt}]</span></a></td>
        </c:when>
        <c:otherwise>
            <td class="text-secondary"><i class="icofont-lock"></i><c:out value="${board.title}"/><span class="text-muted small"> [${board.replyCnt}]</span></td>
        </c:otherwise>
    </c:choose>                                            
</c:if> 
 --%>

<div class="container">
	<div class="d-flex justify-content-between">
		<h1>Click-Go Board 👨‍💻👩‍💻</h1>
		<div class="spinner-border text-muted"></div>
		<div class="spinner-border text-primary"></div>
		<div class="spinner-border text-success"></div>
		<div class="spinner-border text-info"></div>
		<div class="spinner-border text-warning"></div>
		<div class="spinner-border text-danger"></div>
		<div class="spinner-border text-secondary"></div>
		<div class="spinner-border text-dark"></div>
		<div class="spinner-border text-light"></div>
		<form class="form-inline" action="/board/board-write-form">
			<button type="submit" class="btn btn-outline-success" id="btn--write">글쓰기</button>
		</form>
	</div>

	<div class="d-flex">
		<div class="input-group mt-5 mb-5  justify-content-end">
			<form action="/board/search" class="form-inline" method="get">
				<div class="input-group-append">
					<input type="text" class="form-control mr-2" placeholder="검색" name="q" value="${q }">
					<button class="btn btn-outline-dark" type="submit">검색</button>
				</div>
			</form>
		</div>
	</div>



	<div class="d-flex justify-content-between">
		<p>번호</p>
		<p>제목</p>
		<p>글쓴이</p>
		<p>등록시간</p>
	</div>
	<c:forEach var="board" items="${boards.content}">
	
		<div class="d-flex justify-content-between">
			<div class="d-flex justify-content-between">
				<ul class="list-group list-group-flush ">
					<li class="list-group-item d-flex justify-content-start">
						<p class="text-danger">
							<small>${board.id }</small>
						</p> <a href="/board/${board.id }" class="col"><small>${board.title}</small> </a>
						<p class="text-danger">
							<small>${board.user.username }</small>
						</p>
						<p>
							<small>${board.createDate }</small>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</c:forEach>

	<%-- <c:forEach var="board" items="${boards.content}">
		<div class="container mb-5">
			<div class=" row d-flex justify-content-center">
				<div class="col">
					<p class="text-danger"><small>글번호 : ${board.id }</small></p>
					<a href="/board/${board.id }" class="col">, 제목 :${board.title }, 작성시간 : ${board.createDate } </a>
					<p class="text-danger">
						<small>, 작성자 : ${board.user.username }</small>
					</p>
				</div>
			</div>
		</div>
	</c:forEach> --%>


	<ul class="pagination justify-content-center">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotDisabled" value=""></c:set>
		<li class="page-item ${boards.first ? isDisabled : isNotDisabled } "><a class="page-link" href="?page=${boards.number - 1 }">이전</a></li>
		<!-- 반복문 처리 하기-->
		<!-- 1 2 3, 1 2 3 4 , 1 2 3 4 5  -->
		<c:forEach var="num" items="${pageNumbers }">
			<c:choose>
				<c:when test="${nowPage eq num }">
					<!-- http://localhost:9090/board/search?q=%EC%95%84%EB%8B%88 -->
					<!-- 0 부터 시작 컨트롤러에서 +1 -->
					<li class="page-item active"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?q=${q }&page=${num - 1 }">${num }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<li class="page-item ${boards.last ? isDisabled : isNotDisabled }"><a class="page-link" href="?page=${boards.number + 1 }">다음</a></li>

	</ul>




</div>















<%@ include file="../layout/footer.jsp"%>




