let index = {
	init: function() {

		let msgSizeData = $("#msgSize").val();

		for (var i = 0; i < msgSizeData; i++) {
			let userId = $("#userId" + i).text();
			let userName = $("#userName" + i).text();
			let franchiseId = $("#franchiseId" + i).text();
			let catagory = $("#catagory" + i).text();
			let storeName = $("#storeName" + i).text();
			let storeTel = $("#storeTel" + i).text();
			let storeAddress = $("#storeAddress" + i).text();
			$("#btn--store-franchise-approve-" + i).bind("click", () => {
				this.approve(userId, userName, franchiseId, catagory, storeName, storeTel, storeAddress);
			});
		}
	},

	approve: function(userId, userName, franchiseId, catagory, storeName, storeTel, storeAddress) {
		let data = {
			id: franchiseId,
			category: catagory,
			storeName: storeName,
			storeAddress: storeAddress,
			storeTEL: storeTel,
			userId: userId,
		}

		$.ajax({
			type: 'POST',
			url: '/api/store-franchise/approve/' + data.id + "/" + data.userId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json",

		}).done(function(data) {
			if (data.httpStatus == true) {
				alert("등록완료!");
				location.href = "/storeFranchise/store-franchise-message";
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