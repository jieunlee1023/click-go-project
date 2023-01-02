<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container d-flex justify-content-center"
	style="width: 500px">
	<div class="container">
		<div class="d-flex justify-content-center">
			<h3>가맹점 신청</h3>
			<br> <br>
		</div>


		<input type="hidden" value="${principal.user.id}" id="principalUser">

		<form action="/storeFranchise/apply/upload" method="post"
			enctype="multipart/form-data">
			<div class="form-group ">
				<div class="d-flex" style="font-size: 13px">
					<select class=" custom-select mb-3" name="category" id="category"
						style="border-radius: 0px">
						<option value="pc방" disabled="disabled" selected="selected">카테고리를
							선택해주세요.</option>
						<c:forEach var="category" items="${categories}">
							<option value="${category}">${category}</option>
						</c:forEach>
					</select>
				</div>
			</div>



			<div class="form-group ">
				<label for="storeName" class="d-flex m-0" style="font-size: 13px">가맹점명</label>
				<input type="text" class="form-control" id="storeName"
					style="border-radius: 0px" name="storeName" value="OX 피시방">
			</div>
			<div class="form-group ">
				<label for="storeAddress" class="d-flex m-0" style="font-size: 13px">가맹점
					주소</label> <input type="text" class="form-control" id="storeAddress"
					style="border-radius: 0px" name="storeAddress" value="부산광역시 진구">
			</div>

			<div class="form-group ">
				<label for="storeTotalRoomCount" class="d-flex m-0" style="font-size: 13px">가맹점
					총 자릿 수</label> <input type="text" class="form-control" id="storeTotalRoomCount"
					style="border-radius: 0px" name="storeTotalRoomCount" value="63">
			</div>

			<div class="form-group ">
				<label for="storeTEL" class="d-flex m-0" style="font-size: 13px">가맹점
					번호</label> <input type="text" class="form-control" id="storeTEL"
					style="border-radius: 0px" name="storeTEL" value="051-123-3333">
			</div>

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
			</div>
		</form>
	</div>
</div>

<script>
	$(".custom-file-input").bind(
			"change",
			function() {
				console.log("test code:" + $(this).val());
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>



<script type="text/javascript" src="/js/storeFranchise.js"></script>
<%@ include file="../layout/footer.jsp"%>