<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex-column">
	<%
	int start = 1;
	int standard = 6;
	int space = 6;

	int firstSpace = space;
	int secondSpace = (space * 3);
	int thirdSpace = (space * 5);
	int foursSpace = (space * 7);

	int first = (standard * 2);
	int second = (standard * 4);
	int third = (standard * 6);
	int fours = (standard * 8);
	int totalRoomCount = 63;
	%>

	<div class="d-flex justify-content-center"
		style="border: 1px solid black; width: 550px; height: 245px">
		<div class=" ml-1 mt-4">

			<div class="d-flex ml-4">
				<%
				for (start = 1; start < totalRoomCount; start++) {
				%>
				<input type="checkbox" id="<%=start%>"
					class="d-flex justify-content-center mr-1" name="seatNumber"
					style="border: 1px solid black; width: 30px; height: 30px"
					value="<%=start%>">


				<%
				if (start == firstSpace) {
				%>
				&nbsp; &nbsp; &nbsp;
				<%
				}
				%>
				<%
				if (start == first) {
					break;
				}
				%>

				<%
				}
				%>
			</div>
			<div class="d-flex ml-4 mt-1">
				<%
				for (start = first + 1; start < totalRoomCount; start++) {
				%>
				<input type="checkbox" id="<%=start%>"
					class="d-flex justify-content-center mr-1" name="seatNumber"
					style="border: 1px solid black; width: 30px; height: 30px"
					value="<%=start%>">

				<%
				if (start == secondSpace) {
				%>
				&nbsp; &nbsp; &nbsp;
				<%
				}
				%>
				<%
				if (start == second) {
					break;
				}
				%>
				<%
				}
				%>
			</div>
			<br>
			<div class="d-flex ml-4">
				<%
				for (start = second + 1; start < totalRoomCount; start++) {
				%>
				<input type="checkbox" id="<%=start%>"
					class="d-flex justify-content-center mr-1" name="seatNumber"
					style="border: 1px solid black; width: 30px; height: 30px"
					value="<%=start%>">

				<%
				if (start == thirdSpace) {
				%>
				&nbsp; &nbsp; &nbsp;
				<%
				}
				%>
				<%
				if (start == third) {
					break;
				}
				%>

				<%
				}
				%>
			</div>

			<div class="d-flex ml-4 mt-1">
				<%
				for (start = third + 1; start < totalRoomCount; start++) {
				%>
				<input type="checkbox" id="<%=start%>"
					class="d-flex justify-content-center mr-1" name="seatNumber"
					style="border: 1px solid black; width: 30px; height: 30px"
					value="<%=start%>">

				<%
				if (start == foursSpace) {
				%>
				&nbsp; &nbsp; &nbsp;
				<%
				}
				%>
				<%
				if (start == fours) {
					break;
				}
				%>
				<%
				}
				%>
			</div>
			<br>
			<div class="d-flex mt-2">
				<%
				for (start = fours + 1; start <= totalRoomCount; start++) {
				%>
				<input type="checkbox" id="<%=start%>"
					class="d-flex justify-content-center mr-1 disabled"
					name="seatNumber"
					style="border: 1px solid black; width: 30px; height: 30px"
					value="<%=start%>">

				<%
				}
				%>
			</div>
		</div>
	</div>
</div>

