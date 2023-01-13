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
	},
	delete: function(myLikeStoreId) {
		let id = myLikeStoreId;

		$.ajax({
			type: 'GET',
			url: `/api/like-store/delete/${id}`,
		}).done(function(data) {
			if (data.httpStatus) {
				$(`#myLikeStoresList-${id}`).remove();
			} else {
				alert(data.body);
			}
		}).fail(function(error) {
			console.log(error);
		});
	},
};

wishList.init();


let likeStore = {
	like: function() {

		let heartData;
		$("#store--wish--emptyheart").bind("click", () => {
			$('#store--wish--emptyheart').html('♥');
			heartData = 1;
			this.likeStoreSave(heartData);
		});
		$("#store--wish--heart").bind("click", () => {
			$('#store--wish--heart').html('♡');
			heartData = 0;
			this.likeStoreSave(heartData);
		});



	},
	likeStoreSave: function(heartData) {
		let likeStoreId = $("#likeStoreId").val();
		let storeId = $("#storeId").val();
		let data = {
			likeStore: heartData,
		}
		if (likeStoreId == '') {
			likeStoreId = 0;
		}

		$.ajax({
			type: 'post',
			url: `/api/like-store/${likeStoreId}/${storeId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus) {
				if (data.body == '좋아요') {
					location.href = '/wish-list';
				} else {
					location.href = `/store/detail/${storeId}`;
				}
			} else if (data.httpStatus == false) {
				Swal.fire({
					icon: 'warning',
					text: data.body,
				});
			}
		}).fail(function(error) {
			alert(error);
		});

	}
}

likeStore.like();