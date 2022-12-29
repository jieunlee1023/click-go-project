<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<div class="container d-flex-column justify-content-end">
	<div class="media border mt-3"
		style="width: 1000px; height: 70px; border-radius: 15px;">
		<div class="media-body">
			<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
				<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
					<h3 class="" style="font-weight: bold;">${report.title}</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="media border mt-3"
		style="width: 1000px; height: 350px; border-radius: 15px;">
		<div class="media-body">
			<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
				<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
					<h5 class="mr-3 m-1">${report.content}</h5>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../layout/footer.jsp"%>