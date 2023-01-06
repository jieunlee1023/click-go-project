
// btn--save
let index = {
	init: function() {
		$("#btn--save").bind("click", () => {
			this.save();
		});
	},
	save: function() {
		let storeId = $("#storeId").val();
		let userId = $("#userId").val();
		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
		};
		$.ajax({
			type: 'post',
			url: `/api/report/save/${storeId}/${userId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus) {
				alert(data.body);
				location.href = '/report/list/0';
			} else {
				alert(data.body);
			}
		}).fail(function(error) {
			alert(error);
		});
	}
};

index.init();