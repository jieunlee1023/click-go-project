<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		let myData = JSON.parse(`${mySalesOfMonth}`);

		let list = [ [ '일일', '매출' ] ];
		for (var i = 0; i < myData.length; i++) {
			let help = new Array();
			help.push(myData[i].month, myData[i].price);
			list.push(help);
		}
		;

		var data = google.visualization.arrayToDataTable(list);
		var options = {
			title : 'Click Go 일일 매출액 (원)',
			hAxis : {
				title : '일일',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>



<br>
<div class="container" id="reservation">
	<div id="view-more-title">
		<div>
			📊 통계보기 <a id="btn--back" class="btn" href="./main">돌아가기</a>
		</div>
		<br>
	</div>
<hr>
</div>
<div class="container d-flex">
	<div class="nav--list">
		<ul>
			<li id="more--view"><a class="nav-link" href="#">가게별</a>
				<ul id="nave--moreview--item">
					<li><a class="dropdown-item"
						href="/admin/chart/store/sales/this-month">월 매출 통계</a></li>
					<li><a class="dropdown-item"
						href="/admin/chart/store/sales/this-year">연 매출 통계</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="nav--list">
		<ul>
			<li id="more--view"><a class="nav-link" href="#">카테고리별</a>
				<ul id="nave--moreview--item">
					<li><a class="dropdown-item"
						href="/admin/chart/category/sales/this-month">월 매출 통계</a></li>
					<li><a class="dropdown-item"
						href="/admin/chart/category/sales/this-year">연 매출 통계</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="nav--list">
		<ul>
			<li id="more--view"><a class="nav-link" href="#">가입현황</a>
				<ul id="nave--moreview--item">
					<li><a class="dropdown-item"
						href="#">Host 월 통계</a></li>
					<li><a class="dropdown-item"
						href="#">Host 연 통계</a></li>
					<li><a class="dropdown-item"
						href="#">Guest 월 통계</a></li>
					<li><a class="dropdown-item"
						href="#">Guest 연 통계</a></li>
				</ul></li>
		</ul>
	</div>
</div>
<div class="d-flex justify-content-center">
<div id="chart_div" style="width: 90%; height: 800px;"></div>
</div>

<%@ include file="../../layout/footer.jsp"%>

