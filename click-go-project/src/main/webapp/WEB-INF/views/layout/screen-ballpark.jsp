<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex-column">


	<div class="d-flex flex-grow-1 justify-content-center ">
		<div class=" ml-1 mt-4">

			<div class="d-flex ml-4">
				<c:forEach var="start" begin="1" end="${totalRoomCount}">
					<input type="checkbox" id="${start}"
						class="d-flex justify-content-center mr-1" name="seatNumber"
						style="width: 70px; height: 70px" value="${start}">
				</c:forEach>
			</div>
		</div>
	</div>
</div>
