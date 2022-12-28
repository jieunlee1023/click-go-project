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

		<div class="form-group ">
			<div class="d-flex" style="font-size: 13px">
				<select class=" custom-select mb-3" name="category" id="category" style="border-radius: 0px" >
					<option value="pc방" disabled="disabled" selected="selected">카테고리를
						선택해주세요.</option>
					<option value="pc방">PC방</option>
					<option value="노래방">노래방</option>
					<option value="동전노래방">동전노래방</option>
					<option value="당구장">당구장</option>
					<option value="볼링장">볼링장</option>
					<option value="스크린야구장">스크린야구장</option>
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
			<label for="storeTEL" class="d-flex m-0" style="font-size: 13px">가맹점
				번호</label> <input type="text" class="form-control" id="storeTEL"
				style="border-radius: 0px" name="storeTEL" value="051-123-3333">
		</div>
		<div class="d-flex form-group justify-content-between">
			<span class="d-flex m-0" style="font-size: 13px">사업자 등록증</span> <a>
				<img src="../image/q.png" width="15px" height="15px">
			</a>
		</div>
		<div class="form-group">
			<input type="file" class="form-control-file border" name="file"
				required="required" id="storeLicense">
		</div>

		<br>
		<div class="form-control d-flex justify-content-center"
			    style="border-radius: 0px;">
			<button type="button" id="btn--store-franchise-apply" class="d-flex "
				style="border: none; background-color: white;">가맹점 신청하기</button>
		</div>
	</div>
</div>



<script type="text/javascript" src="/js/storeFranchise.js"></script>
<%@ include file="../layout/footer.jsp"%>