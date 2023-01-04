<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container" id="terms" style="height: 100vh">
	<div id="view-more-title">
		<div>📝 1:1 문의</div>
	</div>
	<br>


	<div class="d-flex" id="ooo-body" style="background-color: pink">
		<div class="container" id="tab-menu">
			<div id="tab-btn" class="d-flex">
				<ul>
					<li class="active"><a href="#">나의 문의 내역</a></li>
					<li><a href="#">새 문의 작성</a></li>
				</ul>
			</div>
			<div id="tab-cont">
				<div id="tab-cont-1">
						<div></div>



				</div>
				<div id="tab-cont-2">
					<div>
						<form action="/admin/one-on-one/save" method="post">
							<input type="hidden" id="id" value="${principal.user.id }">
							<div>
								<p>클릭고 이용 중 불편하신 점을 문의주시면 최대한 빠른 시일내에 답변 드리겠습니다.</p>
							</div>
							<section class="d-flex flex-column">
								<span>카테고리 유형</span>
								<div>
									<select class="">
										<option value="">카테고리유형을선택하랑께</option>
										<option value="1">PC방</option>
										<option value="2">노래방</option>
										<option value="3">당구장</option>
									</select>
								</div>
								<span>문의 유형</span>
								<div>
									<select name="room_type" id="" class="select_type_2">
										<option value="">카테고리유형을 선택하세요</option>
										<option value="1">모텔</option>
										<option value="2">호텔·리조트</option>
										<option value="3">펜션</option>
										<option value="4">게스트하우스</option>
										<option value="5">캠핑/글램핑</option>
										<option value="6">한옥</option>
										<option value="7">액티비티</option>
										<option value="8">현금성(유상)포인트</option>
									</select>
								</div>

								<div>
									<span>휴대폰 번호</span>
									<p>
										<input class="js-phone-number" data-type="phoneNumber" type="tel" maxlength="11" name="" value="" placeholder="선택사항입니다.">
									</p>
								</div>

								<div>
									<span>이메일</span>
									<p>
										<input data-email-validate="" class="js-email-string" type="email" value="" name="uemail" placeholder="선택사항입니다.">
									</p>
								</div>
							</section>
							<section class="text_wrap">
								<b>문의내용</b>
								<div>
									<textarea name="content" id="questionTextarea"></textarea>
									<ul class="placeholder_txt" style="display: block;">
										<li>문의하실 내용을 10자 이상 입력해 주세요.</li>
										<li>문의하시는 제휴점 이름과 예약정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
										<li>문의 내용 작성 시 개인정보가 입력되지 않도록 주의 부탁드립니다.</li>
									</ul>
								</div>
							</section>
							<button class="btn btn-light" type="submit">작성 완료</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>


</div>



<br>


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






<%@ include file="../layout/footer.jsp"%>

