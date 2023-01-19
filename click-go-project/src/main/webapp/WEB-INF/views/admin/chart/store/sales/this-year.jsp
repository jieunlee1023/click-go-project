<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../../layout/header.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	google.charts.setOnLoadCallback(drawThisYearChart);

	function drawThisYearChart() {

		let myData = JSON.parse(`${thisYearSales}`);

		let list = new Array();
		for (var i = 0; i < myData.length; i++) {
			let help = new Array();
			help.push(myData[i].storeName, myData[i].price);
			list.push(help);
		}
		;

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows(list);

		var options = {
			'is3D' : true,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart--this-year'));
		chart.draw(data, options);
	}
</script>


<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>📈 가게별 연 매출</div>
		<br>
	</div>
	<hr>
</div>
<div class="container d-flex">
	<div class="nav--list">
		<ul>
			<li id="more--view"><a class="nav-link" href="#">가게별</a>
				<ul id="nave--moreview--item">
					<li><a class="dropdown-item" href="/admin/chart/store/sales/this-month">월 매출 통계</a></li>
					<li><a class="dropdown-item" href="/admin/chart/store/sales/this-year">연 매출 통계</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="nav--list">
		<ul>
			<li id="more--view"><a class="nav-link" href="#">카테고리별</a>
				<ul id="nave--moreview--item">
					<li><a class="dropdown-item" href="/admin/chart/category/sales/this-month">월 매출 통계</a></li>
					<li><a class="dropdown-item" href="/admin/chart/category/sales/this-year">연 매출 통계</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="nav--list">
		<ul>
			<li><a class="nav-link" href="/admin/chart/signup-stats/this-month">가입현황</a>
		</ul>
	</div>
</div>
<div class="d-flex justify-content-center">
	<div id="chart--this-year" style="width: 90%; height: 800px;"></div>
</div>
<%@ include file="../../../../layout/footer.jsp"%>