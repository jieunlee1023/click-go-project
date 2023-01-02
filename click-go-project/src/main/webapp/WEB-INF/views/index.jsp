<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header-fixed.jsp"%>


<div id="full-page">

<div class="section s0 ">
<a href="/storeFranchise/store-franchise-apply"  id="franchise-btn">
	<img src="/image/index/franchise-btn.png" width="200px">
</a>
	<div class="container mt-5">
		<div id="main--item">
				<div id="main--text">
					<img src="/image/index/textImg1.png" width="500px" >
					<br>
					<div class="main--text--add">100만명 이상이 선택한 클릭고,</div>
					<div class="main--text--add">업계 최다 예약 가맹점 보유 중! </div>
					<div class="main--text--add2">(2022년 12월 기준)</div>
				</div>
			<div id="main--img"><img src="/image/index/computer.png" width="500px"></div>
		</div>
	</div>
</div>

	
	
<div class="section s1">		
	<div class="container mt-5">
			<div id="main--item">
					<div id="main--text">
						<img src="/image/index/textImg2.png" width="500px" >
						<br>
							<div class="main--text--add">장소에 도착해서 기다리지 않아도 돼요.</div>
							<div class="main--text--add">그냥 내자리 이미 준비 완료!</div>
					</div>
				<div id="main--img2"><img src="/image/index/billiards.png"  width="500px" ></div>
			</div>
	</div>
</div>


<div class="section s2">
	<div class="container mt-5">
			<div id="main--item">
						<div id="main--text">
							<img src="/image/index/textImg3.png" width="500px" >
							<br>
								<div class="main--text--add">회식은 노래방!</div>
								<div class="main--text--add">미리미리 예약을 해두는 시스템!</div>
								<div class="main--text--add">오늘은 내가 인기만점.</div>
						</div>
					<div id="main--img3"><img src="/image/index/singing.png"  width="500px"></div>
			</div>
	</div>
</div>

<div class="section s3">
	<div class="container mt-5">
			<div id="main--item">
						<div id="main--text">
							<img src="/image/index/textImg4.png" width="500px" >
							<br>
							<div class="main--text--add">집에서 예약하고 도착하면 준비완료!</div>
							<div class="main--text--add">이제 클릭고에서 생생하게 경험하세요.</div>
						</div>
					<div id="main--img4"><img src="/image/index/bowling.png" width="480px"></div>
			</div>
	</div>
</div>
<div class="section s4">
	<div class="container mt-5">
			<div id="main--item">
						<div id="main--text">
							<img src="/image/index/textImg5.png" width="500px" >
							<br>
							<div class="main--text--add">각종 신용카드는 물론,</div>
							<div class="main--text--add">카카오페이까지 결제 가능!</div>
						</div>
					<div id="main--img5"><img src="/image/index/payment.png" width="500px"></div>
			</div>
	</div>
</div>

	<div class="section s5">
		<div class="container d-flex mb-5 justify-content-center">
		<img src="/image/logo.png" width="300px">	</div>
	<%@ include file="layout/footer.jsp"%>		
	</div>
</div>

<div id="footer">
	<img id="footer--scroll" src="/image/index/scroll.png" width="80px">
</div>

<script>
	new fullpage('#full-page',
			{
				fixedElements: '#header-fixed',
				licenseKey : 'gplv3-license',
				sectionsColor : [ '#b4c8ff', '#b4c8ff', '#b4c8ff', '#b4c8ff','#b4c8ff','#b4c8ff'  ],
				navigation : true,
				scrollingSpeed : 1000,

				onLeave : function(origin, destination, direction) {
					//console.log('onleave', origin.index, destination.index);
					if (origin.index == 5) {
						$('#footer--scroll').show();
						$('#header-fixed').show();
					} 
				},
				afterLoad : function(origin, destination, direction) {
					//console.log('afterLoad');
					console.log(destination);
					if (destination.index == 1) {	
					    $(".s1").ready(function(e){
					        $("#main--img2").animate({ top : "10px" },700);
					      });
					} else if (destination.index == 2){
						 $(".s2").ready(function(e){
						     $("#main--img3").animate({ top : "10px" },700);
						      });
					}else if (destination.index == 3){
						 $(".s2").ready(function(e){
						     $("#main--img4").animate({ top : "10px" },700);
						      });
					}else if (destination.index == 4){
						 $(".s2").ready(function(e){
						     $("#main--img5").animate({ top : "10px" },700);
						      });
					}else if (destination.index == 5){
						$('#footer--scroll').hide();
						$('#header-fixed').hide();
					}
				},
			});
    $(".s0").ready(function(e){
        $("#main--img").animate({ top : "10px" },700);
      });

	
</script>


<div id="fullpage">
	<div class="section">Some section</div>
	<div class="section">Some section</div>
	<div class="section">Some section</div>
	<div class="section">Some section</div>
</div>



