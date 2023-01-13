<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">

	<div class="d-flex flex-grow-1 justify-content-center">

		<div class="seat--sample">
			<div class="">
				<div class="d-flex flex-grow-1 justify-content-center">
					<h5>💁 원하시는 테이블을 선택해주세요!</h5>
				</div>
				<br>

				<div class="d-flex flex-grow-1 justify-content-center ">
					<div class="d-flex-column ml-1 mt-4">

						<c:set var="done_loop" value="false" />
						<div class="d-flex ml-4">
							<c:forEach var="start" begin="1" end="${totalRoomCount}">
								<c:if test="${done_loop ne true}">
									<p>${start }</p>
									<input type="checkbox" id="${start}"
										class="d-flex justify-content-center mr-3" name="seatNumber"
										style="border: 1px solid black; width: 100px; height: 100px; accent-color: black;"
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
								<p>${start }</p>
								<input type="checkbox" id="${start}"
									class="d-flex justify-content-center mr-3" name="seatNumber"
									style="border: 1px solid black; width: 100px; height: 100px; accent-color: black;"
									value="${start}">
							</c:forEach>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>


</div>

