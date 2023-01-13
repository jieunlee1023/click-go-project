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
		let passwordCheck = $("#password-check").val();
		let password = $("#password").val();
		let username = $("#username").val();
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			phoneNumber: $("#phoneNumber").val(),
			email: $("#email").val(),
			role: $("#role").val()
		};
		if (password != passwordCheck) {
			Swal.fire({
				icon: 'error',
				text: '비밀번호를 확인해주세요!',
			});
			return false;
		} else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,12}$/.test(password)) {
			Swal.fire({
				icon: 'error',
				text: '숫자+영문자+특수문자 조합으로 5 ~ 12자리 이상 사용해야 합니다.',
			});
			return false;
		} else if (!/^[a-z|A-Z|0-9]+$/.test(username)) {
			Swal.fire({
				icon: 'warning',
				text: '아이디는 영문으로만 가능합니다.',
			});
			return false;
		}

		$.ajax({
			type: 'post',
			url: '/api/user/sign-up',
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json"
		}).done(function(data) {
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: data.body,
				}).then(function() {
					location.href = "/";
				});
			}
			else {
				Swal.fire({
					icon: 'error',
					text: '회원가입에 실패하셨습니다. 형식을 맞춰주세요.',
				});

			}
		}).fail(function(error) {
			Swal.fire({
				icon: 'warning',
				text: '입력하신 정보가 형식에 맞지않습니다 다시 확인하여 주세요',
			});
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
				icon: 'error',
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
					Swal.fire({
						icon: 'success',
						text: data.body,
					}).then(function() {
						location.href = "/";
					});
				} else {
					Swal.fire({
						icon: 'warning',
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

		Swal.fire({
			title: '정말로 그렇게 하시겠습니까?',
			text: '다시 되돌릴 수 없습니다. 신중하세요.',
			icon: 'warning',

			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		}).then(result => {
			// 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면

				$.ajax({
					type: 'DELETE',
					url: '/api/user/delete/' + id,
					data: JSON.stringify(data),
				}).done(function(data) {
					if (data.httpStatus == true) {
						Swal.fire({
							confirmButtonText: '확인',
							icon: 'success',
							text: '회원탈퇴가 되었습니다.',
						}).then(function() {
							location.href = "/";
						});
					} else {
						Swal.fire({
							icon: 'warning',
							text: '회원탈퇴에 실패하셨습니다.',
						});
					}
				}).fail(function(error) {
					Swal.fire({
						icon: 'warning',
						text: '오류가 발생했습니다. 관리자에게 문의해주세요.',
					});
				});
			} else if (result.isDismissed) { }
		});

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
				icon: 'warning',
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
			if (data.httpStatus == false) {
				Swal.fire({
					icon: 'success',
					text: data.body,
				}).then(function() {
					location.href = "/auth/login-form";
				});
			}
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