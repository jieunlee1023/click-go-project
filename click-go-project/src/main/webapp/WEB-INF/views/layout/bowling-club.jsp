<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex-column">


	<div class="d-flex justify-content-center"
		style="border: 1px solid black; width: 550px; height: 245px">
		<div class=" ml-1 mt-4">

			<div class="d-flex ml-4">
				<c:forEach var="start" begin="1" end="${totalRoomCount}">
					<input type="checkbox" id="${start}"
						class="d-flex justify-content-center mr-1" name="seatNumber"
						style="border: 1px solid black; width: 30px; height: 30px"
						value="${start}">
				</c:forEach>
			</div>
		</div>
	</div>
</div>

