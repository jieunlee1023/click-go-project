<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!-- 자주 묻는 질문  -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Click-go</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../image/favicon.png" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">

<!-- 드랍다운 -->
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css"
	type="text/css" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css' />


<!-- CSS 연결 -->
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/login-join-infosearch.css" rel="stylesheet"
	type="text/css" />
<link href="/css/view-more.css" rel="stylesheet" type="text/css" />
<link href="/css/board.css" rel="stylesheet" type="text/css" />
<link href="/css/storeFranchise.css" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" rel="stylesheet" type="text/css" />
<link href="/css/admin.css" rel="stylesheet" type="text/css" />
<link href="/css/store.css" rel="stylesheet" type="text/css" />
<link href="/css/store-main.css" rel="stylesheet" type="text/css" />
<link href="/css/review.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="/css/fullpage.min.css">
<link rel="stylesheet" href="/css/index.css">
<script src="/js/fullpage.min.js"></script>


<!-- 타이머  -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>

<body>


	<div id="header">
		<div class="container ">
			<div id='wrapper'>

				<div id="logo">

					<a class="navbar-brand" href="/" style="color: black"> <img
						src="/image/logo.png" alt="click-go-logo" style="width: 200px"></a>

				</div>
			</div>

			<c:choose>
				<c:when test="${empty principal}">

					<div class="nav--list">
						<ul id="nav--item">
							<li><a class="nav-link" href="/">홈</a></li>
							<li><a class="nav-link" href="/store/main">상점</a></li>
							<li id="more--view"><a class="nav-link" href="#">더보기</a>
								<ul id="nave--moreview--item">
									<li><a class="dropdown-item" href="/view-more/notice-list">공지사항</a></li>
									<li><a class="dropdown-item" href="/board/list">게시판</a></li>
									<li><a class="dropdown-item"
										href="/view-more/question-form/1">자주 묻는 질문</a></li>
									<li><a class="dropdown-item" href="/view-more/about-us">회사
											소개</a></li>
									<li><a class="dropdown-item" href="/view-more/terms-list">약관
											및 정책</a></li>
								</ul></li>
							<li><a class="nav-link" href="/auth/login-form">로그인</a></li>
						</ul>
					</div>
				</c:when>


				<c:when test="${principal.user.role eq 'ADMIN'}">
					<div class="nav--list">
						<ul id="nav--item">
							<li><a class="nav-link" href="/">홈</a></li>
							<li><a class="nav-link" href="/store/main">상점</a></li>
							<li><a class="nav-link"
								href="/storeFranchise/store-franchise-list">가맹점 목록</a></li>
							<li id="more--view"><a class="nav-link" href="#">더보기</a>
								<ul id="nave--moreview--item">
									<li><a class="dropdown-item" href="/view-more/notice-list">공지사항</a></li>
									<li><a class="dropdown-item" href="/board/list">게시판</a></li>
									<li><a class="dropdown-item"
										href="/view-more/question-form/1">자주 묻는 질문</a></li>
									<li><a class="dropdown-item" href="/view-more/about-us">회사
											소개</a></li>
									<li><a class="dropdown-item" href="/view-more/terms-list">약관
											및 정책</a></li>
								</ul></li>
							<li><a class="nav-link" href="/admin/main">관리자</a></li>
							<li><a class="nav-link" href="/logout">로그아웃</a></li>
						</ul>
					</div>
				</c:when>

				<c:otherwise>
					<div class="nav--list">
						<ul id="nav--item">
							<li><a class="nav-link" href="/">홈</a></li>
							<li><a class="nav-link" href="/store/main">상점</a></li>
							<li id="more--view"><a class="nav-link" href="#">가맹점</a>
								<ul id="nave--moreview--item">
									<li><a class="nav-link"
										href="/storeFranchise/store-franchise-apply">가맹점 신청</a></li>
									<li><a class="nav-link"
										href="/storeFranchise/store-franchise-applyList">가맹점 신청목록</a></li>
								</ul></li>
							<li id="more--view"><a class="nav-link" href="#">더보기</a>
								<ul id="nave--moreview--item">
									<li><a class="dropdown-item" href="/view-more/notice-list">공지사항</a></li>
									<li><a class="dropdown-item" href="/board/list">게시판</a></li>
									<li><a class="dropdown-item"
										href="/view-more/question-form/1">자주 묻는 질문</a></li>
									<li><a class="dropdown-item" href="/view-more/about-us">회사
											소개</a></li>
									<li><a class="dropdown-item" href="/view-more/terms-list">약관
											및 정책</a></li>
									<li><a class="dropdown-item"
										href="/view-more/one-to-one-ask">1:1 문의</a></li>
								</ul></li>
							<li><a class="nav-link" href="/mypage">내 정보</a></li>
							<li><a class="nav-link" href="/logout">로그아웃</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript">
		function caution() {
		
				Swal.fire({
				title : '${caution.content}',
				text : '반성하시고 계십니까?',
				icon : 'error',

				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '네 죄송합니다.',
				cancelButtonText : '아니요.'
		}).then(result => {
			 if (result.isConfirmed) {
			 Swal.fire('죄송하다고 하시니 넘어가드립니다.', '진상 짓 하지마세요.. 다시 로그인 해주세요.', 'success').then(out => {
				$.ajax({
					type: 'GET',
					url: '/admin/cancel-caution'
				}).done(function(data) {
					if (data.httpStatus) {
						location.href = data.body;
					}
				}).fail();
			 });
			 } else if (result.isDismissed) {
				 caution();
			 }
			});
		};
		
		$(this).ready(function() {
		 	var cautionStatus = '${principal.user.cautionStatus}';
			if (cautionStatus == 'true') {
			caution();
			}
		});
	</script>