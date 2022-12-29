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
		<h1>클릭꼬 고객센터</h1>
		<form class="form-inline" action="/board/board-write-form">
			<button type="submit" class="btn btn-outline-info" id="btn--write">글쓰기</button>
		</form>
	</div>

	<div class="input-group mb-3">
		<form action="/board/search" class="form-inline" method="get">
			<div class="input-group-append">
				<input type="text" class="form-control" placeholder="검색" name="q" value="${q }">
				<button class="btn bg-secondary" type="submit">제목으로검색</button>
			</div>
		</form>
	</div>



	<c:forEach var="board" items="${boards.content}">
		<div class="list-group ">
			<div class="d-flex justify-content-between">
				<a href="/board/${board.id }" class="list-group-item list-group-item-action">글번호 : ${board.id }, 작성자 : ${board.user.username }, 제목 :
					${board.title }, 작성시간 : ${board.createDate } </a>
			</div>
		</div>
	</c:forEach>


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




