let index = {
	init: function() {
		$("#btn--kakaopay").bind("click", () => {
			this.kakaopay();
		});
	},
	kakaopay: function() {
		let reservatinoCount = $("#reservationCount").val();
		let seats = new Array();
		for (let i = 0; i < reservatinoCount; i++) {
			seats.push($(`#reservationSeat-${i}`).text());
		}
		let storeId = $("#storeId").val();
		let data = {
			reservationDate: $("#startDate").text(),
			endDate: $("#endDate").text(),
			reservationTime: $("#startTime").text(),
			endTime: $("#endTime").text(),
			price: $("#price").text(),
		}
		$.ajax({
			type: 'post',
			url: `/api/reservation/kakaopay/ready/${storeId}/${seats}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus) {
				alert("카카오페이로 결제가 진행됩니다.");
				location.href = data.body;
			} else {
				alert("결제에 실패 했습니다. 관리자에게 문의해주세요.");
			}
		}).fail(function(error) {
			alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
		});
	},
}

index.init();