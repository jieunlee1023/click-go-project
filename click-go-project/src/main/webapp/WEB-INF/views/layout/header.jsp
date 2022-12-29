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

<title>Click-go</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link href="../image/favicon.png" rel="shortcut icon"
	type="image/x-icon">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<!-- 자주 묻는 질문  -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS 연결 -->
<link href="/css/common.css" rel="stylesheet" type="text/css" />	
<link href="/css/search.css" rel="stylesheet" type="text/css" />	
</head>

<body>

	<input type="hidden" value="${nowPage}" id="nowPage">

	<div id='wrapper'>

		<nav class="navbar navbar-expand-md " style="padding-top: 10px;">

			<div class="d-flex justify-content-center ">

				<a class="navbar-brand" href="/" style="color: black"> <img
					src="/image/favicon.png" alt="logo" style="width: 50px;"
					class="m-2">Click Go
				</a>

			</div>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"> <img
					src="/image/menu.png" width="30px" height="30px">
				</span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<nav class="navbar navbar-expand-sm navbar-light"
					style="color: black">
					<ul class="navbar-nav">

						<!-- 검색 애니메이션 -->

						<c:choose>
							<c:when test="${empty principal}">

								<!-- 검색 애니메이션 -->
								<li>
									<div class="search-box">
										<form action="#" method="get">
											<button class="btn-search" type="button">
												<img class="search-img" alt="검색" src="/image/search.png"
													width="18px">
											</button>
											<input type="text" class="input-search">
										</form>
									</div>
								</li>

								<li class="nav-item " role="button"><a class="nav-link"
									href="/" id="li--home">홈</a></li>
								<li class="nav-item" role="button"><a class="nav-link"
									href="/store/main" id="li--store">상점</a></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown">
										더보기 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item"
											href="/view-more/about-us"
											id="li--about-us">회사 소개</a> <a class="dropdown-item"
											href="/board/board-list" id="li--board">게시판</a>
										<a class="dropdown-item" href="#">1:1문의</a> <a
											class="dropdown-item" href="/view-more/question-form/1">자주
											묻는 질문</a>


									</div></li>




								<li class="nav-item"><a class="nav-link"
									href="/auth/login-form" id="li--content">로그인</a></li>

							</c:when>

							<c:when test="${principal.user.role == 'ADMIN'}">

								<!-- 검색 애니메이션 -->
								<li>
									<div class="search-box">
										<form action="#" method="get">
											<button class="btn-search" type="button">
												<img class="search-img" alt="검색" src="/image/search.png"
													width="18px">
											</button>
											<input type="text" class="input-search">
										</form>
									</div>
								</li>


								<li class="nav-item">
									<form action="/storeFranchise/store-franchise-message"
										method="get">
										<div class="nav-btn justify-content-bottom" id="notification"
											style="position: relative; margin: 0px">
											<button class="btn" type="submit">
												<img alt="메시지" src="/image/msg.png" width="20px"
													height="20px"><span class="note-num">${message.size()}</span>
											</button>
										</div>
									</form>
								</li>

								<li class="nav-item " role="button"><a class="nav-link"
									href="/" id="li--home">홈</a></li>
								<li class="nav-item" role="button"><a class="nav-link"
									href="/store/main" id="li--store">상점</a></li>




								<li class="nav-item"><a class="nav-link"
									href="/storeFranchise/store-franchise-list"
									id="li--content">가맹점 목록</a></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown">
										더보기 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item"
											href="/view-more/about-us"
											id="li--about-us">회사 소개</a> <a class="dropdown-item"
											href="/board/board-list" id="li--board">게시판</a>
										<a class="dropdown-item" href="#">1:1문의</a> <a
											class="dropdown-item" href="/view-more/question-form/1">자주
											묻는 질문</a>
									</div></li>


								<input type="hidden" value="${principal.user.role}" name="role">

								<li class="nav-item"><a class="nav-link"
									href="/mypage?role=${principal.user.role}" id="li--content">내
										정보</a></li>

								<li class="nav-item"><a class="nav-link" href="/m-logout"
									id="li--content">로그아웃</a></li>

							</c:when>




							<c:when test="${principal.user.role == 'HOST'}">

								<!-- 검색 애니메이션 -->
								<li>
									<div class="search-box">
										<form action="#" method="get">
											<button class="btn-search" type="button">
												<img class="search-img" alt="검색" src="/image/search.png"
													width="18px">
											</button>
											<input type="text" class="input-search">
										</form>
									</div>
								</li>

								<li class="nav-item " role="button"><a class="nav-link"
									href="/" id="li--home">홈</a></li>
								<li class="nav-item" role="button"><a class="nav-link"
									href="/store/main" id="li--store">상점</a></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown">
										가맹점 </a>
									<div class="dropdown-menu">
										<a class="nav-link"
											href="/storeFranchise/store-franchise-my"
											id="li--content">내 가게</a> <a class="nav-link"
											href="/storeFranchise/store-franchise-apply"
											id="li--content">가맹점 신청</a> <a class="nav-link"
											href="/storeFranchise/store-franchise-applyList"
											id="li--content">가맹점 신청목록</a>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown">
										더보기 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item"
											href="/view-more/about-us"
											id="li--about-us">회사 소개</a> <a class="dropdown-item"
											href="/board/board-list" id="li--board">게시판</a>
										<a class="dropdown-item" href="#">1:1문의</a> <a
											class="dropdown-item" href="/view-more/question-form/1">자주
											묻는 질문</a>
									</div></li>



								<input type="hidden" value="${principal.user.role}" name="role">

								<li class="nav-item"><a class="nav-link"
									href="/mypage?role=${principal.user.role}" id="li--content">내
										정보</a></li>

								<li class="nav-item"><a class="nav-link" href="/m-logout"
									id="li--content">로그아웃</a></li>

							</c:when>

							<c:otherwise>

								<!-- 검색 애니메이션 -->
								<li>
									<div class="search-box">
										<form action="#" method="get">
											<button class="btn-search" type="button">
												<img class="search-img" alt="검색" src="/image/search.png"
													width="18px">
											</button>
											<input type="text" class="input-search">
										</form>
									</div>
								</li>

								<li class="nav-item " role="button"><a class="nav-link"
									href="/" id="li--home">홈</a></li>
								<li class="nav-item" role="button"><a class="nav-link"
									href="/store/main" id="li--store">상점</a></li>


								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown">
										가맹점 </a>
									<div class="dropdown-menu">

										<a class="nav-link"
											href="/storeFranchise/store-franchise-my"
											id="li--content">내 가게</a> <a class="nav-link"
											href="/storeFranchise/store-franchise-apply"
											id="li--content">가맹점 신청</a> <a class="nav-link"
											href="/storeFranchise/store-franchise-applyList"
											id="li--content">가맹점 신청목록</a>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown">
										더보기 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item"
											href="/view-more/about-us"
											id="li--about-us">회사 소개</a> <a class="dropdown-item"
											href="/board/board-list" id="li--board">게시판</a>
										<a class="dropdown-item" href="#">1:1문의</a> <a
											class="dropdown-item" href="/view-more/question-form/1">자주
											묻는 질문</a>
									</div></li>

								<input type="hidden" value="${principal.user.role}" name="role">

								<li class="nav-item"><a class="nav-link"
									href="/mypage?role=${principal.user.role}" id="li--content">내정보</a></li>

								<li class="nav-item"><a class="nav-link" href="/m-logout"
									id="li--content">로그아웃</a></li>

							</c:otherwise>
						</c:choose>

					</ul>
				</nav>
			</div>
		</nav>
	</div>


	<script type="text/javascript">
		$("#li--search").bind("click", function() {

			$("#div--search").show();
		});
	</script>