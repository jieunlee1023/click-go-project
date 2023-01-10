
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
		if (likeStoreId == null) {
			likeStoreId = 0;
		}

		$.ajax({
			type: 'post',
			url: `/api/store/likeStore/${likeStoreId}/${storeId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus) {
				if(data.body =='좋아요'){
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



const input = document.querySelector(".finder__input");
const finder = document.querySelector(".finder");
const form = document.querySelector("form");

input.addEventListener("focus", () => {
	finder.classList.add("active");
});

input.addEventListener("blur", () => {
	if (input.value.length === 0) {
		finder.classList.remove("active");
	}
});

form.addEventListener("submit", (ev) => {
	ev.preventDefault();
	finder.classList.add("processing");
	finder.classList.remove("active");
	input.disabled = true;
	setTimeout(() => {
		finder.classList.remove("processing");
		input.disabled = false;
		if (input.value.length > 0) {
			finder.classList.add("active");
		}
	}, 1000);
});


