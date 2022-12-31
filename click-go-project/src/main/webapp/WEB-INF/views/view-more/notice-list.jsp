<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container">

	<div class="border-bottom">
		<h1>공지사항</h1>
		<div class="spinner-grow text-info"></div>
	</div>

	<br>
	<br>
	
	<div>
		<div id="accordion">

			<div class="card">
				<div class="card-header">
					<a class="card-link" data-toggle="collapse" href="#collapseOne"> 제 1차 Click-Go 응원하기 이벤트</a>
				</div>
				<div id="collapseOne" class="collapse" data-parent="#accordion">
					<div class="card-body">궁금했어?</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">[안내] 서비스 점검 안내 (1월3일 03:00 ~ 05:00) </a>
				</div>
				<div id="collapseTwo" class="collapse" data-parent="#accordion">
					<div class="card-body">궁금했어?</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree"> 클릭고 서비스 시작 안내 </a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body" style="color: red">궁금했어?</div>
				</div>
			</div>
		</div>
	</div>

</div>

<%@ include file="../layout/footer.jsp"%>





