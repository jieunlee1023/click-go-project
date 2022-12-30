
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
			alert("비밀번호를 확인해주세요.");
		} else {
			console.log(data);
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
					alert("회원가입에 실패하셨습니다. 형식을 맞춰주세요.");
				}
			}).fail(function(error) {
				console.log(error);
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
			});
		}
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
			alert("비밀번호를 확인해주세요.");
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
					alert("회원 정보 수정에 실패하셨습니다. 형식을 맞춰주세요.");
				}
			}).fail(function(error) {
				console.log(error.responseText);
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
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
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.");
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
				alert("당신의 아이디는 : " + data.body);
				location.href = "/auth/info-search";
			} 
		}).fail(function(error) {
			console.log(error);
			alert("해당하는 이메일이 없습니다 다시 확인해주세요");
		});
	}




};

index.init();