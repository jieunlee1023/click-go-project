<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="d-flex justify-content-center">
	<div id="map" style="width: 900px; height: 550px;"></div>
</div>

<script>
	var container = document.getElementById('map'), options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);

	// 스카이뷰
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 줌 컨트롤
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 교통 정보
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

	// 커서 변경
	//	map.setCursor('move');

	var geocoder = new kakao.maps.services.Geocoder();

	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
				console.log(result);				
			for(test in result) {
				console.log(test);				
			}
		}
	};

	geocoder.addressSearch('해남군 송지면', callback);
</script>


<%@ include file="../layout/footer.jsp"%>