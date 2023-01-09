
let boardIndex = {
	init: function() {
		/*
		$("#btn--write").bind("click", () => {
			this.write();
		});
		*/

		$("#btn--update").bind("click", () => {
			this.update();
		});
		$("#btn--delete").bind("click", () => {
			this.deleteById();
		});
		/*
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});
		*/
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
				Swal.fire({
					icon: 'success',
					text: '게시글이 작성되었습니다.',
				}).then(function() {
					location.href = "/board/board-list";
				});
			}
		}).fail(function(error) {
			Swal.fire({
				icon: 'success',
				text: '게시글이 작성을 실패하였습니다.',
			}).then(function() {
				location.href = "/board/board-list";
			});
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
				Swal.fire({
					icon: 'success',
					text: '게시글이 수정이 완료되었습니다.',
				}).then(function() {
					location.href = "/board/list";
				});
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
				Swal.fire({
					icon: 'success',
					text: '게시글이 삭제가 완료되었습니다.',
				}).then(function() {
					location.href = "/board/list";
				});
			}
		}).fail(function(error) {
			Swal.fire({
				icon: 'error',
				text: '게시글이 삭제를 실패하였습니다.',
			});
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
				Swal.fire({
					icon: 'success',
					text: '댓글 삭제 성공!',
				}).then(function() {
					location.href = "/board/" + boardId;
				});
			}
		}).fail(function(error) {
			Swal.fire({
				icon: 'error',
				text: '댓글 삭제 실패!',
			}).then(function() {
				location.href = "/board/" + boardId;
			});
		});
	}




}






boardIndex.init();