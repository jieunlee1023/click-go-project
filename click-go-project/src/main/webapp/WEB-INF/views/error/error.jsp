<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%><br>
<br>
<br>
<br>
<br>

<div class="d-flex justify-content-center">
	<h2>무언가 잘못된 요청인 것 같습니다.</h2>
</div>
<div class="d-flex justify-content-center">
	<h4>다시 한번 요청 부탁드립니다!</h4>
</div>
<br>
<div class="d-flex justify-content-center">
	<div>
		<img alt="에러" src="/image/error.png" width="300px">
	</div>
</div>
<br>
<div class="d-flex justify-content-center">
	<input type="button" value="이전으로 돌아가기" onClick="history.back()"
		style="background-color: rgb(0, 0, 0, 0.2); padding: 10px; border-radius: 20px; border: none;">
</div>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../layout/footer.jsp"%>