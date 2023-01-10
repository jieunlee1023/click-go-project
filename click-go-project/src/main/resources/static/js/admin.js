let admin = {
	plus: function(id) {
		let data = {
			id: $(`#user--id-${id}`).text(),
			reportCount: $(`#user--reportCount-${id}`).text(),
		}

		$.ajax({
			type: 'post',
			url: '/admin/reportCountPlus',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			console.log(data);
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: data.body,
				}).then(function() {
					location.href = "/admin/user";
				});
			}
		}).fail(function(error) {
			console.log("오류가 발생했습니다. 관리자에게 문의해주세요.");
			Swal.fire({
				icon: 'error',
				text: error.responseText,
			});
		});
	},

	minus: function(id) {
		let data = {
			id: $(`#user--id-${id}`).text(),
			reportCount: $(`#user--reportCount-${id}`).text(),
		}

		$.ajax({
			type: 'post',
			url: '/admin/reportCountMinus',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			console.log(data);
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: data.body,
				}).then(function() {
					location.href = "/admin/user";
				});
			}
		}).fail(function(error) {
			console.log("오류가 발생했습니다. 관리자에게 문의해주세요.");
			Swal.fire({
				icon: 'error',
				text: error.responseText,
			});
		});
	}
}
