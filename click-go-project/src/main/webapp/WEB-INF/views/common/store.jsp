<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container d-flex media border mt-3"
	style="width: 850px; height: 150px; border-radius: 15px;">
	<img src="${image}" alt="가게 사진">
	<div class="d-flex">
		<h2>${store.storeName}</h2>
		<span>총 자리 수 : ${store.storeTotalRoomCount}</span> <span>주소 :
			${store.storeAddress}</span> <a href="/store/detail/${store.id}">
			<button>수정하기</button>
		</a>
	</div>
</div>
<br>

