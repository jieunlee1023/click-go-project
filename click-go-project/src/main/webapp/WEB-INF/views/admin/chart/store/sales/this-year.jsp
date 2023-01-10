<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../../layout/header.jsp"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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
		};

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows(list);

		var options = {
			'title' : '가게들의 올해 매출 (원)',
			'width' : 1000,
			'is3D' : true,
			'height' : 1000
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart--this-year'));
		chart.draw(data, options);
	}
</script>

<div class="container">
	<div class="container m-5">
		<h1>가게별 올해의 통계</h1>
	</div>
	<br> <br> <br> <br>

	<div class="d-flex justify-content-center">
		<div class="d-flex flex-column">
			<div class="d-flex">
				<div class="d-flex justify-content-center">
					<div class="nav--list">
						<ul id="nav--item">
							<li id="more--view"><a class="nav-link" href="#">가게별</a>
								<ul id="nave--moreview--item">
									<li><a class="dropdown-item"
										href="/admin/chart/store/sales/today">오늘의 통계</a></li>
									<li><a class="dropdown-item"
										href="/admin/chart/store/sales/this-month">이번달의 통계</a></li>
									<li><a class="dropdown-item"
										href="/admin/chart/store/sales/this-year">올해의 통계</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<div class="d-flex">
				<div class="d-flex justify-content-center">
					<div class="nav--list">
						<ul id="nav--item">
							<li id="more--view"><a class="nav-link" href="#">카테고리별</a>
								<ul id="nave--moreview--item">
									<li><a class="dropdown-item" href="/admin/chart/category/sales/today">오늘의 통계</a></li>
									<li><a class="dropdown-item" href="/admin/chart/category/sales/this-year">이번달의 통계</a></li>
									<li><a class="dropdown-item" href="/admin/chart/category/sales/this-year">올해의 통계</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-between" id="chart--this-year"></div>
	</div>
</div>
<%@ include file="../../../../layout/footer.jsp"%>