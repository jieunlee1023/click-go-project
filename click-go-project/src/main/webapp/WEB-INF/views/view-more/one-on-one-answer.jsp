<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<div class="container">
	<div id="ooo-header">
		<h1>문의 답변 페이지</h1>


		<div>
			<p>문의하신 제목 :</p>
			<p>>>>${oooAnswer.title }</p>
		</div>

		<div>
			<p>문의하신 내용 :</p>
			<p>>>> ${oooAnswer.content }</p>
		</div>

		이거하는중 01-05
		<div>
			<p>문의하신 내용의 답변입니다</p>
		</div>
	</div>

	<div id="ooo-body">

		<div id="accordion">
			<div class="card">
				<div class="card-header">
					<a class="card-link" data-toggle="collapse" href="#collapseOne"> Collapsible Group Item #1 </a>
				</div>
				<div id="collapseOne" class="collapse show" data-parent="#accordion">
					<div class="card-body">
						sadadad
					
					</div>
				</div>
			</div>



		</div>

	</div>

















	<%@ include file="../layout/footer.jsp"%>