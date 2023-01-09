<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container" id="f-a-question">

	<div id="view-more-title">
		<div>📫 자주 묻는 질문</div>
	</div>
	<br>


	<div class="d-flex justify-content-center">

		<!-- 이용문의 -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/1'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop1">이용 및 결제</button>

		<!-- 회원가입 -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/2'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">회원가입 및 탈퇴</button>

		<!-- 회원정보 -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/3'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">회원정보 및 인증</button>


		<!-- 질문9 -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/9'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">클릭 비즈</button>

		<!-- 리워드 프로그램 -->
		<button type="button"
			onclick="location.href = '/view-more/question-form/10'"
			class="btn btn-outline-dark mx-2" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">리워드 프로그램</button>
	</div>

	<hr>
	<!-- 접기 -->

	<div class="container">
		<div id="accordion">

			<c:if test="${questNum == 1}">

				<div class="card">
					<div class="card-header">
						<a class="card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse1"> 고객센터 연결 지연 시 어떻게
							하나요? </a>
					</div>
					<div id="collapse1" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수 있습니다.<br>클릭고는 전화 상담 외에도 다양한
							방식으로 상담이 가능하오니 연결 지연 시 1:1문의, 카카오톡을 통해 상담을 부탁드립니다.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse3"> 정보를 공유하는 기능이 있나요? </a>
					</div>
					<div id="collapse3" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							상세페이지 > 오른쪽 상단의 공유하기 아이콘을 클릭하시면 카카오톡, 문자메시지로 빠르게 공유할 수 있습니다.<br>
							클릭고의 공유 기능을 통해 주변 지인들에게 위치를 공유해 보세요!
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse5"> 현금영수증 발급받고 싶어요. </a>
					</div>
					<div id="collapse5" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							소셜 회원의 현금영수증은 현금성 결제수단으로 결제 시 발급이 가능합니다.<br> <br> 결제
							단계에서 현금영수증을 신청하면 자동으로 발행되지만,<br> 신청을 누락했거나 발행받지 못한 경우라면 영수증
							확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다.<br> <br> [네이버페이]<br>
							- 결제 단계에서 현금영수증 신청하면 자동으로 발행 (19년 12월 26일 시행)<br> - 자진발급 :
							네이버페이 > 결제내역 > 주문건 > 주문상세정보 > 영수증 발급내역 > 현금영수증 확인<br> - 단,
							19년 12월 26일 10시 이전 결제 건은 클릭고 고객행복센터로 요청<br> <br>
							[간편계좌이체 / TOSS / PAYCO]<br> - 결제 단계에서 현금영수증 신청하면 자동으로 발행<br>
							- 단, 간편계좌이체의 경우 신청 누락 시 클릭고 고객행복센터로 요청<br> <br> [카카오페이]<br>
							- 카카오페이머니 결제 시 자동으로 발행<br> - 자진발급 : 카카오톡 > pay > 우측톱니바퀴(나의
							카카오페이) > 이용내역 > 결제 > 개별 상세내역 > 현금영수증 확인
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse6"> 결제 영수증 발급받고 싶어요. </a>
					</div>
					<div id="collapse6" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">결제 영수증은
							결제수단에 따라 확인/발급 방법이 상이하오니 아래 내용을 참고해 주시기 바랍니다. [신용/체크카드/KB pay] -
							클릭고 앱 > 하단 내정보 > 예약/구매내역 > 결제 증빙 보기 - 예약내역이 삭제되었을 경우 토스페이먼츠
							홈페이지에서 조회 [휴대폰 결제, PAYCO, 카카오페이, 토스, 간편계좌이체] - 클릭고 앱 > 하단 내정보 >
							예약/구매내역 > 결제 증빙 보기 - 예약내역이 삭제되었을 경우 각 결제 대행사 홈페이지에서 조회 [네이버페이] -
							네이버페이 > 결제내역 > 상품 > 결제 상세 > 영수증 조회</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse7"> 계좌 등록 후 은행에서 문자가
							왔어요. </a>
					</div>
					<div id="collapse7" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							간편계좌이체, TOSS에 계좌 등록 시 은행에서 자동이체 서비스가 등록되었다는 문자가 발송될 수 있습니다.<br>
							<br> 매달 일정 금액이 자동이체 되는 것이 아니라, 결제 시 비밀번호 인증 후 이체되는 서비스이니
							안심하고 이용해주시길 바랍니다.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse8"> 간편계좌이체 등록 해지는 어떻게
							하나요? </a>
					</div>
					<div id="collapse8" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							숙소 예약 페이지 내에서 변경이 가능합니다.<br> <br> [해지 방법]<br> 예약
							페이지 > 간편계좌이체 결제수단 선택 > 결제하기 버튼 > 해지할 은행 선택> 계좌/비밀번호 관리 메뉴에서 해지 가능<br>
							*결제완료전 단계로 실제 결제가 발생되지 않습니다.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse9"> 사용가능한 카드 종류가 없어요. </a>
					</div>
					<div id="collapse9" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							클릭고 예약 서비스 결제 시 사용 가능한 카드 종류는 PG사(전자결제 대행사)에서 정하는 부분이므로 일부 카드는
							결제지원이 불가할 수 있습니다.<br> <br> IBK기업은행 카드의 경우 목록에서 비씨를
							선택하시면 결제 가능하오니 이용에 참고 부탁드립니다.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse10"> '영수증 확인하기' 누르면 흰색
							화면만 보여요. </a>
					</div>
					<div id="collapse10" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							사용하는 모바일 브라우저의 팝업이 차단되었을 경우, 빈 화면만 보이거나 하얗게 보일 수 있습니다.<br> <br>
							모바일 브라우저의 팝업을 허용 한 후 다시 한 번 시도 부탁드립니다.<br> <br> [안드로이드]<br>
							사용하는 모바일 브라우저 설정 > 사이트 설정 > 팝업 허용<br> <br> [아이폰]<br>
							아이폰 > 설정 > Safari > 팝업 허용<br>
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse11"> 간편계좌이체 한도 초과로 결제가
							불가해요. </a>
					</div>
					<div id="collapse11" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							간편계좌이체 한도는 1일 1회 2백만원, 월 5백만원으로 설정되어 있습니다.<br> <br> 은행
							이체 한도와는 관계없이 간편계좌이체 거래금액 한도 초과 시 결제가 불가하오니 이 경우 다른 결제수단을 사용하여 이용해
							주시길 바랍니다.
						</div>
					</div>
				</div>
			</c:if>

			<!-- 회원가입 -->
			<c:if test="${questNum == 2}">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse16"> 인증된 아이디가 이미 존재한다고
							나옵니다. </a>
					</div>
					<div id="collapse16" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							본인인증 시도 시 "회원님 명의로 인증된 아이디가 이미 존재합니다."로 안내되는 경우,<br> 고객님의
							정보로 이미 가입된 다른 아이디가 존재하는 것이기 때문에 새로 본인인증을 받을 수 없습니다.<br> 이미
							가입된 아이디를 사용해주시고, 비밀번호를 모르시는 경우 로그인 창에서 를 이용해주세요.<br>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse17"> 아이디를 여러개 사용할 수
							있나요? </a>
					</div>
					<div id="collapse17" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							인증을 받지 않은 아이디는 여러 개 보유할 수 있지만, 상품 구매를 위해서는 본인인증이 필요합니다.<br>
							구매 활동에 대한 정확한 안내를 위하여 1인당 1개의 아이디만 사용하실 것을 권장합니다.<br> 이미
							가입(인증)한 아이디가 있으나 아이디가 기억나지 않으실 경우 []를 이용해 주시기 바랍니다.<br> <br>
							■클릭고 아이디 찾기<br> • 로그인 > [아이디(이메일)/비밀번호 찾기] 버튼 클릭 >
							[아이디(이메일)을 잊어버렸습니다] 클릭<br>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse18"> 외국인도 회원가입을 할 수
							있나요? </a>
					</div>
					<div id="collapse18" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							국내에 거주하는 외국인 고객님은 회원가입이 가능합니다.<br> ※ 단, 주문 관련(구매확인/결제/반품/환불
							등) 중요 정보 안내를 위해 휴대폰 인증이 필요하며, 인증이 되지 않을 시 서비스에 제한이 있을 수 있습니다<br>
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse19"> 제 명의로 가입된 휴대폰번호가
							없습니다. 다른 사람의 휴대폰번호를 사용해도 되나요? </a>
					</div>
					<div id="collapse19" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							다른 사람의 휴대폰번호로 등록하여 사용하실 수 있습니다.<br> 다만, 등록된 휴대폰번호로 구매 및
							취소정보, 티켓번호, 주요 서비스 정책 변경 등의 중요한 정보를 안내해 드리므로 최대한 가입자 본인 명의의 정보를
							입력해 주시기 바랍니다.<br> <br> 또한 일부 서비스(정기배송, 성인용품구매)의 경우 인증된
							본인에 한하여 제공 가능한 점 확인 부탁드립니다.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse20"> 회원가입은 어떻게 하나요? </a>
					</div>
					<div id="collapse20" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							회원가입 방법 안내 드립니다.<br> <br> <br> 클릭고 회원가입하기<br>
							<br> <br> App<br> <br> • 클리고 > 오른쪽 상단 [로그인]
							버튼 클릭 > 버튼 클릭<br> <br> <br> Web<br> <br>
							• 클릭고 웹사이트 오른쪽 상단 버튼 클릭<br> <br> <br> ※ 회원가입 시,
							이메일 및 휴대폰 번호는 반드시 실제 본인의 정보를 입력해주시기 바랍니다.<br> <br> ※ 회원
							가입 후 첫 구매 시, 휴대폰 본인 인증이 진행됩니다.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse29"> 탈퇴하면 개인정보는 모두
							삭제되나요? </a>
					</div>
					<div id="collapse29" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							회원 탈퇴하는 방법은 다음과 같습니다.<br> 탈퇴 시 회원 전용 웹 서비스 이용이 불가합니다.<br>
							탈퇴 전 하기 유의사항을 반드시 확인해 주시기 바랍니다.<br> <br> ■회원 탈퇴 시 유의 사항<br>
							1. 개인정보<br> 1) 회원탈퇴와 함께 고객님의 개인정보는 완전 삭제되어 재가입을 해도 구매내역 확인이
							불가합니다.<br> 2) 「개인정보보호법」및 「전자상거래 등에서 소비자 보호에 관한 법률」에 따라 거래정보는
							법에서 정해진 기간까지 별도로 보관될 수 있습니다.<br> <br> 2. 결제/환불<br>
							1) 이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.<br> 2) 유효기간이 경과되지 않은 미사용
							쿠폰(티켓) 관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.<br>
							※ 유효기간 내 사용하지 못한 미사용 쿠폰은 구매금액의 70%를 본사(클릭고) 캐시로 적립해 드리나, 탈퇴 시 적립
							받을 수 없습니다.
						</div>
					</div>
				</div>
			</c:if>

			<!-- 회원정보 -->
			<c:if test="${questNum == 3}">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse21"> 광고성 이메일과 문자를 받지
							않으려면 어떻게 하나요? </a>
					</div>
					<div id="collapse21" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							마이본사(클릭고)에서 광고성 정보 수신 동의를 철회하시면 됩니다.<br> 수신 동의 철회 시, 2~3일
							이후부터 광고성 이메일/문자가 발송되지 않습니다.<br> ※ 구매 정보 및 서비스 주요 정책 변경 등의
							정보성 안내 메일은 수신 동의와 무관하게 발송됩니다.<br> ※ 구매 활동과 관련된 알림을 수신하시려면
							본사(클릭고) 앱 > 마이본사(클릭고)에서 모바일 알림(App Push)을 설정해 주시기 바랍니다.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse22"> 개인정보와 관련된 피해를 입은
							경우 어떻게 하나요? </a>
					</div>
					<div id="collapse22" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							본사(클릭고)은 고객님의 개인정보를 [개인정보 취급방침] 에서 고지한 범위 내에서 사용하며 고지한 범위를 초과하여
							이용하거나, 타인 또는 타기업, 기관에 제공하지 않습니다.<br> <br> ※ 만일 회원 아이디와
							비밀번호의 불법 도용 등 회원정보와 관련한 피해가 발생한 경우에는 바로 본사(클릭고) 고객센터(☎1577-7011)
							또는 모바일 앱 [고객센터> 채팅문의]를 통해 피해 내용을 알려주시기 바랍니다.<br> <br> ※
							개인정보와 관련하여 분쟁이 있는 경우에는 2차 민원처리 기관인 개인정보보호진흥원(KISA)의 개인정보분쟁조정위원회로
							개인정보 민원신청을 하실 수 있습니다.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse23"> 회원정보 수정은 어떻게 하나요?
						</a>
					</div>
					<div id="collapse23" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							마이본사(클릭고)의 회원정보 수정란에서 이름(개명), 아이디(이메일), 휴대폰 번호, 비밀번호, 주소록/배송지 수정이
							가능합니다.<br> <br> <br> ■회원정보 수정하기<br> APP<br>
							• > 비밀번호 입력<br> Web<br> • > 비밀번호 입력<br> <br>
							<br> ■이름 변경하기<br> • 실명 등록기관에 개명 정보가 없을 경우 이름 변경이 불가합니다.<br>
							• 실명 등록기관에 개명 정보가 등록되지 않은 경우 실명 등록센터에서 실명 등록을 마친 후, 정보 변경을 해주시기
							바랍니다.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse24"> 본인명의 휴대폰인증이 안되는
							경우도 있나요? </a>
					</div>
					<div id="collapse24" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							타인 및 법인 명의, 일시정지된 휴대폰 등의 경우 휴대폰 인증을 할 수 없습니다.<br> <br>
							<br> ■본인명의 인증이 불가한 기기(휴대폰)<br> • 선불 휴대폰<br> <br>
							<br> ■본인인증이 불가능한 상태<br> • 분실 또는 일지정지(이용자의 요청 또는 미납 상태)
							상태<br> • 법인 명의로 개통<br> • 이동 통신사에 미등록된 휴대폰(해지 또는 미개통)
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse25"> 아이디(이메일) 변경 인증메일이
							오지 않았어요. </a>
					</div>
					<div id="collapse25" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							각 메일 서비스에 따라 메일 도착 시간이 조금 지연될 수 있습니다.<br> 메일이 도착하지 않을 경우
							스팸메일함을 확인해 보시거나 본사(클릭고)의 메일 주소가 수신 차단되어 있지 않은 지 확인해 주시기 바랍니다.
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse26"> 로그인 하지 않았는데, 자동으로
							로그인됩니다. </a>
					</div>
					<div id="collapse26" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							로그인 창에서 '자동 로그인'을 체크한 경우 아이디(이메일)과 비밀번호를 입력하지 않아도 로그인 상태가 유지됩니다.<br>
							'자동 로그인' 기능을 원치 않는 경우에는 로그아웃 후, 로그인 창에서 '자동로그인' 체크 해제를 해주시면 됩니다.<br>
							<br> ※ 개인정보보호를 위해 여러 사람이 함께 사용하는 공용 PC, 모바일에서는 사용을 제한해 주시기
							바랍니다.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse27"> 본사(클릭고)에서 결제하지
							않았는데 결제되었다는 연락을 받았어요. </a>
					</div>
					<div id="collapse27" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							본사(클릭고)에서는 회원가입을 진행해야 상품 주문 및 결제가 가능합니다.<br> 주문하지 않았으나
							결제되었다는 카드사 및 은행사 문자가 왔다면 아래의 내용을 확인 바랍니다.<br> <br> -
							가족, 친인척 등 지인과 함께 아이디를 사용할 경우<br> - 이전에 신청한 정기배송 상품이 자동 결제된
							경우<br> <br> ※ 위 사항을 모두 확인했음에도 주문 및 결제 내역이 파악 되지 않는
							경우에는, 카드 승인번호 및 문자 수신 내역을 확인하시어 본사(클릭고) 고객센터(☎1577-7011) 또는 모바일 앱
							[고객센터> 채팅문의]로 문의하시면 신속히 처리해 드리겠습니다.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse28"> 다른 사람의 이름으로
							본사(클릭고)에서 메일이 오고 있어요. </a>
					</div>
					<div id="collapse28" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							본사(클릭고)에서는 회원정보에 등록되어 있는 이메일 주소(회원 ID)로 메일을 보내드리고 있습니다.<br>
							가입자가 많은 포털사이트의 메일계정은 대개 숫자나 영문 한자리로 구분되어 비슷하게 이용되는 가입자가 많다 보니 다른
							고객님께서 실수로 메일주소를 잘못 입력하여 메일을 받으시는 경우가 있습니다.<br> 고객님의 이메일 주소를
							확인하신 후 본사(클릭고) 고객센터(☎1577-7011) 또는 모바일 앱 [고객센터> 채팅문의]로 문의하시면 신속히
							처리해 드리겠습니다.
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse30"> 휴대폰 번호가 변경되어 본인확인이
							안 됩니다. </a>
					</div>
					<div id="collapse30" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							본사(클릭고)에 등록된 휴대폰 번호로만 본인확인을 할 수 있습니다.<br> <br> <br>
							■ 휴대폰 번호가 변경된 경우<br> <br> 1) 이메일로 본인 확인 후, 로그인하여 휴대폰
							번호를 변경합니다.<br> <br> 2) 이메일 본인인증이 가능하지 않다면, 본사(클릭고)
							고객센터(1577-7011)로 문의하여 휴대폰 번호 변경 후 다시 본인확인을 진행합니다.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse31"> 본인확인을 하는데 인증번호가 오지
							않습니다. </a>
					</div>
					<div id="collapse31" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							기존에 본사(클릭고)에 등록한 휴대폰 번호가 현재 사용하시는 휴대폰 번호와 다를 경우 인증번호를 받지 못할 수
							있습니다.<br> <br> 본사(클릭고) 고객센터(1577-7011)로 문의하여 번호변경을
							요청해주시기 바랍니다.<br> <br> <br> <br> 또는 본사(클릭고)
							고객센터 번호(1577-7011)가 수신거부 되어있는지 확인해 주십시오.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse32"> 로그인 시, 반복된 인증 실패로
							새로운 환경에서의 사용이 제한됩니다. 라고 확인됩니다. </a>
					</div>
					<div id="collapse32" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							새로운 환경에서의 로그인이 여러 차례 실패하면 고객님의 정보를 보호하기 위해 밤 12시 전까지 로그인을 제한하게
							됩니다.<br> <br> 다음 날 00시부터 로그인 재시도가 가능하니 참고 바랍니다.<br>
							<br> <br> 만약 로그인을 시도한 것이 본인이 아니라면 본사(클릭고)
							고객센터(1577-7011)로 문의해 주시기 바랍니다.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse33"> 로그인 시 왜 휴대폰/이메일 본인
							인증을 해야 하나요?. </a>
					</div>
					<div id="collapse33" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							로그인 시 본인인증을 하면 새로운 환경에서 로그인 한 것을 알 수 있어 고객님의 정보를 보호할 수 있습니다.<br>
							<br> <br> 인증 시 인증번호는 문자 또는 이메일로 전송됩니다.<br> <br>
							만약 이메일로 요청한 후 인증 번호를 받지 못하셨다면<br> <br> 메일함의 스팸 폴더에서 아래
							이메일 주소로 받은 이메일이 있는 지 확인해 주십시오.
						</div>
					</div>
				</div>

			</c:if>



			<!-- 클릭비즈 -->
			<c:if test="${questNum == 9}">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse34"> 사업자등록증이 아닌 고유번호증을
							첨부해도 되나요?. </a>
					</div>
					<div id="collapse34" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">
							고유번호 또는 고유번호증으로도 사업자 계정 가입이 가능합니다.<br> <br> 단, 주민등록번호가
							나오지 않은 고유번호증(최근 3개월 이내 발급된 주민등록번호가 없거나 가려진 상태)을 업로드해주세요.
						</div>
					</div>
				</div>



				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link d-flex justify-content-center"
							data-toggle="collapse" href="#collapse35"> 개인 회원으로 일반 회원으로 가입
							했는데 사업자 회원도 따로 일반 회원에 가입 해야 하나요? </a>
					</div>
					<div id="collapse35" class="collapse" data-parent="#accordion">
						<div class="card-body d-flex justify-content-center">개인 회원과
							사업자 회원은 다른 회원으로 구분됩니다. 따라서 각각 일반 멤버십을 가입해야 합니다.</div>
					</div>
				</div>

			</c:if>
		</div>
	</div>
</div>


<br>
<br>

<%@ include file="../layout/footer.jsp"%>