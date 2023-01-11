let index = {
	init: function() {

		let msgSizeData = $("#msgSize").val();

		for (var i = 0; i < msgSizeData; i++) {
			let userId = $("#userId" + i).text();
			let userName = $("#userName" + i).text();
			let franchiseId = $("#franchiseId" + i).text();
			let category = $("#category" + i).text();
			let storeName = $("#storeName" + i).text();
			let storeTel = $("#storeTel" + i).text();
			let storeAddress = $("#storeAddress" + i).text();
			let storeTotalRoomCount = $("#storeTotalRoomCount" + i).text();
			let licenseImageUrl = $("#licenseImageUrl" + i).val();
			let layoutImageUrl = $("#layoutImageUrl" + i).val();
			let price = $("#price" + i).text();
			$("#btn--store-franchise-approve-" + i).bind("click", () => {
				this.approve(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, licenseImageUrl, layoutImageUrl, storeTotalRoomCount, price);
			});
			$("#btn--store-franchise-reject-" + i).bind("click", () => {
				var rejectMsg = prompt("유저에게 보낼 승인 거절 사유를 적어주세요!");
				if (rejectMsg != null) {
					this.reject(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, rejectMsg);
				}
			});
		}
	},

	approve: function(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, licenseImageUrl, layoutImageUrl, storeTotalRoomCount, price) {
		let data = {
			id: franchiseId,
			storeName: storeName,
			storeAddress: storeAddress,
			storeTEL: storeTel,
			userId: userId,
			licenseImageUrl: licenseImageUrl,
			layoutImageUrl: layoutImageUrl,
			storeTotalRoomCount: storeTotalRoomCount,
			price: price,
		}
		$.ajax({
			type: 'POST',
			url: `/api/store-franchise/approve/${data.id}/${data.userId}?category=${category}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
		}).done(function(data) {
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: '가맹점 승인이 완료되었습니다.',
				}).then(function() {
					location.href = "/storeFranchise/store-franchise-message";
				});
			} else {
				Swal.fire({
					icon: 'error',
					text: '가맹점 승인에 실패했습니다 관리자에게 문의해주세요',
				}).then(function() {
					location.href = "/storeFranchise/store-franchise-message";
				});
			}
		}).fail(function(error) {
			Swal.fire({
				icon: 'error',
				text: '오류가 발생했습니다',
			}).then(function() {
				location.href = "/storeFranchise/store-franchise-message";
			});
		});

	},
	reject: function(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, rejectMsg) {
		let data = {
			id: franchiseId,
			storeName: storeName,
			storeAddress: storeAddress,
			storeTEL: storeTel,
			userId: userId,
			rejectReason: rejectMsg,
		}
		$.ajax({
			type: 'POST',
			url: `/api/store-franchise/reject/${data.id}/${data.userId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8",
		}).done(function(data) {
			if (data.httpStatus == true) {
				Swal.fire({
					icon: 'success',
					text: '가맹점 승인이 거절 되었습니다!',
				}).then(function() {
					location.href = "/storeFranchise/store-franchise-message";
				});
			} else {
				Swal.fire({
					icon: 'error',
					text: '내부적인 오류로 인하여 승인거절에 실패했습니다 다시 확인하여 주세요!',
				});
			}
		}).fail(function(error) {
			Swal.fire({
				icon: 'error',
				text: '내부적인 오류로 인하여 승인거절에 실패했습니다 다시 확인하여 주세요!',
			});
		});
	},
	searchAddress: function() {
		new daum.Postcode(
			{
				oncomplete: function(data) {

					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("roadAddress").value = roadAddr;
					document.getElementById("jibunAddress").value = data.jibunAddress;

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress
							+ extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : '
							+ expRoadAddr + ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : '
							+ expJibunAddr + ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}
				}
			}).open();
	}
}

index.init();


