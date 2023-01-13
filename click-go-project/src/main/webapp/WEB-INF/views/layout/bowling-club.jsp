<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">

	<div class="d-flex flex-grow-1 justify-content-center">

		<div class="seat--sample">
			<div class="">
				<div class="d-flex flex-grow-1 justify-content-center">
					<h5>💁 원하시는 곳을 선택해주세요!</h5>
				</div>
				<br>
				<div class="d-flex flex-grow-1 justify-content-center">
					<c:forEach var="start" begin="1" end="${totalRoomCount}">
						<p>${start }</p>
						<input type="checkbox" id="${start}"
							class="d-flex justify-content-center mr-1" name="seatNumber"
							style="border: 1px solid black; width: 80px; height: 80px"
							value="${start}">
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<br>
<br>