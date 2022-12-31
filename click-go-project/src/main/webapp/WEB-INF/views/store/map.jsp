<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1&libraries=services,clusterer,drawing"></script>
<%@ include file="../layout/footer.jsp"%>