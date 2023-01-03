<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1&libraries=services,clusterer,drawing"></script>

<div class="d-flex justify-content-center">
	<div id="map" style="width: 1200px; height: 600px;"></div>
</div>

<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);

	var places = new kakao.maps.services.Places();

	 var callback = function(result, status) {
	 console.log('쌉 가능');
	 if (status === kakao.maps.services.Status.OK) {
	 console.log(result);
	 }
	 };

	 console.log('쌉 가능!');
	 places.keywordSearch('판교 치킨', callback); 
</script>

<%@ include file="../layout/footer.jsp"%>