<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<br>
<div class="container">





	<div class="container" id="reservation">
		<div id="view-more-title">
			<div>๐ ์ ์  ๋ณ ๊ฐ์ ํต๊ณ</div>
			<br>
		</div>
		<hr>
	</div>
	<div class="container d-flex">
		<div class="nav--list">
			<ul>
				<li id="more--view"><a class="nav-link" href="#">๊ฐ๊ฒ๋ณ</a>
					<ul id="nave--moreview--item">
						<li><a class="dropdown-item" href="/admin/chart/store/sales/this-month">์ ๋งค์ถ ํต๊ณ</a></li>
						<li><a class="dropdown-item" href="/admin/chart/store/sales/this-year">์ฐ ๋งค์ถ ํต๊ณ</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="nav--list">
			<ul>
				<li id="more--view"><a class="nav-link" href="#">์นดํ๊ณ ๋ฆฌ๋ณ</a>
					<ul id="nave--moreview--item">
						<li><a class="dropdown-item" href="/admin/chart/category/sales/this-month">์ ๋งค์ถ ํต๊ณ</a></li>
						<li><a class="dropdown-item" href="/admin/chart/category/sales/this-year">์ฐ ๋งค์ถ ํต๊ณ</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="nav--list">
			<ul>
				<li><a class="nav-link" href="/admin/chart/signup-stats/this-month">๊ฐ์ํํฉ</a>
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
	// ์๊ฐํ API ๋ฐ ์ฝ์ด ์ฐจํธ ํจํค์ง๋ฅผ ๋ก๋ํฉ๋๋ค.
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	// Google ์๊ฐํ API๊ฐ ๋ก๋๋  ๋ ์คํํ  ์ฝ๋ฐฑ์ ์ค์ ํฉ๋๋ค.
	google.charts.setOnLoadCallback(drawGuestMonthChart);

	// ๋ฐ์ดํฐ ํ์ด๋ธ์ ์์ฑํ๊ณ  ์ฑ์ฐ๋ ์ฝ๋ฐฑ,
	// ํ์ด ์ฐจํธ๋ฅผ ์ธ์คํด์คํํ๊ณ  ๋ฐ์ดํฐ๋ฅผ ์ ๋ฌํฉ๋๋ค
	// ๊ทธ๋ ค๋ด์.
	function drawGuestMonthChart() {

		var data = google.visualization.arrayToDataTable([ [ '', 'count' ],
				[ '์ด๋ฒํด ๊ฒ์คํธ ๊ฐ์์', Number(`${guestYearStatsCount}`) ],
				[ '์ด๋ฒํด ํธ์คํธ ๊ฐ์์', Number(`${hostYearStatsCount}`) ],
				[ '์ด๋ฒ๋ฌ ๊ฒ์คํธ ๊ฐ์์', Number(`${guestMonthStatsCount}`) ],
				[ '์ด๋ฒ๋ฌ ํธ์คํธ ๊ฐ์์', Number(`${hostMonthStatsCount}`) ],

		]);

		// ์์ ๋ณ๊ฒฝ ๋ฐฉ๋ฒ ์์๋ณด๊ธฐ
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

