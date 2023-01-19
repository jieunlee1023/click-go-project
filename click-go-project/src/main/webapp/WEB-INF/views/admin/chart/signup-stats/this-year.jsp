<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<br>
<div class="container">





	<div class="container" id="reservation">
		<div id="view-more-title">
			<div>📉 유저 별 가입 통계</div>
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
				<li id="more--view"><a class="nav-link" href="#">가입현황</a>
					<ul id="nave--moreview--item">
						<li><a class="dropdown-item" href="/admin/chart/signup-stats/this-month">월 통계</a></li>
						<li><a class="dropdown-item" href="/admin/chart/signup-stats/this-year">연 통계</a></li>
					</ul></li>
			</ul>
		</div>
	</div>





	<div class="d-flex">
		<div class="signup-stats-chart" id="chart--year" ></div>
	</div>
</div>

<script type="text/javascript">
	// 시각화 API 및 코어 차트 패키지를 로드합니다.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Google 시각화 API가 로드될 때 실행할 콜백을 설정합니다.
	google.charts.setOnLoadCallback(drawGuestYearChart);

	// 데이터 테이블을 생성하고 채우는 콜백,
	// 파이 차트를 인스턴스화하고 데이터를 전달합니다
	// 그려봐요.
	function drawGuestYearChart() {

		// 데이터 테이블을 만듭니다.
		var data = new google.visualization.DataTable();

		var thisGuestCount = `${guestYearStatsCount}`;
		var thisHostCount = `${hostYearStatsCount}`;

		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([ [ '이번연도 게스트 가입수', Number(`${guestYearStatsCount}`) ],
				[ '이번연도 호스트 가입수', Number(`${hostYearStatsCount}`) ] ]);

		// 차트 옵션 설정
		 var options = {
			'is3D' : true,
			
		};
 
		// 몇 가지 옵션을 전달하여 차트를 인스턴스화하고 그립니다.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart--year'));
		chart.draw(data, options);
	}
</script>

<%@ include file="../../../layout/footer.jsp"%>

