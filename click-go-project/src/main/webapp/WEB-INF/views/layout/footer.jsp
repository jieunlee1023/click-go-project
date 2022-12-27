<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br>
<div class="d-flex jumbotron text-left "
	style="margin-bottom: 0; background-color: #b4cae8;">
	<div style="margin-right: 20px">
		<p style="color: #4e637f; margin-bottom: 10; font-size: 20px">Click-Go</p>
		<div style="font-size: 13px">
			<div>CS CENTER : CLICK_GO@GMAIL.COM</div>
			<div>WEEKDAYS 9AM-6PM</div>
			<div>LUNCH 1:00PM-2:00PM</div>
			<br>
			<div>CEO : 김경민, 이승원, 이지은, 조지훈</div>
			<div>2022-BUSAN-07777</div>
			<div>(47296) 668, Jungang-daero, Busanjin-gu, Busan, Korea</div>
			<br> <a href="#" style="color: grey">TERMS & CONDITION</a> <a>
				/ </a> <a href="" style="color: grey">GUIDE</a> <a>/ </a> <a href=""
				style="color: grey">PRIVACY POLICY</a>
			<div>© CLICK-GO. ALL RIGHT RESERVED.</div>
		</div>
	</div>

</div>
<script>
	$(document).ready(function() {
		let temp = $("#nowPage").val();
		console.log(temp);
		if (temp == "home") {
			$("#li--home").css("color", "black");
		} else if (temp == "about-us") {
			$("#li--about-us").css("color", "black");
		} else if (temp == "store") {
			$("#li--store").css("color", "black");
		} else if (temp == "board") {
			$("#li--board").css("color", "black");
		} else if (temp == "content") {
			$("#li--content").css("color", "black");
		}

		$(this).addClass('active');
		$(".nav-item > .active").css("color", "black");

	});
</script>


</body>
</html>