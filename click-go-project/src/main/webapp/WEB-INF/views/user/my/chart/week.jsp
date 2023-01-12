<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		let myData = JSON.parse(`${strStoreSales}`);
		console.log(myData);

		let list = new Array();
		list.push([ '일주일', '매출' ]);
		for (var i = 0; i < myData.length; i++) {
			let help = new Array();
			help.push(myData[i].reservationDate, myData[i].price);
			console.log(help);
			list.push(help);
		}
		;
		var data = google.visualization.arrayToDataTable(list);

		var options = {
			curveType : 'function',
			legend : {
				position : 'bottom'
			},
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>



<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>📈 매출 통계</div>
	</div>
		<span>가맹점주님의 번창을 기원합니다!</span>
		<br>
	<hr>
</div>
<div class="container d-flex">
	<a class="" href="/store/chart/today" style="text-decoration: none; color: black; margin: 5px;">오늘의 통계</a>
	<a
		class="" href="/store/chart/week/"  style="text-decoration: none; color: black; margin: 5px;">일주일 통계</a>
</div>
<div class="d-flex justify-content-center">
	<div id="curve_chart" style="width: 90%; height: 500px;"></div>
</div>

<br><br><br>

<%@ include file="../../../layout/footer.jsp"%>