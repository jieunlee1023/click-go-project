<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container" id="store-franchise-apply">

	<div id="view-more-title">
		<div>📃 가맹점 신청</div>
	</div>
	<br>

	<div class="container">


		<input type="hidden" value="${principal.user.id}" id="principalUser">

		<form action="/storeFranchise/apply/upload" method="post"
			enctype="multipart/form-data">
			<div class="form-group ">
				<div class="d-flex" style="font-size: 13px">
<<<<<<< HEAD
					<select class=" custom-select mb-3" name="category" id="category"
						style="border-radius: 0px">
						<option value="pc방" disabled="disabled" selected="selected">카테고리를
=======
					<select class=" custom-select mb-3" name="category" id="category" required>
						<option value="none" disabled="disabled" selected="selected"  >카테고리를
>>>>>>> developer
							선택해주세요.</option>
						<c:forEach var="category" items="${categories}">
							<option value="${category}">${category}</option>
						</c:forEach>
					</select>
				</div>
			</div>



			<div class="form-group ">
				<label for="storeName" class="d-flex m-0" style="font-size: 13px" >가맹점명</label>
				<input type="text" class="form-control" id="storeName"
					name="storeName" value="OX 피시방" required>
			</div>
			<div class="form-group ">
				<label for="storeAddress" class="d-flex m-0" style="font-size: 13px">가맹점
					주소</label> <input type="text" class="form-control" id="storeAddress"
<<<<<<< HEAD
					style="border-radius: 0px" name="storeAddress" value="부산광역시 진구">
=======
					name="storeAddress" value="부산광역시 진구" required>

>>>>>>> developer
			</div>

			<div class="form-group ">
				<label for="storeTotalRoomCount" class="d-flex m-0" style="font-size: 13px">가맹점
					총 자릿 수</label> <input type="text" class="form-control" id="storeTotalRoomCount"
					style="border-radius: 0px" name="storeTotalRoomCount" value="63">
			</div>

			<div class="form-group ">
				<label for="storeTEL" class="d-flex m-0" style="font-size: 13px">가맹점
					번호</label> <input type="text" class="form-control" id="storeTEL"
					name="storeTEL" value="051-123-3333" required>
			</div>
<<<<<<< HEAD

			<div class="form-group ">
				<label for="price" class="d-flex m-0" style="font-size: 13px">
					10분당 이용 금액</label> <input type="text" class="form-control" id="price"
					style="border-radius: 0px" name="price" value="300">
			</div>

			<div class="d-flex form-group justify-content-between">
				<span class="d-flex m-0" style="font-size: 13px">사업자 등록증</span> <a>
					<img src="/image/q.png" width="15px" height="15px">
				</a>
			</div>

			<div class="form-group">
				<input type="file" name="file" class="custom-file-input"
					id="customFile" required="required" id="storeLicense">
			</div>

			<div class="d-flex form-group justify-content-between">
				<span class="d-flex m-0" style="font-size: 13px">자리 배치도</span> <a>
					<img src="/image/q.png" width="15px" height="15px">
				</a>
			</div>
			<div class="form-group">
				<input type="file" name="file" class="custom-file-input"
					id="customFile" required="required" id="storeLicense">
				<div class="d-flex justify-content-end" style="font-size: 13px">
					예약 서비스에 이용됩니다.</div>
			</div>

			<br>
			<div class="form-control d-flex justify-content-center"
				style="border-radius: 0px;">
				<button type="submit" class="d-flex "
					style="border: none; background-color: white;">가맹점 신청하기</button>
=======
			<div class="d-flex" id="store--licence--text">
				<span class="d-flex mr-2" style="font-size: 13px">사업자 등록증</span>

				<button type="button" data-toggle="tooltip" data-placement="right"
					title="가맹점 신청 시 사업자 등록증은 필수 항목입니다." id="licence--que">
					?</button>

			</div>

			<div class="custom-file">
				<input type="file" name="file" class="custom-file-input"
					id="customFile" required="required" id="storeLicense"> <label
					class="custom-file-label" for="customFile">업로드 할 파일을 선택해주세요</label>
			</div>
			<br> <br>
			<div class="d-flex" id="store--licence--seat">
				<span class="d-flex mr-2" style="font-size: 13px">좌석 배치도</span>

				<button type="button" data-toggle="tooltip" data-placement="right"
					title="가맹점 신청 시 좌석 배치도를 &nbsp; 올려주셔야 등록 승인 절차를  &nbsp; 진행합니다. (※ 예약시 필수 )" id="seat--que">?
				</button>
			</div>


			<div class="custom-file">
				<input type="file" name="file" class="custom-file-input"
					id="customFile" required="required" id="storeLicense"> <label
					class="custom-file-label" for="customFile">업로드 할 파일을 선택해주세요</label>
			</div>

			<br> <br>
			<div class="d-flex justify-content-end">
				<button type="submit" class="btn" id="franchise--apply">가맹점
					신청하기</button>
>>>>>>> developer
			</div>
		</form>
	</div>
</div>
<br>
<br>
<br>
<br>

<script>
	$(".custom-file-input").bind(
			"change",
			function() {
				console.log("test code:" + $(this).val());
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
<<<<<<< HEAD
=======

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
>>>>>>> developer
</script>



<script type="text/javascript" src="/js/storeFranchise.js"></script>
<%@ include file="../layout/footer.jsp"%>