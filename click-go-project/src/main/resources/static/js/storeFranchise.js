let index = {
	init: function() {
		$("#btn--store-franchise-apply").bind("click", () => {
			this.apply();
		});

		let msgSizeData = $("#msgSize").val();

		for (var i = 0; i < msgSizeData; i++) {
			console.log(i);
			let id = $("#franchiseId" + i).text();
			let userId = $("#userId" + i).text();
			$("#btn--store-franchise-approve-" + i).bind("click", () => {
				this.approve(id, userId);
			});
		}
	},

	apply: function() {
		let data = {
			category: $("#category").val(),
			storeName: $("#storeName").val(),
			storeAddress: $("#storeAddress").val(),
			storeTEL: $("#storeTEL").val(),
			storeLicense: $("#storeLicense").val(),
			userId: $("#principalUser").val(),
		};

		console.log(data);

		$.ajax({
			type: 'post',
			url: '/api/store-franchise/apply',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			console.log(">>" + data);
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

	approve: function(id, userId) {

		console.log(id, userId);

		$.ajax({
			type: 'DELETE',
			url: '/api/store-franchise/approve/' + id + "/" + userId,
		}).done(function(data) {
			console.log(">>" + data);
			if (data.httpStatus == true) {
				alert("등록완료!");
				//location.href = "/";
			} else {
				alert("실패");
			}
		}).fail(function(error) {
			console.log(error);
			alert("오류가 발생했습니다.");
		});

	},


}

index.init();