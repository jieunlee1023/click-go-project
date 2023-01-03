
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
			endTime: $("#endTime").val()
		};
		$.ajax({
			type: 'post',
			url: `/api/reservation/time-check/${storeId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus == true) {
				alert("현 시간대에는 " + data.body + "개의 자리가 남아있습니다.");
			}
		}).fail(function(error) {
				alert("예상치 못한 오류가 발생하였습니다. 관리자에게 문의해주세요.");
		});
	}
};

index.init();

