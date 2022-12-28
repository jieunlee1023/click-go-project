let index = {
	init: function() {
		$("#btn--store--apply").bind("click", () => {
			this.save();
		});
	},

	save: function() {
		let data = {
			category: $("#category").val(),
			storeName: $("#storeName").val(),
			storeAddress: $("#storeAddress").val(),
			storeTEL: $("#storeTEL").val(),
			storeLicense: $("#storeLicense").val(),
		};

		console.log(data);
		
		$.ajax({
			type: 'post',
			url: '/api/store/apply',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			console.log(">>"+data);
			if (data.httpStatus == true) {
				alert(data.body);
				//location.href = "/";
			} else {
				alert("실패");
			}
		}).fail(function(error) {
			console.log(error);
			alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
		});

	},

}

index.init();