<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex-column">

		<div class="d-flex flex-grow-1 justify-content-center "
		style="border: 1px solid black;">
		<div class=" ml-1 mt-4">

			<div class="d-flex">
				<c:forEach var="start" begin="1" end="${totalRoomCount}">
					<input type="checkbox" id="${start}"
						class="d-flex justify-content-center mr-1" name="seatNumber"
						style="border: 1px solid black; width: 100px; height: 100px"
						value="${start}">
				</c:forEach>
			</div>
		</div>
	</div>
</div>

