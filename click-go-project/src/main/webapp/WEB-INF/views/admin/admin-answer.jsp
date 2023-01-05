<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>





<div class="container">
	<div id="answer-header" style="background-color: orange">
		<h1>여긴헤드더</h1>
	</div>
	
	<div id="answer-body" style="background-color: pink">
		<c:if test="${principal.user.id eq userId }">
							<div>
								<c:forEach var="content" items="${contents }">
										하는중이거 
									<div>${content.content }</div>

								</c:forEach>
							</div>
						</c:if>
		<div class="d-flex justify-content-center">
			<p>zz</p>
		</div>
	</div>

</div>




















<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

