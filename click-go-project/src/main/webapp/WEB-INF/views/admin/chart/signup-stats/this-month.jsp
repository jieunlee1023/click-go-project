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
				<li><a class="nav-link" href="/admin/chart/signup-stats/this-month">가입현황</a>
			</ul>
		</div>
	</div>

	<br> <br> <br>


	<div class="d-flex justify-content-center">
		<div id="barchart_material" style="width: 900px; height: 500px;"></div>
	</div>


	<br> <br> <br>

</div>

<script type="text/javascript">
	// 시각화 API 및 코어 차트 패키지를 로드합니다.
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	// Google 시각화 API가 로드될 때 실행할 콜백을 설정합니다.
	google.charts.setOnLoadCallback(drawGuestMonthChart);

	// 데이터 테이블을 생성하고 채우는 콜백,
	// 파이 차트를 인스턴스화하고 데이터를 전달합니다
	// 그려봐요.
	function drawGuestMonthChart() {

		var data = google.visualization.arrayToDataTable([ [ '', 'count' ],
				[ '이번해 게스트 가입수', Number(`${guestYearStatsCount}`) ],
				[ '이번해 호스트 가입수', Number(`${hostYearStatsCount}`) ],
				[ '이번달 게스트 가입수', Number(`${guestMonthStatsCount}`) ],
				[ '이번달 호스트 가입수', Number(`${hostMonthStatsCount}`) ],

		]);

		// 색상 변경 방법 알아보기
		var options = {
				 series: {
			            0: { color: '#e2431e' },
			            1: { color: '#e7711b' },
			            2: { color: '#f1ca3a' },
			            3: { color: '#6f9654' },
			          }
		};

		var chart = new google.charts.Bar(document
				.getElementById('barchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));

	};
</script>

<%@ include file="../../../layout/footer.jsp"%>

