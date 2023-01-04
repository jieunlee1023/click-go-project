
let index = {
	init: function() {
		$("#btn--save").bind("click", () => {
			this.save();
		});
		$("#btn--update").bind("click", () => {
			this.update();
		});
		$("#btn--delete-user").bind("click", () => {
			this.deleteUser();
		});
		$("#btn--search-id").bind("click", () => {
			this.searchId();
		});
		$("#btn--search-pw").bind("click", () => {
			this.searchPw();
		});
		$("#username").bind("keyup", () => {
			this.checkId();
		});
		$("#email").bind("keyup", () => {
			this.checkEmail();
		});

	},

	save: function() {
		let passwordCheck = $("#password").val();
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			phoneNumber: $("#phoneNumber").val(),
			email: $("#email").val(),
			role: $("#role").val()
		};
		if (data.password != passwordCheck) {
			Swal.fire({
				icon: 'warning',
				text: '비밀번호를 확인해주세요!',
			});
		}
		$.ajax({
			type: 'post',
			url: '/api/user/sign-up',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			console.log(data);
			if (data.httpStatus == true) {
				alert(data.body);
				location.href = "/";
			} else {
				Swal.fire({
					icon: 'error',
					text: '회원가입에 실패하셨습니다. 형식을 맞춰주세요.',
				});

			}
		}).fail(function(error) {
			alert(error.responseText);
			console.log("오류가 발생했습니다. 관리자에게 문의해주세요.");
		});

	},
	update: function() {
		let passwordCheck = $("#new--pwd-check").val();
		let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			phoneNumber: $("#phoneNumber").val(),
			email: $("#email").val(),
			password: $("#new--pwd").val(),
		};
		if (data.password != passwordCheck) {
			Swal.fire({
				icon: 'warning',
				text: '비밀번호를 확인해주세요!',
			});
		} else {
			$.ajax({
				type: 'post',
				url: '/api/user/update',
				data: JSON.stringify(data),
				contentType: "application/json; charset=UTF-8",
				dataType: "json"
			}).done(function(data) {
				console.log(data);
				if (data.httpStatus == true) {
					alert(data.body);
					location.href = "/";
				} else {
					Swal.fire({
						icon: 'error',
						text: '회원 정보 수정에 실패하셨습니다. 형식을 맞춰주세요.',
					});
				}
			}).fail(function(error) {
				console.log(error.responseText);
				Swal.fire({
					icon: 'error',
					text: '오류가 발생했습니다. 관리자에게 문의해주세요.',
				});
			});
		}
	},

	deleteUser: function() {
		let id = $("#user-id").val();
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			phoneNumber: $("#phoneNumber").val(),
			email: $("#email").val(),
			role: $("#role").val()
		};



		if (confirm('정말 회원탈퇴를 하시겠습니까?')) {

			$.ajax({
				type: 'DELETE',
				url: '/api/user/delete/' + id,
				data: JSON.stringify(data),
			}).done(function(data) {
				if (data.httpStatus == true) {
					alert("회원탈퇴가 되었습니다.")
					location.href = "/";
				} else {
					alert("회원탈퇴에 실패하셨습니다.");
				}
			}).fail(function(error) {
				console.log(error);
				Swal.fire({
					icon: 'error',
					text: '오류가 발생했습니다. 관리자에게 문의해주세요.',
				});
			});
		}
	},

	searchId: function() {
		let data = {
			email: $("#email").val()
		}

		$.ajax({
			type: 'POST',
			url: '/api/user/search',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: "당신의 아이디는 : " + data.body,
				});

			}
		}).fail(function(error) {
			console.log(error);
			Swal.fire({
				icon: 'error',
				text: '해당하는 이메일이 없습니다 다시 확인해주세요',
			});
		});
	},



	searchPw: function() {
		let data = {
			username: $("#username").val(),
			email: $("#search-email").val(),
		}
		$.ajax({
			type: 'POST',
			url: '/api/user/send-mail',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: '가입하신 이메일 주소로 임시비밀번호를 발송하였습니다.',
				}).then(function() {
					location.href = "/auth/login-form";
				});
			}
		}).fail(function(error) {
			console.log(error);
			Swal.fire({
				icon: 'error',
				text: '가입하신 회원정보가 없습니다 다시 확인하여 주세요',
			});
		});
	},

	/* 아이디 중복 체크 */
	checkId: function() {
		let data = {
			username: $('#username').val()
		}
		$.ajax({
			url: "/api/user/check-id",
			type: "POST",
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: 'json',
			success: function(data) {
				console.log("데이터 들어오나요" + data);

				if (data == 1) {
					$("#id-feedback").html('이미 사용중인 아이디입니다.');
					$("#id-feedback").attr('color', '#db0008');
				} else {
					$("#id-feedback").html('사용할 수 있는 아이디입니다.');
					$("#id-feedback").attr('color', '#009129');
				}
			},
			error: function() {
			}
		})
	},

	/* 이메일 중복 체크 */
	checkEmail: function() {
		let data = {
			email: $('#email').val()
		}
		$.ajax({
			url: "/api/user/check-email",
			type: "POST",
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: 'json',
			success: function(data) {

				if (data == 1) {
					$("#email-feedback-email").html('이미 사용중인 이메일입니다.');
					$("#email-feedback-email").attr('color', '#db0008');
				} else {
					$("#email-feedback-email").html('사용할 수 있는 이메일입니다.');
					$("#email-feedback-email").attr('color', '#009129');
				}
			},
			error: function() {
			}
		})
	}

};

index.init();