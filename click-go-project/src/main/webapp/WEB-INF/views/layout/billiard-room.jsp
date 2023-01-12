<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex-column">


	<div class="d-flex flex-grow-1 justify-content-center "">
		<div class="d-flex-column ml-1 mt-4">

			<c:set var="done_loop" value="false" />
			<div class="d-flex ml-4">
				<c:forEach var="start" begin="1" end="${totalRoomCount}">
					<c:if test="${done_loop ne true}">
						<input type="checkbox" id="${start}"
							class="d-flex justify-content-center mr-3" name="seatNumber"
							style="border: 1px solid black; width: 100px; height: 100px"
							value="${start}">
						<c:if test="${start == firstSpace}">
				&nbsp; &nbsp; &nbsp;
				</c:if>
						<c:if test="${start == (onlyOneSpace - 1)}">
							<c:set var="done_loop" value="true" />
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<br> <br>
			<div class="d-flex ml-4">
				<c:forEach var="start" begin="${onlyOneSpace}"
					end="${totalRoomCount}">
					<input type="checkbox" id="${start}"
						class="d-flex justify-content-center mr-3" name="seatNumber"
						style="border: 1px solid black; width: 100px; height: 100px"
						value="${start}">
				</c:forEach>
			</div>
		</div>
		<br>
	</div>
</div>

