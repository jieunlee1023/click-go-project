<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container" id="terms">

	<div id="view-more-title">
		<div>* 약관 및 정책 *</div>
	</div>
	<br>


	<div class="container" id="tab-menu">
		<div id="tab-btn">
			<ul>
				<li class="active"><a href="#">이용약관</a></li>
				<li><a href="#">위치기반이용약관</a></li>
				<li><a href="#">개인정보 처리 방침</a></li>
				<li><a href="#">청소년 보호정책</a></li>
				<li><a href="#">소비자 분쟁해결 기준</a></li>
			</ul>
		</div>
		<div id="tab-cont">
			<div id="tab-cont-1">
				<div>1.이용약관</div>
				<div>2.</div>
				<div>3.</div>
				<div>4.</div>
				<div>5.</div>
			</div>
			<div id="tab-cont-2">
				<div>1.위치기반이용약관</div>
				<div>2.</div>
				<div>3.</div>
				<div>4.</div>
				<div>5.</div>
			</div>
			<div id="tab-cont-3">
				<div>1.개인정보 처리 방침</div>
				<div>2.</div>
				<div>3.</div>
				<div>4.</div>
				<div>5.</div>
			</div>
			<div id="tab-cont-4">
				<div>1.청소년 보호정책</div>
				<div>2.</div>
				<div>3.</div>
				<div>4.</div>
				<div>5.</div>
			</div>
			<div id="tab-cont-5">
				<div>1.소비자 분쟁해결 기준</div>
				<div>2.</div>
				<div>3.</div>
				<div>4.</div>
				<div>5.</div>
			</div>

		</div>
	</div>

</div>


<script type="text/javascript">
	var tabBtn = $("#tab-btn > ul > li"); //각각의 버튼을 변수에 저장
	var tabCont = $("#tab-cont > div"); //각각의 콘텐츠를 변수에 저장

	//컨텐츠 내용을 숨겨주세요!
	tabCont.hide().eq(0).show();

	tabBtn.click(function() {
		var target = $(this); //버튼의 타겟(순서)을 변수에 저장
		var index = target.index(); //버튼의 순서를 변수에 저장
		tabBtn.removeClass("active"); //버튼의 클래스를 삭제
		target.addClass("active"); //타겟의 클래스를 추가
		tabCont.css("display", "none");
		tabCont.eq(index).css("display", "block");
	});
</script>

<%-- <%@ include file="../layout/footer.jsp"%> --%>


