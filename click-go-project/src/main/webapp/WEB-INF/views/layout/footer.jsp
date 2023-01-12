<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="d-flex  text-center ">

		<div style="color:black; font-size: 13px;">

			<div>CS CENTER : CLICK_GO@GMAIL.COM</div>
			<div>WEEKDAYS 9AM-6PM</div>
			<div>LUNCH 1:00PM-2:00PM</div>
			<br>
			<div>CEO : 김경민, 이승원, 이지은, 조지훈</div>
			<div>2022-BUSAN-07777</div>
			<div>(47296) 668, Jungang-daero, Busanjin-gu, Busan, Korea</div>
			<br> <a>TERMS & CONDITION</a> <a> / </a> <a>GUIDE</a> <a>/ </a>
			<a>PRIVACY POLICY</a>
			<div>© CLICK-GO. ALL RIGHT RESERVED.</div>
		</div>
	</div>
</div>
<br><br>

<script>
function validateForm() {
	  var x = document.forms["join-form"]["username"].value;
	  if (x == "") {
	    alert("Name must be filled out");
	    return false;
	  }
	}
//언제 등록했는지 시간 확인
/* var postTime = new Date("${board.createDate}");
var currentTime = new Date();
var diff = currentTime - postTime;
var diffInSeconds = diff / 1000;
var diffInMinutes = diffInSeconds / 60;
var diffInHours = diffInMinutes / 60;

if (diffInSeconds < 60) {
    document.getElementById("time-ago").innerHTML = "방금전)";
} else if (diffInMinutes < 60) {
    document.getElementById("time-ago").innerHTML = Math.round(diffInMinutes) + " 분전)";
} else if (diffInHours < 24) {
    document.getElementById("time-ago").innerHTML = Math.round(diffInHours) + " 시간전)";
} */


var postTime = new Date("${board.createDate}");
var currentTime = new Date();
var diff = currentTime - postTime;
var diffInSeconds = diff / 1000;
var diffInMinutes = diffInSeconds / 60;
var diffInHours = diffInMinutes / 60;
var diffInDays = diffInHours / 24;
var timeAgo;

if (diffInSeconds < 60) {
    timeAgo = "방금전)";
} else if (diffInMinutes < 60) {
    timeAgo = Math.round(diffInMinutes) + "분전)";
} else if (diffInHours < 24) {
    timeAgo = Math.round(diffInHours) + "시간전)";
} else if(diffInDays < 1){
    timeAgo = Math.round(diffInDays) + "일 전)";
}

if(timeAgo) {
    document.getElementById("time-ago").innerHTML = timeAgo;
}
</script>

<!-- alert창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- 타이머  -->
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

</body>
</html>