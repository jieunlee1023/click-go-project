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

		let list = new Array();
		list.push([ '일주일', '매출' ]);
		for (var i = 0; i < myData.length; i++) {
			let help = new Array();
			help.push(myData[i].reservationDate, myData[i].price);
			list.push(help);
		}
		;
		var data = google.visualization.arrayToDataTable(list);

		var options = {
			curveType : 'function',
			legend : {
				position : 'bottom'
			},
			title : '일주일 매출',
			width : 1500,
			height : 900
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>
<div class="container">
	<div class="container m-5">
		<h1>통계</h1>
	</div>
	<br> <br> <br> <br>

	<div class="d-flex justify-content-center">
		<div class="d-flex">
			<div class="d-flex justify-content-center">
				<a class="dropdown-item" href="/store/chart/today">오늘의 통계</a><a
					class="dropdown-item" href="/store/chart/week/">일주일 통계</a>
			</div>
			<br> <br> <br>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div id="curve_chart"></div>
	</div>
</div>

<%@ include file="../../../layout/footer.jsp"%>