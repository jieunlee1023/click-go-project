<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<br>
<div class="container">





	<div class="container" id="reservation">
		<div id="view-more-title">
			<div>π μ μ  λ³ κ°μ ν΅κ³</div>
			<br>
		</div>
		<hr>
	</div>
	<div class="container d-flex">
		<div class="nav--list">
			<ul>
				<li id="more--view"><a class="nav-link" href="#">κ°κ²λ³</a>
					<ul id="nave--moreview--item">
						<li><a class="dropdown-item" href="/admin/chart/store/sales/this-month">μ λ§€μΆ ν΅κ³</a></li>
						<li><a class="dropdown-item" href="/admin/chart/store/sales/this-year">μ° λ§€μΆ ν΅κ³</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="nav--list">
			<ul>
				<li id="more--view"><a class="nav-link" href="#">μΉ΄νκ³ λ¦¬λ³</a>
					<ul id="nave--moreview--item">
						<li><a class="dropdown-item" href="/admin/chart/category/sales/this-month">μ λ§€μΆ ν΅κ³</a></li>
						<li><a class="dropdown-item" href="/admin/chart/category/sales/this-year">μ° λ§€μΆ ν΅κ³</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="nav--list">
			<ul>
				<li id="more--view"><a class="nav-link" href="#">κ°μνν©</a>
					<ul id="nave--moreview--item">
						<li><a class="dropdown-item" href="/admin/chart/signup-stats/this-month">μ ν΅κ³</a></li>
						<li><a class="dropdown-item" href="/admin/chart/signup-stats/this-year">μ° ν΅κ³</a></li>
					</ul></li>
			</ul>
		</div>
	</div>





	<div class="d-flex">
		<div class="signup-stats-chart" id="chart--year" ></div>
	</div>
</div>

<script type="text/javascript">
	// μκ°ν API λ° μ½μ΄ μ°¨νΈ ν¨ν€μ§λ₯Ό λ‘λν©λλ€.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Google μκ°ν APIκ° λ‘λλ  λ μ€νν  μ½λ°±μ μ€μ ν©λλ€.
	google.charts.setOnLoadCallback(drawGuestYearChart);

	// λ°μ΄ν° νμ΄λΈμ μμ±νκ³  μ±μ°λ μ½λ°±,
	// νμ΄ μ°¨νΈλ₯Ό μΈμ€ν΄μ€ννκ³  λ°μ΄ν°λ₯Ό μ λ¬ν©λλ€
	// κ·Έλ €λ΄μ.
	function drawGuestYearChart() {

		// λ°μ΄ν° νμ΄λΈμ λ§λ­λλ€.
		var data = new google.visualization.DataTable();

		var thisGuestCount = `${guestYearStatsCount}`;
		var thisHostCount = `${hostYearStatsCount}`;

		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([ [ 'μ΄λ²μ°λ κ²μ€νΈ κ°μμ', Number(`${guestYearStatsCount}`) ],
				[ 'μ΄λ²μ°λ νΈμ€νΈ κ°μμ', Number(`${hostYearStatsCount}`) ] ]);

		// μ°¨νΈ μ΅μ μ€μ 
		 var options = {
			'is3D' : true,
			
		};
 
		// λͺ κ°μ§ μ΅μμ μ λ¬νμ¬ μ°¨νΈλ₯Ό μΈμ€ν΄μ€ννκ³  κ·Έλ¦½λλ€.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart--year'));
		chart.draw(data, options);
	}
</script>

<%@ include file="../../../layout/footer.jsp"%>

