<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container d-flex">
	<div class="media border mt-3"
		style="width: 900px; height: 510px; border-radius: 15px;">
		<div class="d-flex-column">
			<a href="/store/detail/${store.id}"> <img
				src="${image}" alt="가게 사진"
				style="width: 900px; height: 400px; border-radius: 15px;">
				<div class="d-flex justify-content-between ml-3 mr-2 md-2 mt-1"
					style="width: 900px">
					<h5 class="d-flex  pl-3 pt-3 pr-3" style="font-weight: bold;">${store.storeName}</h5>
					<div class="d-flex-column m-3 mr-4">
						<div class="d-flex m-2 justify-content-end">
							<span>TODO !! = 가게의 총 자리 - 이용자가 예약한 자리 = 화면에 보여줌</span> <span>자리
								: ${store.storeTotalRoomCount}</span>
						</div>
						<div class="d-flex m-1 justify-content-end">
							<span>지점 : ${store.storeAddress}</span>
						</div>
					</div>
				</div>
			</a> 
		</div>
	</div>
</div>
<br>
