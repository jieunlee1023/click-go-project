
let index = {
	init: function() {
		$("#btn--save-review-reply").bind("click", () => {
			this.saveReply();
		});
		$("#btn--save").bind("click", () => {
			this.save();
		});
	},
	saveReply: function() {
		let data = {
			content: $("#reply").val()
		};
		let reviewId = $("#id").val();
		$.ajax({
			type: 'post',
			url: '/api/review/reply/save/' + reviewId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus == true) {
				alert(data.body);
				location.href = "/review/detail/" + reviewId;
			} else {
				alert(data.body);
			}
		}).fail(function(error) {
			console.log(error);
			alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
		});
	},
	save: function() {
		let storeId = $("#storeId").val();
		let data = {
			content: $("#content").val(),
			starScore: $("#starScore").val(),
		};
		$.ajax({
			type: 'post',
			url: `/api/review/save/${storeId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus) {
				alert(data.body);
				location.href = '/review/';
			} else {
				alert(data.body);
			}
		}).fail(function(error) {
			alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
		});
	}
};
$('#star a').click(function() {
	$(this).parent().children("a").removeClass("on");
	$(this).addClass("on").prevAll("a").addClass("on");
	console.log($(this).attr("value"));
});


index.init();