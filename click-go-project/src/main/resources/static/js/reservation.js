
let index = {
	init: function() {
		let size = $("#reservation-size").val();
		let address = $("#store-address").val();
		let storeName = $("#store-name").val();
		for (var i = 1; i <= size; i++) {
			let id = $(`#reservation-id-${i}`).val();
			$("#btn--approve-reservation-" + i).bind("click", () => {
				this.approve(id);
			});
		};
		addMap(address, storeName);
	},

	approve: function(id) {
		$.ajax({
			type: 'GET',
			url: `/api/reservation/approve/${id}`,
		}).done(function(data) {
			alert(data.body);
			if (data.httpStatus) {
				$(`#btn--approve-reservation-${id}`).remove();
				$(`#btn--reject-reservation-${id}`).remove();
				$(`#btn--reject-reservation-${id}`).remove();
			}
		}).fail(function(error) {
			console.log(error);
		});
	}
};

function timeCheck() {
	let storeId = $("#storeId").val();
	let data = {
		startTime: $("#startTime").val(),
		endTime: $("#endTime").val(),
		startDate: $("#startDate").val(),
		endDate: $("#endDate").val()
	};
	$.ajax({
		type: 'post',
		url: `/api/reservation/time-check/${storeId}`,
		data: JSON.stringify(data),
		contentType: "application/json; charset=UTF-8",
		dataType: "json"
	}).done(function(data) {
		if (data.httpStatus == true) {
			closeSeats(data.body);
		} else {
			alert(data.body);
		}
	}).fail(function(error) {
		alert("예상치 못한 오류가 발생하였습니다. 관리자에게 문의해주세요.");
	});
};

function closeSeats(closeSeats) {
	let closeSeatsToMap = new Map(Object.entries(closeSeats));
	let totalRoomCount = closeSeatsToMap.get("totalRoomCount");
	console.log('자리 닫힘');
	for (let i = 0; i < totalRoomCount; i++) {

		$("#" + i).attr("disabled", null);
		for (seat of closeSeatsToMap.get("seats")) {
			console.log(seat);
			if (seat == i) {
				$("#" + i).attr("disabled", "disabled");
			};
		};
	};
};

function addMap(storeAddress, storeName) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	var map = new kakao.maps.Map(mapContainer, mapOption);

	var geocoder = new kakao.maps.services.Geocoder();

	geocoder.addressSearch(storeAddress, function(result, status) {

		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			var infowindow = new kakao.maps.InfoWindow({
				content: `<div style="width:150px;text-align:center;padding:6px 0;">${storeName}</div>`
			});
			infowindow.open(map, marker);
			map.setCenter(coords);
		}
	});
};

index.init();

