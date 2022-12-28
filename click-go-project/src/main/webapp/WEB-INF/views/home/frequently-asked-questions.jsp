<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<style>
* {
	font-family: 'Gowun Batang', sans-serif;
}

.mybtns {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.mybtns>button {
	margin-right: 10px;
}
</style>

</head>

<body>

	<p></p>

	<nav class="navbar navbar-dark bg-white">
		<!-- Navbar content -->
	</nav>
	<hr>

	<div class="d-flex justify-content-center">

		<!-- 이용문의 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/1'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop1">이용문의</button>


		<!-- 편의점 버튼-->
		<button type="button"
			onclick="location.href = '/home/board/question-form/2'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">결제 영수증</button>


		<!-- 질문1 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/3'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문1</button>


		<button type="button"
			onclick="location.href = '/home/board/question-form/4'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문2</button>


		<!-- 질문5 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/5'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문5</button>




		<!-- 질문6 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/6'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문6</button>




		<!-- 질문7 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/7'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문7</button>

		<!-- 질문8 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/8'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문8</button>

		<!-- 질문9 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/9'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문5</button>

		<!-- 질문10 -->
		<button type="button"
			onclick="location.href = '/home/board/question-form/2'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">질문10</button>
	</div>
	<hr>



	<!-- 접기 -->
	<div id="accordion">

		<c:if test="${questNum == 1}">
			<div class="card">
				<div class="card-header">
					<a class="card-link d-flex justify-content-center"
						data-toggle="collapse" href="#collapseOne"> [이용문의] 고객센터 연결 지연
						시 어떻게 하나요? </a>
				</div>
				<div id="collapseOne" class="collapse show" data-parent="#accordion">
					<div class="card-body d-flex justify-content-center">
						일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수 있습니다.<br>여기어때는 전화 상담 외에도 다양한
						방식으로 상담이 가능하오니 연결 지연 시 1:1문의, 카카오톡을 통해 상담을 부탁드립니다.
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link d-flex justify-content-center"
						data-toggle="collapse" href="#collapseTwo"> [이용문의] 어떻게하면 엘리트가
						될 수 있나요? </a>
				</div>
				<div id="collapseTwo" class="collapse" data-parent="#accordion">
					<div class="card-body d-flex justify-content-center">
						여기어때를 통해 국내 숙소/모바일티켓 상관없이 실 결제금액 3만원 이상 5번을 예약하면 자동 등업되어 엘리트가 됩니다.<br>나의
						적립 상태는 앱 하단 내정보 > 엘리트 메뉴에서 확인해 주세요!<br> 공간대여/실시간 렌터카 상품은 엘리트
						적립에서 제외되니 참고바랍니다.
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link d-flex justify-content-center"
						data-toggle="collapse" href="#collapseThree"> [회원정보] 회원탈퇴는 어떻게
						하나요? </a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body d-flex justify-content-center">
						회원탈퇴는 아래 방법을 통해 가능하며, 반드시 주의사항을 확인 후 진행해 주시기 바랍니다.<br>
						<br> [일반회원]<br> - 여기어때 앱/웹 > 내정보 > 내정보 관리 > 회원탈퇴 <br>
						<br> [기업회원]<br> - 개별적으로 회원탈퇴 불가<br> - 기업 담당자 문의 또는
						여기어때 고객행복센터로 기업회원 탈퇴요청<br>
						<br> *주의사항<br> · 회원탈퇴 시 계정 정보는 복구가 불가하며 1일 이후 재가입이
						가능합니다.<br> · 현재 보유 중인 포인트, 쿠폰은 모두 소멸되며 복구할 수 없습니다.<br> ·
						탈퇴 후, 기존 가입 휴대기기로 재가입 시 첫 혜택을 받을 수 없습니다. (신규 회원 쿠폰, 첫 리뷰 작성
						1,000포인트 등)<br> · 등록된 리뷰는 자동으로 삭제되지 않습니다. 삭제를 원하실 경우 탈퇴 전
						개별적으로 삭제해 주시기 바랍니다.<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link d-flex justify-content-center"
						data-toggle="collapse" href="#collapseThree"> [회원정보] 소셜회원 로그인
						해제는 어떻게 하나요? </a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body d-flex justify-content-center">소셜 회원의
						로그인은 가입 시 연동 된 계정으로 자동 로그인 됩니다. 동일한 소셜의 다른 계정으로 로그인을 원하시는 경우 연동
						로그인 해제 후 접속을 원하는 계정으로 로그인을 시도해 주시길 바랍니다. [네이버] ① 여기어때 APP내 로그인
						되어있는 이메일 주소로 네이버 로그인 진행 ② 네이버 설정 접속 후 내정보/보안기능 접속 ③ 네이버와 연결된 서비스
						관리 선택 ④ 여기어때 선택 후 정보 제공 철회 버튼 클릭 -> 여기어때 APP 재접속 후 원하는 네이버 연동 아이디
						선택 후 로그인 가능 [카카오톡] ① 여기어때 APP내 로그인 되어있는 카카오 계정으로 카카오톡 접속 ② 카카오톡 전체
						설정 선택 후 개인/보안 클릭 ③ 개인정보 관리 선택 후 카카오계정 및 연결된 서비스 접속 ④ 연결된 서비스 관리에서
						여기어때 선택 후 모든 정보 삭제 클릭 -> 여기어때 APP 재접속 후 원하는 네이버 연동 아이디 선택 후 로그인 가능

						[구글] ① 여기어때 APP내 로그인 되어있는 ID로 구글 접속 ② 구글 설정 선택 후 앱과 웹사이트 접속 ③ 구글
						계정으로 로그인한 앱 및 웹사이트 클릭 후 여기어때 삭제 -> 여기어때 APP 재접속 후 원하는 구글 연동 아이디 선택
						후 로그인 가능</div>
				</div>
			</div>




		</c:if>


		<c:if test="${questNum == 2}">

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link d-flex justify-content-center"
						data-toggle="collapse" href="#collapseThree"> [회원정보] 소셜회원 로그인
						해제는 어떻게 하나요? </a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body d-flex justify-content-center">소셜 회원의
						로그인은 가입 시 연동 된 계정으로 자동 로그인 됩니다. 동일한 소셜의 다른 계정으로 로그인을 원하시는 경우 연동
						로그인 해제 후 접속을 원하는 계정으로 로그인을 시도해 주시길 바랍니다. [네이버] ① 여기어때 APP내 로그인
						되어있는 이메일 주소로 네이버 로그인 진행 ② 네이버 설정 접속 후 내정보/보안기능 접속 ③ 네이버와 연결된 서비스
						관리 선택 ④ 여기어때 선택 후 정보 제공 철회 버튼 클릭 -> 여기어때 APP 재접속 후 원하는 네이버 연동 아이디
						선택 후 로그인 가능 [카카오톡] ① 여기어때 APP내 로그인 되어있는 카카오 계정으로 카카오톡 접속 ② 카카오톡 전체
						설정 선택 후 개인/보안 클릭 ③ 개인정보 관리 선택 후 카카오계정 및 연결된 서비스 접속 ④ 연결된 서비스 관리에서
						여기어때 선택 후 모든 정보 삭제 클릭 -> 여기어때 APP 재접속 후 원하는 네이버 연동 아이디 선택 후 로그인 가능

						[구글] ① 여기어때 APP내 로그인 되어있는 ID로 구글 접속 ② 구글 설정 선택 후 앱과 웹사이트 접속 ③ 구글
						계정으로 로그인한 앱 및 웹사이트 클릭 후 여기어때 삭제 -> 여기어때 APP 재접속 후 원하는 구글 연동 아이디 선택
						후 로그인 가능</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link d-flex justify-content-center"
						data-toggle="collapse" href="#collapseThree"> 결제 영수증 발급받고 싶어요. </a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body d-flex justify-content-center" style="background: #d5d5d5">
					결제 영수증은 결제수단에 따라 확인/발급 방법이 상이하오니 아래 내용을 참고해 주시기 바랍니다.

					[신용/체크카드/KB pay]
					- 여기어때 앱 > 하단 내정보 > 예약/구매내역 > 결제 증빙 보기
					- 예약내역이 삭제되었을 경우 토스페이먼츠 홈페이지에서 조회
					
					[휴대폰 결제, PAYCO, 카카오페이, 토스, 간편계좌이체]
					- 여기어때 앱 > 하단 내정보 > 예약/구매내역 > 결제 증빙 보기
					- 예약내역이 삭제되었을 경우 각 결제 대행사 홈페이지에서 조회
					
					[네이버페이]
					- 네이버페이 > 결제내역 > 상품 > 결제 상세 > 영수증 조회
					</div>
				</div>
			</div>

		</c:if>
		




	</div>
	<!-- </div> -->




	<%@ include file="../layout/footer.jsp"%>