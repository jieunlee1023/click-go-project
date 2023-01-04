
let index = {
	init: function() {
		$("#btn--time-check").bind("click", () => {
			this.timeCheck();
		});
		let size = $("#reservation-size").val();

		for (var i = 1; i <= size; i++) {
			let id = $(`#reservation-id-${i}`).val();
			$("#btn--approve-reservation-" + i).bind("click", () => {
				this.approve(id);
			});
		}
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
				addButton();
			} else {
				alert(data.body);
			}
		}).fail(function(error) {
			alert("예상치 못한 오류가 발생하였습니다. 관리자에게 문의해주세요.");
		});
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

function closeSeats(closeSeats) {
	let closeSeatsToMap = new Map(Object.entries(closeSeats));
	let totalRoomCount = closeSeatsToMap.get("totalRoomCount");

	for (let i = 0; i < totalRoomCount; i++) {

		$("#" + i).attr("disabled", null);
		for (seat of closeSeatsToMap.get("seats")) {
			if (seat == i) {
				$("#" + i).attr("disabled", "disabled");
			};
		};
	};
};
function addButton() {
	let value = $("#btn--reservation").val();
	if (value == null) {
		let buttonElement = `	<button type="submit" id="btn--reservation">예약</button>
										<br>
										<span>예약 버튼을 누를 시 바로 결제화면으로 이동합니다.</span>`;
		$("#add--button").prepend(buttonElement);
	}

};


index.init();

