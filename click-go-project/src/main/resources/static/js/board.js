
let boardIndex = {
	init: function() {
		$("#btn--write").bind("click", () => {
			this.write();
		});

		$("#btn--update").bind("click", () => {
			this.update();
		});
		$("#btn--delete").bind("click", () => {
			this.deleteById();
		});
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});
	},

	write: function() {
		//let xCheckTitle = XSSCheck($("#title").val());
		//let token = $("meta[name='_csrf']").attr("content");
		//let csrfHeader = $("meta[name='_csrf_header']").attr("content");

		let data = {
			content: $("#content").val(),
			title: $("#title").val()
		};

		var checkBoxArray = new Array();
		$('input:checkbox[name=secret]:checked').each(function() {
			checkBoxArray.push(this.value);
		});

		$.ajax({
			type: "POST",
			url: "/api/board",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json"
		}).done(function(data) {
			console.log(data);
			if (data.httpStatus == true) {
				alert("글쓰기 성공");
				location.href = "/board/board-list";
			}
		}).fail(function(error) {
			alert("글 등록 실패" + error.responseJSON.message);
		});
	},

	update: function() {
		let boardId = $("#board-id").attr("data-id");

		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		}

		$.ajax({
			type: "PUT",
			url: "/api/board/" + boardId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus == true) {
				alert("글 수정이 완료됐습니다");
				location.href = "/board/board-list"
			}
		}).fail(function(error) {
			alert("글 수정 실패" + error.responseJSON.message);
		});
	},

	deleteById: function() {
		let id = $("#board-id").val();

		$.ajax({
			type: "DELETE",
			url: "/api/board/" + id
		}).done(function(data) {
			if (data.httpStatus == true) {
				alert("글 삭제 완료");
				location.href = "/board/board-list"
			}
		}).fail(function(error) {
			alert("글 삭제 실패 " + error.responseJSON.message);
		});
	},

	replySave: function() {

		let replyData = {
			boardId: $("#board-id").val(),
			content: $("#reply--content").val()
		};
		
		
		var checkBoxArray = new Array();
		$('input:checkbox[name=secret]:checked').each(function() {
			checkBoxArray.push(this.value);
		});
		
		
		$.ajax({
			type: "POST",
			url: "/api/board/" + replyData.boardId + "/reply",
			contentType: "application/json; utf-8",
			data: JSON.stringify(replyData),
			dataType: "Json"
		}).done(function(data) {
			console.log(data);
			if (data.httpStatus == true) {
				alert("댓글 등록 성공");
				console.log(data.body);
				location.href = "/board/" + replyData.boardId;


			}
		}).fail(function(error) {
			console.log(error);
			alert("리플 등록 실패");
		});
	},

	replyDelete: function(boardId, replyId) {


		$.ajax({

			type: "DELETE",
			url: `/api/board/${boardId}/reply/${replyId}`,
			dataType: "json"
		}).done(function(resData) {
			if (resData.httpStatus == true) {
				alert("댓글 삭제 성공");
				location.href = "/board/" + boardId;
			}
		}).fail(function(error) {
			alert("댓삭제실패" + error.responseJSON.message);
		});
	}




}






boardIndex.init();