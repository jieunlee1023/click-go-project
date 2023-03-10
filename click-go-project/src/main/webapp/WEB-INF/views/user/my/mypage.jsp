<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>

<input type="hidden" value="${user.id}" id="user-id">
<c:choose>
	<c:when test="${user.role eq 'GEUST'}">
		<div class="container" id="mypage">

			<div class="d-flexr" id="view-more-title"
				style="align-items: center;">
				<div>π  My Page</div>
				<button class="btn--delete-user" type="button" id="btn--delete-user">
					<span class="button__text">νμνν΄</span>
				</button>
			</div>

			<br>
			<h4 id="mypage--title">λ°κ°μ΅λλ€.</h4>
			<h4 id="mypage--title">" ${user.username} " λ,</h4>
			<h4 id="mypage--title">μ΅κ³ μ μλΉμ€λ‘ λͺ¨μκ² μ΅λλ€.</h4>
			<h5 id="mypage--title">ν¬μΈνΈ : ${user.point}P</h5>
		</div>
		<br>
		<div class="container d-flex justify-content-center"
			style="flex-wrap: wrap;">
			<div class="btn-wrapper">
				<a href="/user/update-form" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/user_update.png"
					width="80px"> <br> <span>λ΄ μ λ³΄ μμ </span> <br> <span
					id="mypage-mini-title">λΉλ°λ²νΈλ₯Ό μ£ΌκΈ°μ μΌλ‘ λ³κ²½νμ¬ <br> κ³μ μ λ³΄λ€
						μμ νκ² λ³΄νΈνμΈμ.
				</span>
				</a>
			</div>

			<div class="btn-wrapper">
				<a href="/reservation/list" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/reservation.png"
					width="80px"> <br> <span>μμ½ λ΄μ­</span> <br> <span
					id="mypage-mini-title">μμ½ μ λ³΄μ κ²°μ  μ λ³΄λ₯Ό <br> ν λμ νμΈνμΈμ.
				</span>
				</a>
			</div>
		</div>
		<div class="container d-flex justify-content-center"
			style="flex-wrap: wrap;">

			<div class="btn-wrapper">
				<a href="/wish-list/" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/wish-list.png"
					width="80px"> <br> <span>μμλ¦¬μ€νΈ</span> <br> <span
					id="mypage-mini-title">μμ£Ό κ°λ μ₯μλ₯Ό μμλ¦¬μ€νΈμ λ΄μ<br> μνλ μκ°λμ
						νΈνκ² μμ½νμΈμ.
				</span>
				</a>
			</div>


			<div class="btn-wrapper">
				<a href="/review/" class="btn2"> <img style="margin-top: 40px;"
					src="/image/mypage/review.png" width="80px"> <br> <span>λ¦¬λ·°
						λ΄μ­</span> <br> <span id="mypage-mini-title"> λ΄κ° μ΄ λ¦¬λ·° λͺ©λ‘κ³Ό <br>
						μ¬μ₯λμ λ΅κΈμ νμΈνμΈμ.
				</span>
				</a>
			</div>

			<div class="btn-wrapper">
				<a href="/report/list/0" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/report.png"
					width="80px"> <br> <span>μ κ³  λ΄μ­</span> <br> <span
					id="mypage-mini-title">μ κ³  μ μ°¨ μ§νμ<br> νμΈ νμ€ μ μμ΅λλ€.
				</span>
				</a>
			</div>
		</div>

	</c:when>


	<c:otherwise>


		<div class="container" id="mypage">

			<div class="d-flexr" id="view-more-title"
				style="align-items: center;">
				<div>π‘ My & Store Page</div>
				<button class="btn--delete-user" type="button" id="btn--delete-user">
					<span class="button__text">νμνν΄</span>
				</button>
			</div>


			<br>
			<h4 id="mypage--title">λ°κ°μ΅λλ€.</h4>
			<h4 id="mypage--title">" ${user.username} "</h4>
			<h4 id="mypage--title">κ°λ§Ήμ μ£Όλ</h4>
			<h4 id="mypage--title">μ΅κ³ μ μλΉμ€λ‘ λͺ¨μκ² μ΅λλ€.</h4>
		</div>
		<br>
		<div class="container d-flex justify-content-between"
			style="flex-wrap: wrap;">
			<div class="btn-wrapper">
				<a href="/user/update-form" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/user_update.png"
					width="80px"> <br> <span>λ΄ μ λ³΄ μμ </span> <br> <span
					id="mypage-mini-title">λΉλ°λ²νΈλ₯Ό μ£ΌκΈ°μ μΌλ‘ λ³κ²½νμ¬ <br> κ³μ μ λ³΄λ€
						μμ νκ² λ³΄νΈνμΈμ.
				</span>
				</a>
			</div>

			<div class="btn-wrapper">
				<a href="/reservation/list" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/reservation.png"
					width="80px"> <br> <span>μμ½ κ΄λ¦¬</span> <br> <span
					id="mypage-mini-title">κ°λ§Ήμ μ μμ½ μ λ³΄μ κ²°μ  μ λ³΄λ₯Ό<br> ν λμ νμΈνμ€
						μ μμ΅λλ€.
				</span>
				</a>
			</div>


			<div class="btn-wrapper">
				<a href="/care-store/" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/wish-list.png"
					width="80px"> <br> <span>λ§€μ₯ κ΄λ¦¬</span> <br> <span
					id="mypage-mini-title">κ°λ§Ήμ μ£Όλ! <br> λ§€μ₯μ κ΄λ¦¬ν΄μ£ΌμΈμ!
				</span>
				</a>
			</div>

			<div class="btn-wrapper">
				<a href="/review" class="btn2"> <img style="margin-top: 40px;"
					src="/image/mypage/review.png" width="80px"> <br> <span>λ¦¬λ·°
						λ΄μ­</span> <br> <span id="mypage-mini-title"> μλλ€μ΄ μμ±ν <br>
						λ¦¬λ·°λ₯Ό νμΈνμ€ μ μμ΅λλ€.
				</span>
				</a>
			</div>

			<div class="btn-wrapper">
				<a href="/report/list/0" class="btn2"> <img
					style="margin-top: 40px;" src="/image/mypage/report.png"
					width="80px"> <br> <span>μ κ³  λ΄μ­</span> <br> <span
					id="mypage-mini-title">μ κ³  μ μ°¨ μ§νμ<br> νμΈ νμ€ μ μμ΅λλ€.
				</span>
				</a>
			</div>

			<div class="btn-wrapper">
				<a href="/store/chart/week" class="btn2"> <img style="margin-top: 40px;"
					src="/image/mypage/sales.png" width="80px"> <br> <br>
					<span>λ§€μΆ λ΄μ­</span> <br> <span id="mypage-mini-title">
						κ°λ§Ήμ μ λ§€μΆμ νμΈν΄λ³΄μΈμ! </span>
				</a>
			</div>
		</div>

	</c:otherwise>
</c:choose>
<br>
<br>
<br>
<script src="/js/user.js"></script>

<%@ include file="../../layout/footer.jsp"%>