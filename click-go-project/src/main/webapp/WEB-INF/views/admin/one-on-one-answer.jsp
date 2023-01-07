<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<div class="container"></div>
<div id="ooo-header">
	<h1>문의 답변 페이지</h1>


	<div>
		<p>문의하신 제목 :</p>
		<p>제목>>>${ooo.title }</p>
	</div>

	<div>
		<p>문의하신 내용 :</p>
		<p>내용 >>> ${ooo.content }</p>
	</div>
	<div>
		<form action="/admin/one-on-one-answer" method="post">
			<input type="hidden" value="${ooo.id}" name="oooId"> <input type="hidden" value="${principal.user.id }" name="adminId">
			<c:if test="${principal.user.role eq 'ADMIN' }">
				<textarea name="content" rows="5" cols="5">
					${adminContent }
			</textarea>
				<button type="submit">삥뽕</button>
			</c:if>


			<c:forEach var="oooa" items="${oooaList }">
				<c:if test="${ooo.id eq oooa.ooo.id }">

					<div>답변 : : : : ${oooa.content }</div>
				</c:if>
			</c:forEach>
		</form>

	</div>

</div>
<div id="ooo-body">

	<div id="accordion">
		<div class="card">
			<div class="card-header">
				<a class="card-link" data-toggle="collapse" href="#collapseOne"> Collapsible Group Item #1 </a>
			</div>
			<div id="collapseOne" class="collapse show" data-parent="#accordion">
				<div class="card-body">sadadad</div>
			</div>
		</div>



	</div>

</div>

















<%@ include file="../layout/footer.jsp"%>