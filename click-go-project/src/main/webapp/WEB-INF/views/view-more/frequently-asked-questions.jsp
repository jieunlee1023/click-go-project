<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container" id="f-a-question">

	<div id="view-more-title">
		<div>π« μμ£Ό λ¬»λ μ§λ¬Έ</div>
	</div>
	<br>


	<div class="d-flex justify-content-center">

		<!-- μ΄μ©λ¬Έμ -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/1'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop1">μ΄μ© λ° κ²°μ </button>

		<!-- νμκ°μ -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/2'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">νμκ°μ λ° νν΄</button>

		<!-- νμμ λ³΄ -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/3'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">νμμ λ³΄ λ° μΈμ¦</button>


		<!-- μ§λ¬Έ9 -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/9'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">ν΄λ¦­ λΉμ¦</button>

		<!-- λ¦¬μλ νλ‘κ·Έλ¨ -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/10'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">λ¦¬μλ νλ‘κ·Έλ¨</button>
	</div>

	<hr>
	<!-- μ κΈ° -->

	<div class="container">
		<div id="accordion">

			<c:if test="${questNum == 1}">

				<div class="card">
					<div class="card-header">
						<a class="card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse1"> κ³ κ°μΌν° μ°κ²° μ§μ° μ μ΄λ»κ²
							νλμ? </a>
					</div>
					<div id="collapse1" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μΌλΆ μκ°λμλ ν΅νλμ΄ λ§μ μλ΄μ¬ μ°κ²°μ΄ μ§μ°λ  μ μμ΅λλ€.<br>ν΄λ¦­κ³ λ μ ν μλ΄ μΈμλ λ€μν
							λ°©μμΌλ‘ μλ΄μ΄ κ°λ₯νμ€λ μ°κ²° μ§μ° μ 1:1λ¬Έμ, ν΄λ¦­κ³ ν‘μ ν΅ν΄ μλ΄μ λΆνλλ¦½λλ€.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse3"> μ λ³΄λ₯Ό κ³΅μ νλ κΈ°λ₯μ΄ μλμ? </a>
					</div>
					<div id="collapse3" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μμΈνμ΄μ§ > μ€λ₯Έμͺ½ μλ¨μ κ³΅μ νκΈ° μμ΄μ½μ ν΄λ¦­νμλ©΄ ν΄λ¦­κ³ ν‘, λ¬Έμλ©μμ§λ‘ λΉ λ₯΄κ² κ³΅μ ν  μ μμ΅λλ€.<br>
							ν΄λ¦­κ³ μ κ³΅μ  κΈ°λ₯μ ν΅ν΄ μ£Όλ³ μ§μΈλ€μκ² μμΉλ₯Ό κ³΅μ ν΄ λ³΄μΈμ!
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse5"> νκΈμμμ¦ λ°κΈλ°κ³  μΆμ΄μ. </a>
					</div>
					<div id="collapse5" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μμ νμμ νκΈμμμ¦μ νκΈμ± κ²°μ μλ¨μΌλ‘ κ²°μ  μ λ°κΈμ΄ κ°λ₯ν©λλ€.<br> <br> κ²°μ 
							λ¨κ³μμ νκΈμμμ¦μ μ μ²­νλ©΄ μλμΌλ‘ λ°νλμ§λ§,<br> μ μ²­μ λλ½νκ±°λ λ°νλ°μ§ λͺ»ν κ²½μ°λΌλ©΄ μμμ¦
							νμΈ ν κ΅­μΈμ²­μμ μμ§λ°κΈλΆμ λ±λ‘ν΄ μ£ΌμκΈΈ λ°λλλ€.<br> <br> [λ€μ΄λ²νμ΄]<br>
							- κ²°μ  λ¨κ³μμ νκΈμμμ¦ μ μ²­νλ©΄ μλμΌλ‘ λ°ν (19λ 12μ 26μΌ μν)<br> - μμ§λ°κΈ :
							λ€μ΄λ²νμ΄ > κ²°μ λ΄μ­ > μ£Όλ¬Έκ±΄ > μ£Όλ¬ΈμμΈμ λ³΄ > μμμ¦ λ°κΈλ΄μ­ > νκΈμμμ¦ νμΈ<br> - λ¨,
							19λ 12μ 26μΌ 10μ μ΄μ  κ²°μ  κ±΄μ ν΄λ¦­κ³  κ³ κ°νλ³΅μΌν°λ‘ μμ²­<br> <br>
							[κ°νΈκ³μ’μ΄μ²΄ / Click_Go / PAYCO]<br> - κ²°μ  λ¨κ³μμ νκΈμμμ¦ μ μ²­νλ©΄ μλμΌλ‘ λ°ν<br>
							- λ¨, κ°νΈκ³μ’μ΄μ²΄μ κ²½μ° μ μ²­ λλ½ μ ν΄λ¦­κ³  κ³ κ°νλ³΅μΌν°λ‘ μμ²­<br> <br> [ν΄λ¦­κ³ νμ΄]<br>
							- ν΄λ¦­κ³ νμ΄λ¨Έλ κ²°μ  μ μλμΌλ‘ λ°ν<br> - μμ§λ°κΈ : ν΄λ¦­κ³ ν‘ > pay > μ°μΈ‘ν±λλ°ν΄(λμ
							ν΄λ¦­κ³ νμ΄) > μ΄μ©λ΄μ­ > κ²°μ  > κ°λ³ μμΈλ΄μ­ > νκΈμμμ¦ νμΈ
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse6"> κ²°μ  μμμ¦ λ°κΈλ°κ³  μΆμ΄μ. </a>
					</div>
					<div id="collapse6" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">κ²°μ  μμμ¦μ
							κ²°μ μλ¨μ λ°λΌ νμΈ/λ°κΈ λ°©λ²μ΄ μμ΄νμ€λ μλ λ΄μ©μ μ°Έκ³ ν΄ μ£ΌμκΈ° λ°λλλ€. [μ μ©/μ²΄ν¬μΉ΄λ/KB pay] -
							ν΄λ¦­κ³  μ± > νλ¨ λ΄μ λ³΄ > μμ½/κ΅¬λ§€λ΄μ­ > κ²°μ  μ¦λΉ λ³΄κΈ° - μμ½λ΄μ­μ΄ μ­μ λμμ κ²½μ° ν΄λ¦­κ³ νμ΄λ¨ΌμΈ 
							ννμ΄μ§μμ μ‘°ν [ν΄λν° κ²°μ , PAYCO, ν΄λ¦­κ³ νμ΄, ν΄λ¦­κ³ , κ°νΈκ³μ’μ΄μ²΄] - ν΄λ¦­κ³  μ± > νλ¨ λ΄μ λ³΄ >
							μμ½/κ΅¬λ§€λ΄μ­ > κ²°μ  μ¦λΉ λ³΄κΈ° - μμ½λ΄μ­μ΄ μ­μ λμμ κ²½μ° κ° κ²°μ  λνμ¬ ννμ΄μ§μμ μ‘°ν [λ€μ΄λ²νμ΄] -
							λ€μ΄λ²νμ΄ > κ²°μ λ΄μ­ > μν > κ²°μ  μμΈ > μμμ¦ μ‘°ν</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse7"> κ³μ’ λ±λ‘ ν μνμμ λ¬Έμκ°
							μμ΄μ. </a>
					</div>
					<div id="collapse7" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							κ°νΈκ³μ’μ΄μ²΄, Click_Goμ κ³μ’ λ±λ‘ μ μνμμ μλμ΄μ²΄ μλΉμ€κ° λ±λ‘λμλ€λ λ¬Έμκ° λ°μ‘λ  μ μμ΅λλ€.<br>
							<br> λ§€λ¬ μΌμ  κΈμ‘μ΄ μλμ΄μ²΄ λλ κ²μ΄ μλλΌ, κ²°μ  μ λΉλ°λ²νΈ μΈμ¦ ν μ΄μ²΄λλ μλΉμ€μ΄λ
							μμ¬νκ³  μ΄μ©ν΄μ£ΌμκΈΈ λ°λλλ€.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse8"> κ°νΈκ³μ’μ΄μ²΄ λ±λ‘ ν΄μ§λ μ΄λ»κ²
							νλμ? </a>
					</div>
					<div id="collapse8" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μμ μμ½ νμ΄μ§ λ΄μμ λ³κ²½μ΄ κ°λ₯ν©λλ€.<br> <br> [ν΄μ§ λ°©λ²]<br> μμ½
							νμ΄μ§ > κ°νΈκ³μ’μ΄μ²΄ κ²°μ μλ¨ μ ν > κ²°μ νκΈ° λ²νΌ > ν΄μ§ν  μν μ ν> κ³μ’/λΉλ°λ²νΈ κ΄λ¦¬ λ©λ΄μμ ν΄μ§ κ°λ₯<br>
							*κ²°μ μλ£μ  λ¨κ³λ‘ μ€μ  κ²°μ κ° λ°μλμ§ μμ΅λλ€.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse9"> μ¬μ©κ°λ₯ν μΉ΄λ μ’λ₯κ° μμ΄μ. </a>
					</div>
					<div id="collapse9" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							ν΄λ¦­κ³  μμ½ μλΉμ€ κ²°μ  μ μ¬μ© κ°λ₯ν μΉ΄λ μ’λ₯λ PGμ¬(μ μκ²°μ  λνμ¬)μμ μ νλ λΆλΆμ΄λ―λ‘ μΌλΆ μΉ΄λλ
							κ²°μ μ§μμ΄ λΆκ°ν  μ μμ΅λλ€.<br> <br> IBKκΈ°μμν μΉ΄λμ κ²½μ° λͺ©λ‘μμ λΉμ¨λ₯Ό
							μ ννμλ©΄ κ²°μ  κ°λ₯νμ€λ μ΄μ©μ μ°Έκ³  λΆνλλ¦½λλ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse10"> 'μμμ¦ νμΈνκΈ°' λλ₯΄λ©΄ ν°μ
							νλ©΄λ§ λ³΄μ¬μ. </a>
					</div>
					<div id="collapse10" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μ¬μ©νλ λͺ¨λ°μΌ λΈλΌμ°μ μ νμμ΄ μ°¨λ¨λμμ κ²½μ°, λΉ νλ©΄λ§ λ³΄μ΄κ±°λ νμκ² λ³΄μΌ μ μμ΅λλ€.<br> <br>
							λͺ¨λ°μΌ λΈλΌμ°μ μ νμμ νμ© ν ν λ€μ ν λ² μλ λΆνλλ¦½λλ€.<br> <br> [μλλ‘μ΄λ]<br>
							μ¬μ©νλ λͺ¨λ°μΌ λΈλΌμ°μ  μ€μ  > μ¬μ΄νΈ μ€μ  > νμ νμ©<br> <br> [μμ΄ν°]<br>
							μμ΄ν° > μ€μ  > Safari > νμ νμ©<br>
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse11"> κ°νΈκ³μ’μ΄μ²΄ νλ μ΄κ³Όλ‘ κ²°μ κ°
							λΆκ°ν΄μ. </a>
					</div>
					<div id="collapse11" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							κ°νΈκ³μ’μ΄μ²΄ νλλ 1μΌ 1ν 2λ°±λ§μ, μ 5λ°±λ§μμΌλ‘ μ€μ λμ΄ μμ΅λλ€.<br> <br> μν
							μ΄μ²΄ νλμλ κ΄κ³μμ΄ κ°νΈκ³μ’μ΄μ²΄ κ±°λκΈμ‘ νλ μ΄κ³Ό μ κ²°μ κ° λΆκ°νμ€λ μ΄ κ²½μ° λ€λ₯Έ κ²°μ μλ¨μ μ¬μ©νμ¬ μ΄μ©ν΄
							μ£ΌμκΈΈ λ°λλλ€.
						</div>
					</div>
				</div>
			</c:if>

			<!-- νμκ°μ -->
			<c:if test="${questNum == 2}">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse16"> μΈμ¦λ μμ΄λκ° μ΄λ―Έ μ‘΄μ¬νλ€κ³ 
							λμ΅λλ€. </a>
					</div>
					<div id="collapse16" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ³ΈμΈμΈμ¦ μλ μ "νμλ λͺμλ‘ μΈμ¦λ μμ΄λκ° μ΄λ―Έ μ‘΄μ¬ν©λλ€."λ‘ μλ΄λλ κ²½μ°,<br> κ³ κ°λμ
							μ λ³΄λ‘ μ΄λ―Έ κ°μλ λ€λ₯Έ μμ΄λκ° μ‘΄μ¬νλ κ²μ΄κΈ° λλ¬Έμ μλ‘ λ³ΈμΈμΈμ¦μ λ°μ μ μμ΅λλ€.<br> μ΄λ―Έ
							κ°μλ μμ΄λλ₯Ό μ¬μ©ν΄μ£Όμκ³ , λΉλ°λ²νΈλ₯Ό λͺ¨λ₯΄μλ κ²½μ° λ‘κ·ΈμΈ μ°½μμ λ₯Ό μ΄μ©ν΄μ£ΌμΈμ.<br>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse17"> μμ΄λλ₯Ό μ¬λ¬κ° μ¬μ©ν  μ
							μλμ? </a>
					</div>
					<div id="collapse17" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μΈμ¦μ λ°μ§ μμ μμ΄λλ μ¬λ¬ κ° λ³΄μ ν  μ μμ§λ§, μν κ΅¬λ§€λ₯Ό μν΄μλ λ³ΈμΈμΈμ¦μ΄ νμν©λλ€.<br>
							κ΅¬λ§€ νλμ λν μ νν μλ΄λ₯Ό μνμ¬ 1μΈλΉ 1κ°μ μμ΄λλ§ μ¬μ©νμ€ κ²μ κΆμ₯ν©λλ€.<br> μ΄λ―Έ
							κ°μ(μΈμ¦)ν μμ΄λκ° μμΌλ μμ΄λκ° κΈ°μ΅λμ§ μμΌμ€ κ²½μ° []λ₯Ό μ΄μ©ν΄ μ£ΌμκΈ° λ°λλλ€.<br> <br>
							β ν΄λ¦­κ³  μμ΄λ μ°ΎκΈ°<br> β’ λ‘κ·ΈμΈ > [μμ΄λ(μ΄λ©μΌ)/λΉλ°λ²νΈ μ°ΎκΈ°] λ²νΌ ν΄λ¦­ >
							[μμ΄λ(μ΄λ©μΌ)μ μμ΄λ²λ Έμ΅λλ€] ν΄λ¦­<br>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse18"> μΈκ΅­μΈλ νμκ°μμ ν  μ
							μλμ? </a>
					</div>
					<div id="collapse18" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							κ΅­λ΄μ κ±°μ£Όνλ μΈκ΅­μΈ κ³ κ°λμ νμκ°μμ΄ κ°λ₯ν©λλ€.<br> β» λ¨, μ£Όλ¬Έ κ΄λ ¨(κ΅¬λ§€νμΈ/κ²°μ /λ°ν/νλΆ
							λ±) μ€μ μ λ³΄ μλ΄λ₯Ό μν΄ ν΄λν° μΈμ¦μ΄ νμνλ©°, μΈμ¦μ΄ λμ§ μμ μ μλΉμ€μ μ νμ΄ μμ μ μμ΅λλ€<br>
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse19"> μ  λͺμλ‘ κ°μλ ν΄λν°λ²νΈκ°
							μμ΅λλ€. λ€λ₯Έ μ¬λμ ν΄λν°λ²νΈλ₯Ό μ¬μ©ν΄λ λλμ? </a>
					</div>
					<div id="collapse19" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ€λ₯Έ μ¬λμ ν΄λν°λ²νΈλ‘ λ±λ‘νμ¬ μ¬μ©νμ€ μ μμ΅λλ€.<br> λ€λ§, λ±λ‘λ ν΄λν°λ²νΈλ‘ κ΅¬λ§€ λ°
							μ·¨μμ λ³΄, ν°μΌλ²νΈ, μ£Όμ μλΉμ€ μ μ± λ³κ²½ λ±μ μ€μν μ λ³΄λ₯Ό μλ΄ν΄ λλ¦¬λ―λ‘ μ΅λν κ°μμ λ³ΈμΈ λͺμμ μ λ³΄λ₯Ό
							μλ ₯ν΄ μ£ΌμκΈ° λ°λλλ€.<br> <br> λν μΌλΆ μλΉμ€(μ κΈ°λ°°μ‘, μ±μΈμ©νκ΅¬λ§€)μ κ²½μ° μΈμ¦λ
							λ³ΈμΈμ ννμ¬ μ κ³΅ κ°λ₯ν μ  νμΈ λΆνλλ¦½λλ€.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse20"> νμκ°μμ μ΄λ»κ² νλμ? </a>
					</div>
					<div id="collapse20" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							νμκ°μ λ°©λ² μλ΄ λλ¦½λλ€.<br> <br> <br> ν΄λ¦­κ³  νμκ°μνκΈ°<br>
							<br> <br> App<br> <br> β’ ν΄λ¦¬κ³  > μ€λ₯Έμͺ½ μλ¨ [λ‘κ·ΈμΈ]
							λ²νΌ ν΄λ¦­ > λ²νΌ ν΄λ¦­<br> <br> <br> Web<br> <br>
							β’ ν΄λ¦­κ³  μΉμ¬μ΄νΈ μ€λ₯Έμͺ½ μλ¨ λ²νΌ ν΄λ¦­<br> <br> <br> β» νμκ°μ μ,
							μ΄λ©μΌ λ° ν΄λν° λ²νΈλ λ°λμ μ€μ  λ³ΈμΈμ μ λ³΄λ₯Ό μλ ₯ν΄μ£ΌμκΈ° λ°λλλ€.<br> <br> β» νμ
							κ°μ ν μ²« κ΅¬λ§€ μ, ν΄λν° λ³ΈμΈ μΈμ¦μ΄ μ§νλ©λλ€.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse29"> νν΄νλ©΄ κ°μΈμ λ³΄λ λͺ¨λ
							μ­μ λλμ? </a>
					</div>
					<div id="collapse29" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							νμ νν΄νλ λ°©λ²μ λ€μκ³Ό κ°μ΅λλ€.<br> νν΄ μ νμ μ μ© μΉ μλΉμ€ μ΄μ©μ΄ λΆκ°ν©λλ€.<br>
							νν΄ μ  νκΈ° μ μμ¬ν­μ λ°λμ νμΈν΄ μ£ΌμκΈ° λ°λλλ€.<br> <br> β νμ νν΄ μ μ μ μ¬ν­<br>
							1. κ°μΈμ λ³΄<br> 1) νμνν΄μ ν¨κ» κ³ κ°λμ κ°μΈμ λ³΄λ μμ  μ­μ λμ΄ μ¬κ°μμ ν΄λ κ΅¬λ§€λ΄μ­ νμΈμ΄
							λΆκ°ν©λλ€.<br> 2) γκ°μΈμ λ³΄λ³΄νΈλ²γλ° γμ μμκ±°λ λ±μμ μλΉμ λ³΄νΈμ κ΄ν λ²λ₯ γμ λ°λΌ κ±°λμ λ³΄λ
							λ²μμ μ ν΄μ§ κΈ°κ°κΉμ§ λ³λλ‘ λ³΄κ΄λ  μ μμ΅λλ€.<br> <br> 2. κ²°μ /νλΆ<br>
							1) μ΄λ―Έ κ²°μ κ° μλ£λ κ±΄μ νν΄λ‘ μ·¨μλμ§ μμ΅λλ€.<br> 2) μ ν¨κΈ°κ°μ΄ κ²½κ³Όλμ§ μμ λ―Έμ¬μ©
							μΏ ν°(ν°μΌ) κ΄λ ¨ μ λ³΄λ μ ν¨κΈ°κ° λ§λ£μΌκΉμ§ λ³΄κ΄λλ©°, νν΄ νμλ μ ν¨κΈ°κ° λ΄ μ¬μ©νμ€ μ μμ΅λλ€.<br>
							β» μ ν¨κΈ°κ° λ΄ μ¬μ©νμ§ λͺ»ν λ―Έμ¬μ© μΏ ν°μ κ΅¬λ§€κΈμ‘μ 70%λ₯Ό λ³Έμ¬(ν΄λ¦­κ³ ) μΊμλ‘ μ λ¦½ν΄ λλ¦¬λ, νν΄ μ μ λ¦½
							λ°μ μ μμ΅λλ€.
						</div>
					</div>
				</div>
			</c:if>

			<!-- νμμ λ³΄ -->
			<c:if test="${questNum == 3}">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse21"> κ΄κ³ μ± μ΄λ©μΌκ³Ό λ¬Έμλ₯Ό λ°μ§
							μμΌλ €λ©΄ μ΄λ»κ² νλμ? </a>
					</div>
					<div id="collapse21" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ§μ΄λ³Έμ¬(ν΄λ¦­κ³ )μμ κ΄κ³ μ± μ λ³΄ μμ  λμλ₯Ό μ² ννμλ©΄ λ©λλ€.<br> μμ  λμ μ² ν μ, 2~3μΌ
							μ΄νλΆν° κ΄κ³ μ± μ΄λ©μΌ/λ¬Έμκ° λ°μ‘λμ§ μμ΅λλ€.<br> β» κ΅¬λ§€ μ λ³΄ λ° μλΉμ€ μ£Όμ μ μ± λ³κ²½ λ±μ
							μ λ³΄μ± μλ΄ λ©μΌμ μμ  λμμ λ¬΄κ΄νκ² λ°μ‘λ©λλ€.<br> β» κ΅¬λ§€ νλκ³Ό κ΄λ ¨λ μλ¦Όμ μμ νμλ €λ©΄
							λ³Έμ¬(ν΄λ¦­κ³ ) μ± > λ§μ΄λ³Έμ¬(ν΄λ¦­κ³ )μμ λͺ¨λ°μΌ μλ¦Ό(App Push)μ μ€μ ν΄ μ£ΌμκΈ° λ°λλλ€.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse22"> κ°μΈμ λ³΄μ κ΄λ ¨λ νΌν΄λ₯Ό μμ
							κ²½μ° μ΄λ»κ² νλμ? </a>
					</div>
					<div id="collapse22" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ³Έμ¬(ν΄λ¦­κ³ )μ κ³ κ°λμ κ°μΈμ λ³΄λ₯Ό [κ°μΈμ λ³΄ μ·¨κΈλ°©μΉ¨] μμ κ³ μ§ν λ²μ λ΄μμ μ¬μ©νλ©° κ³ μ§ν λ²μλ₯Ό μ΄κ³Όνμ¬
							μ΄μ©νκ±°λ, νμΈ λλ νκΈ°μ, κΈ°κ΄μ μ κ³΅νμ§ μμ΅λλ€.<br> <br> β» λ§μΌ νμ μμ΄λμ
							λΉλ°λ²νΈμ λΆλ² λμ© λ± νμμ λ³΄μ κ΄λ ¨ν νΌν΄κ° λ°μν κ²½μ°μλ λ°λ‘ λ³Έμ¬(ν΄λ¦­κ³ ) κ³ κ°μΌν°(β1577-7011)
							λλ λͺ¨λ°μΌ μ± [κ³ κ°μΌν°> μ±νλ¬Έμ]λ₯Ό ν΅ν΄ νΌν΄ λ΄μ©μ μλ €μ£ΌμκΈ° λ°λλλ€.<br> <br> β»
							κ°μΈμ λ³΄μ κ΄λ ¨νμ¬ λΆμμ΄ μλ κ²½μ°μλ 2μ°¨ λ―Όμμ²λ¦¬ κΈ°κ΄μΈ κ°μΈμ λ³΄λ³΄νΈμ§ν₯μ(KISA)μ κ°μΈμ λ³΄λΆμμ‘°μ μμνλ‘
							κ°μΈμ λ³΄ λ―Όμμ μ²­μ νμ€ μ μμ΅λλ€.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse23"> νμμ λ³΄ μμ μ μ΄λ»κ² νλμ?
						</a>
					</div>
					<div id="collapse23" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ§μ΄λ³Έμ¬(ν΄λ¦­κ³ )μ νμμ λ³΄ μμ λμμ μ΄λ¦(κ°λͺ), μμ΄λ(μ΄λ©μΌ), ν΄λν° λ²νΈ, λΉλ°λ²νΈ, μ£Όμλ‘/λ°°μ‘μ§ μμ μ΄
							κ°λ₯ν©λλ€.<br> <br> <br> β νμμ λ³΄ μμ νκΈ°<br> APP<br>
							β’ > λΉλ°λ²νΈ μλ ₯<br> Web<br> β’ > λΉλ°λ²νΈ μλ ₯<br> <br>
							<br> β μ΄λ¦ λ³κ²½νκΈ°<br> β’ μ€λͺ λ±λ‘κΈ°κ΄μ κ°λͺ μ λ³΄κ° μμ κ²½μ° μ΄λ¦ λ³κ²½μ΄ λΆκ°ν©λλ€.<br>
							β’ μ€λͺ λ±λ‘κΈ°κ΄μ κ°λͺ μ λ³΄κ° λ±λ‘λμ§ μμ κ²½μ° μ€λͺ λ±λ‘μΌν°μμ μ€λͺ λ±λ‘μ λ§μΉ ν, μ λ³΄ λ³κ²½μ ν΄μ£ΌμκΈ°
							λ°λλλ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse24"> λ³ΈμΈλͺμ ν΄λν°μΈμ¦μ΄ μλλ
							κ²½μ°λ μλμ? </a>
					</div>
					<div id="collapse24" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							νμΈ λ° λ²μΈ λͺμ, μΌμμ μ§λ ν΄λν° λ±μ κ²½μ° ν΄λν° μΈμ¦μ ν  μ μμ΅λλ€.<br> <br>
							<br> β λ³ΈμΈλͺμ μΈμ¦μ΄ λΆκ°ν κΈ°κΈ°(ν΄λν°)<br> β’ μ λΆ ν΄λν°<br> <br>
							<br> β λ³ΈμΈμΈμ¦μ΄ λΆκ°λ₯ν μν<br> β’ λΆμ€ λλ μΌμ§μ μ§(μ΄μ©μμ μμ²­ λλ λ―Έλ© μν)
							μν<br> β’ λ²μΈ λͺμλ‘ κ°ν΅<br> β’ μ΄λ ν΅μ μ¬μ λ―Έλ±λ‘λ ν΄λν°(ν΄μ§ λλ λ―Έκ°ν΅)
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse25"> μμ΄λ(μ΄λ©μΌ) λ³κ²½ μΈμ¦λ©μΌμ΄
							μ€μ§ μμμ΄μ. </a>
					</div>
					<div id="collapse25" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							κ° λ©μΌ μλΉμ€μ λ°λΌ λ©μΌ λμ°© μκ°μ΄ μ‘°κΈ μ§μ°λ  μ μμ΅λλ€.<br> λ©μΌμ΄ λμ°©νμ§ μμ κ²½μ°
							μ€νΈλ©μΌν¨μ νμΈν΄ λ³΄μκ±°λ λ³Έμ¬(ν΄λ¦­κ³ )μ λ©μΌ μ£Όμκ° μμ  μ°¨λ¨λμ΄ μμ§ μμ μ§ νμΈν΄ μ£ΌμκΈ° λ°λλλ€.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse26"> λ‘κ·ΈμΈ νμ§ μμλλ°, μλμΌλ‘
							λ‘κ·ΈμΈλ©λλ€. </a>
					</div>
					<div id="collapse26" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ‘κ·ΈμΈ μ°½μμ 'μλ λ‘κ·ΈμΈ'μ μ²΄ν¬ν κ²½μ° μμ΄λ(μ΄λ©μΌ)κ³Ό λΉλ°λ²νΈλ₯Ό μλ ₯νμ§ μμλ λ‘κ·ΈμΈ μνκ° μ μ§λ©λλ€.<br>
							'μλ λ‘κ·ΈμΈ' κΈ°λ₯μ μμΉ μλ κ²½μ°μλ λ‘κ·Έμμ ν, λ‘κ·ΈμΈ μ°½μμ 'μλλ‘κ·ΈμΈ' μ²΄ν¬ ν΄μ λ₯Ό ν΄μ£Όμλ©΄ λ©λλ€.<br>
							<br> β» κ°μΈμ λ³΄λ³΄νΈλ₯Ό μν΄ μ¬λ¬ μ¬λμ΄ ν¨κ» μ¬μ©νλ κ³΅μ© PC, λͺ¨λ°μΌμμλ μ¬μ©μ μ νν΄ μ£ΌμκΈ°
							λ°λλλ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse27"> λ³Έμ¬(ν΄λ¦­κ³ )μμ κ²°μ νμ§
							μμλλ° κ²°μ λμλ€λ μ°λ½μ λ°μμ΄μ. </a>
					</div>
					<div id="collapse27" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ³Έμ¬(ν΄λ¦­κ³ )μμλ νμκ°μμ μ§νν΄μΌ μν μ£Όλ¬Έ λ° κ²°μ κ° κ°λ₯ν©λλ€.<br> μ£Όλ¬Ένμ§ μμμΌλ
							κ²°μ λμλ€λ μΉ΄λμ¬ λ° μνμ¬ λ¬Έμκ° μλ€λ©΄ μλμ λ΄μ©μ νμΈ λ°λλλ€.<br> <br> -
							κ°μ‘±, μΉμΈμ² λ± μ§μΈκ³Ό ν¨κ» μμ΄λλ₯Ό μ¬μ©ν  κ²½μ°<br> - μ΄μ μ μ μ²­ν μ κΈ°λ°°μ‘ μνμ΄ μλ κ²°μ λ
							κ²½μ°<br> <br> β» μ μ¬ν­μ λͺ¨λ νμΈνμμλ μ£Όλ¬Έ λ° κ²°μ  λ΄μ­μ΄ νμ λμ§ μλ
							κ²½μ°μλ, μΉ΄λ μΉμΈλ²νΈ λ° λ¬Έμ μμ  λ΄μ­μ νμΈνμμ΄ λ³Έμ¬(ν΄λ¦­κ³ ) κ³ κ°μΌν°(β1577-7011) λλ λͺ¨λ°μΌ μ±
							[κ³ κ°μΌν°> μ±νλ¬Έμ]λ‘ λ¬Έμνμλ©΄ μ μν μ²λ¦¬ν΄ λλ¦¬κ² μ΅λλ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse28"> λ€λ₯Έ μ¬λμ μ΄λ¦μΌλ‘
							λ³Έμ¬(ν΄λ¦­κ³ )μμ λ©μΌμ΄ μ€κ³  μμ΄μ. </a>
					</div>
					<div id="collapse28" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ³Έμ¬(ν΄λ¦­κ³ )μμλ νμμ λ³΄μ λ±λ‘λμ΄ μλ μ΄λ©μΌ μ£Όμ(νμ ID)λ‘ λ©μΌμ λ³΄λ΄λλ¦¬κ³  μμ΅λλ€.<br>
							κ°μμκ° λ§μ ν¬νΈμ¬μ΄νΈμ λ©μΌκ³μ μ λκ° μ«μλ μλ¬Έ νμλ¦¬λ‘ κ΅¬λΆλμ΄ λΉμ·νκ² μ΄μ©λλ κ°μμκ° λ§λ€ λ³΄λ λ€λ₯Έ
							κ³ κ°λκ»μ μ€μλ‘ λ©μΌμ£Όμλ₯Ό μλͺ» μλ ₯νμ¬ λ©μΌμ λ°μΌμλ κ²½μ°κ° μμ΅λλ€.<br> κ³ κ°λμ μ΄λ©μΌ μ£Όμλ₯Ό
							νμΈνμ  ν λ³Έμ¬(ν΄λ¦­κ³ ) κ³ κ°μΌν°(β1577-7011) λλ λͺ¨λ°μΌ μ± [κ³ κ°μΌν°> μ±νλ¬Έμ]λ‘ λ¬Έμνμλ©΄ μ μν
							μ²λ¦¬ν΄ λλ¦¬κ² μ΅λλ€.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse30"> ν΄λν° λ²νΈκ° λ³κ²½λμ΄ λ³ΈμΈνμΈμ΄
							μ λ©λλ€. </a>
					</div>
					<div id="collapse30" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ³Έμ¬(ν΄λ¦­κ³ )μ λ±λ‘λ ν΄λν° λ²νΈλ‘λ§ λ³ΈμΈνμΈμ ν  μ μμ΅λλ€.<br> <br> <br>
							β  ν΄λν° λ²νΈκ° λ³κ²½λ κ²½μ°<br> <br> 1) μ΄λ©μΌλ‘ λ³ΈμΈ νμΈ ν, λ‘κ·ΈμΈνμ¬ ν΄λν°
							λ²νΈλ₯Ό λ³κ²½ν©λλ€.<br> <br> 2) μ΄λ©μΌ λ³ΈμΈμΈμ¦μ΄ κ°λ₯νμ§ μλ€λ©΄, λ³Έμ¬(ν΄λ¦­κ³ )
							κ³ κ°μΌν°(1577-7011)λ‘ λ¬Έμνμ¬ ν΄λν° λ²νΈ λ³κ²½ ν λ€μ λ³ΈμΈνμΈμ μ§νν©λλ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse31"> λ³ΈμΈνμΈμ νλλ° μΈμ¦λ²νΈκ° μ€μ§
							μμ΅λλ€. </a>
					</div>
					<div id="collapse31" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							κΈ°μ‘΄μ λ³Έμ¬(ν΄λ¦­κ³ )μ λ±λ‘ν ν΄λν° λ²νΈκ° νμ¬ μ¬μ©νμλ ν΄λν° λ²νΈμ λ€λ₯Ό κ²½μ° μΈμ¦λ²νΈλ₯Ό λ°μ§ λͺ»ν  μ
							μμ΅λλ€.<br> <br> λ³Έμ¬(ν΄λ¦­κ³ ) κ³ κ°μΌν°(1577-7011)λ‘ λ¬Έμνμ¬ λ²νΈλ³κ²½μ
							μμ²­ν΄μ£ΌμκΈ° λ°λλλ€.<br> <br> <br> <br> λλ λ³Έμ¬(ν΄λ¦­κ³ )
							κ³ κ°μΌν° λ²νΈ(1577-7011)κ° μμ κ±°λΆ λμ΄μλμ§ νμΈν΄ μ£Όμ­μμ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse32"> λ‘κ·ΈμΈ μ, λ°λ³΅λ μΈμ¦ μ€ν¨λ‘
							μλ‘μ΄ νκ²½μμμ μ¬μ©μ΄ μ νλ©λλ€. λΌκ³  νμΈλ©λλ€. </a>
					</div>
					<div id="collapse32" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							μλ‘μ΄ νκ²½μμμ λ‘κ·ΈμΈμ΄ μ¬λ¬ μ°¨λ‘ μ€ν¨νλ©΄ κ³ κ°λμ μ λ³΄λ₯Ό λ³΄νΈνκΈ° μν΄ λ°€ 12μ μ κΉμ§ λ‘κ·ΈμΈμ μ ννκ²
							λ©λλ€.<br> <br> λ€μ λ  00μλΆν° λ‘κ·ΈμΈ μ¬μλκ° κ°λ₯νλ μ°Έκ³  λ°λλλ€.<br>
							<br> <br> λ§μ½ λ‘κ·ΈμΈμ μλν κ²μ΄ λ³ΈμΈμ΄ μλλΌλ©΄ λ³Έμ¬(ν΄λ¦­κ³ )
							κ³ κ°μΌν°(1577-7011)λ‘ λ¬Έμν΄ μ£ΌμκΈ° λ°λλλ€.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse33"> λ‘κ·ΈμΈ μ μ ν΄λν°/μ΄λ©μΌ λ³ΈμΈ
							μΈμ¦μ ν΄μΌ νλμ?. </a>
					</div>
					<div id="collapse33" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							λ‘κ·ΈμΈ μ λ³ΈμΈμΈμ¦μ νλ©΄ μλ‘μ΄ νκ²½μμ λ‘κ·ΈμΈ ν κ²μ μ μ μμ΄ κ³ κ°λμ μ λ³΄λ₯Ό λ³΄νΈν  μ μμ΅λλ€.<br>
							<br> <br> μΈμ¦ μ μΈμ¦λ²νΈλ λ¬Έμ λλ μ΄λ©μΌλ‘ μ μ‘λ©λλ€.<br> <br>
							λ§μ½ μ΄λ©μΌλ‘ μμ²­ν ν μΈμ¦ λ²νΈλ₯Ό λ°μ§ λͺ»νμ¨λ€λ©΄<br> <br> λ©μΌν¨μ μ€νΈ ν΄λμμ μλ
							μ΄λ©μΌ μ£Όμλ‘ λ°μ μ΄λ©μΌμ΄ μλ μ§ νμΈν΄ μ£Όμ­μμ€.
						</div>
					</div>
				</div>

			</c:if>



			<!-- ν΄λ¦­λΉμ¦ -->
			<c:if test="${questNum == 9}">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse34"> μ¬μμλ±λ‘μ¦μ΄ μλ κ³ μ λ²νΈμ¦μ
							μ²¨λΆν΄λ λλμ?. </a>
					</div>
					<div id="collapse34" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							κ³ μ λ²νΈ λλ κ³ μ λ²νΈμ¦μΌλ‘λ μ¬μμ κ³μ  κ°μμ΄ κ°λ₯ν©λλ€.<br> <br> λ¨, μ£Όλ―Όλ±λ‘λ²νΈκ°
							λμ€μ§ μμ κ³ μ λ²νΈμ¦(μ΅κ·Ό 3κ°μ μ΄λ΄ λ°κΈλ μ£Όλ―Όλ±λ‘λ²νΈκ° μκ±°λ κ°λ €μ§ μν)μ μλ‘λν΄μ£ΌμΈμ.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse35"> κ°μΈ νμμΌλ‘ μΌλ° νμμΌλ‘ κ°μ
							νλλ° μ¬μμ νμλ λ°λ‘ μΌλ° νμμ κ°μ ν΄μΌ νλμ? </a>
					</div>
					<div id="collapse35" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">κ°μΈ νμκ³Ό
							μ¬μμ νμμ λ€λ₯Έ νμμΌλ‘ κ΅¬λΆλ©λλ€. λ°λΌμ κ°κ° μΌλ° λ©€λ²μ­μ κ°μν΄μΌ ν©λλ€.</div>
					</div>
				</div>

			</c:if>
		</div>
	</div>
</div>


<br>
<br>

<%@ include file="../layout/footer.jsp"%>