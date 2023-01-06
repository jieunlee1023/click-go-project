
let wishList = {
	init: function() {
		$(`#btn--wish-list`).bind("click", () => {
			this.save();
		});
	},
	save: function() {
		let id = $("#storeId").val();
		$.ajax({
			type: 'GET',
			url: `/api/like-store/save/${id}`,
		}).done(function(data) {
			if (data.httpStatus) {
				alert(data.body);
				$(`#btn--approve-${id}`).remove();
			}
		}).fail(function(error) {
			console.log(error);
		});
	}
};

wishList.init();