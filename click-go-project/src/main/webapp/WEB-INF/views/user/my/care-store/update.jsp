<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container">
	<h1>매장 꾸미기</h1>
	<h5>수정을 완료 했다면 아래의 수정 완료 버튼을 눌러보세요 !</h5>
</div>
<br>
<div class="d-flex-column justify-content-center">
	<c:choose>
		<c:when test="${empty store}">
			<br>
			<br>
			<br>
			<br>
			<div class="container d-flex">
				<h2 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h2>
			</div>
		</c:when>
		<c:otherwise>
			<form action="/care-store/detail/update" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" value="${store.id}" name="id">
				<div class="container d-flex">
					<div class="media border mt-3"
						style="width: 1150px; height: 510px; border-radius: 15px;">
						<div class="d-flex-column">
							<img src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
								style="width: 1150px; height: 400px; border-radius: 15px;">
							<div class="media-body">
								<div class="d-flex-column ml-3 mr-2 md-2 mt-1">
									<div class="d-flex justify-content-between pl-3 pt-3 pr-3">
										<h1>${store.storeName}</h1>
									</div>
									<div class="d-flex-column mr-4 mt-3 justify-content-end">
										<div class="form-group ">
											<label for="storeAddress" class="d-flex m-0"
												style="font-size: 13px">가맹점 주소</label> <input type="text"
												class="form-control" id="storeAddress"
												style="border-radius: 0px; width: 800px;"
												name="storeAddress" value="${store.storeAddress}">
										</div>
										<div class="form-group ">
											<label for="storeAddress" class="d-flex m-0"
												style="font-size: 13px">카테고리</label> <input type="text"
												class="form-control" id="category"
												style="border-radius: 0px" name="category"
												value="${store.category.id}">
										</div>
										<div class="form-group ">
											<label for="storeAddress" class="d-flex m-0"
												style="font-size: 13px">총 자릿수</label> <input type="text"
												class="form-control" id="totalRoomCount"
												style="border-radius: 0px" name="storeTotalRoomCount"
												value="${store.storeTotalRoomCount}">
										</div>
										<div class="form-group ">
											<label for="storeAddress" class="d-flex m-0"
												style="font-size: 13px">가게 연락처</label> <input type="text"
												class="form-control" id="storeTEL"
												style="border-radius: 0px" name="storeTEL"
												value="${store.storeTEL}">
										</div>
										<div class="form-group">
											<!-- 	<input type="file" name="file" class="custom-file-input"
												id="customFile" required="required" id="storeLicense">
											<div class="d-flex form-group justify-content-between">
												<span class="d-flex m-0" style="font-size: 13px"> 사진
													등록하기 </span> <a> <img src="/image/q.png" width="15px"
													height="15px">
												</a> -->
											<!-- </div> -->
											<button type="submit" class="d-flex "
												style="border: none; background-color: white;">수정
												완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<br>
		</c:otherwise>
	</c:choose>
</div>
<br>
<%@ include file="../../../layout/footer.jsp"%>