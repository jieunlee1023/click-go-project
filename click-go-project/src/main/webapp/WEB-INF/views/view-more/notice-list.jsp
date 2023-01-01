<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container" id="notice">

	<div id="view-more-title">
		<div>* 공지사항 *</div>
	</div>
	<br>

	<div class="d-flex justify-content-center">
		<div id="Accordion_wrap">
			<div class="que" >
				<span>클릭고 서비스 시작 안내</span>
			</div>
			<div class="anw">
				<span>This is first answer.</span>
			</div>
			<div class="que">
				<span>[안내] 서비스 점검 안내 (1월3일 03:00 ~ 05:00)</span>
			</div>
			<div class="anw">
				<span>This is second answer.</span>
			</div>
			<div class="que">
				<span>제 1차 Click-Go 응원하기 이벤트</span>
			</div>
			<div class="anw">
				<span>This is third answer.</span>
			</div>
			<div class="que" >
				<span>클릭고 서비스 시작 안내</span>
			</div>
			<div class="anw">
				<span>This is first answer.</span>
			</div>
			<div class="que">
				<span>[안내] 서비스 점검 안내 (1월3일 03:00 ~ 05:00)</span>
			</div>
			<div class="anw">
				<span>This is second answer.</span>
			</div>
			<div class="que">
				<span>제 1차 Click-Go 응원하기 이벤트</span>
			</div>
			<div class="anw">
				<span>This is third answer.</span>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(".que").click(function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>

<%@ include file="../layout/footer.jsp"%>





