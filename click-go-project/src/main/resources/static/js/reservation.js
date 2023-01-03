
let index = {
	init: function() {
		$("#btn--time-check").bind("click", () => {
			this.timeCheck();
		});
	},
	timeCheck: function() {
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
			}
		}).fail(function(error) {
			alert("예상치 못한 오류가 발생하였습니다. 관리자에게 문의해주세요.");
		});
	}
};

function closeSeats(closeSeats) {
	let closeSeatsToMap = new Map(Object.entries(closeSeats));
	let totalRoomCount = closeSeatsToMap.get("totalRoomCount");

	console.log(totalRoomCount[0] + '번 시작');
	for (let i = 0; i < totalRoomCount; i++) {
		console.log(i);

		$("#" + i).attr("disabled", null);
		for (seat of closeSeatsToMap.get("seats")) {
			console.log(seat);
			if (seat == i) {
				$("#" + i).attr("disabled", "disabled");
			};
		};
	};
};


index.init();

