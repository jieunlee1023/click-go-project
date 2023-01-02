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
<link href="../image/favicon.png" rel="shortcut icon" type="image/x-icon">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">

<!-- CSS 연결 -->
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/login-join-infosearch.css" rel="stylesheet" type="text/css" />
<link href="/css/view-more.css" rel="stylesheet" type="text/css" />
<link href="/css/board.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="/css/fullpage.min.css">
<link rel="stylesheet" href="/css/index.css">
<script src="/js/fullpage.min.js"></script>

</head>

<body>

<div id="header">
<div class="container ">
	<div id='wrapper'>

			<div id="logo">

				<a class="navbar-brand" href="/" style="color: black"> 
				<img src="/image/logo.png" alt="click-go-logo" style="width: 150px"></a>

			</div>
	</div>

		<c:choose>
			<c:when test="${empty principal}">
		
				<div class="nav--list">
			        <ul id="nav--item">
			            <li><a class="nav-link" href="/">홈</a></li>
			            <li><a class="nav-link" href="/store/main">상점</a></li>
						<li id="more--view"> <a class="nav-link" href="#" >더보기</a>
								<ul id="nave--moreview--item"> 
									<li><a class="dropdown-item" href="/view-more/notice-list" >공지사항</a> </li>
									<li><a class="dropdown-item" href="/board/board-list">게시판</a></li>
									<li><a class="dropdown-item" href="/view-more/question-form/1">자주 묻는 질문</a></li>
									<li><a class="dropdown-item" href="/view-more/about-us" >회사 소개</a></li>
									<li><a class="dropdown-item" href="/view-more/terms-list">약관 및 정책</a></li>
								</ul>
						</li>
						<li><a class="nav-link" href="/auth/login-form">로그인</a></li>
			        </ul>
			    </div>

			</c:when>

			<c:when test="${principal.user.role == 'ADMIN'}">
				<div class="nav--list">
			        <ul id="nav--item">
			       		 <li>
							<form action="/storeFranchise/store-franchise-message" method="get">
							    <div class="nav-btn justify-content-bottom" id="notification"
							        style="position: relative; margin: 0px">
							        <button type="submit" id="btn--msg">
							            <span id="msg--icon">💌</span>
							            <span class="note-num" id="msg--count">${waitMsg}</span>
							        </button>
							    </div>
							</form>
						<li>
			            <li><a class="nav-link" href="/">홈</a></li>
			            <li><a class="nav-link" href="/store/main">상점</a></li>
			            <li><a class="nav-link" href="/storeFranchise/store-franchise-list" >가맹점 목록</a>	</li>
						<li id="more--view"> <a class="nav-link" href="#" >더보기</a>
								<ul id="nave--moreview--item"> 
									<li><a class="dropdown-item" href="/view-more/notice-list" >공지사항</a> </li>
									<li><a class="dropdown-item" href="/board/board-list">게시판</a></li>
									<li><a class="dropdown-item" href="/view-more/question-form/1">자주 묻는 질문</a></li>
									<li><a class="dropdown-item" href="/view-more/about-us">회사 소개</a></li>
									<li><a class="dropdown-item" href="/view-more/terms-list">약관 및 정책</a></li>
								</ul>
						</li>
						<li><a class="nav-link" href="/mypage">내 정보</a></li>
						<li><a class="nav-link" href="/logout">로그아웃</a></li>
			        </ul>
			    </div>
			</c:when>
			
			<c:otherwise>
				<div class="nav--list">
			        <ul id="nav--item">
			            <li><a class="nav-link" href="/">홈</a></li>
			            <li><a class="nav-link" href="/store/main">상점</a></li>
						<li id="more--view"> <a class="nav-link" href="#" >가맹점</a>
								<ul id="nave--moreview--item"> 
									<li><a class="nav-link" href="/storeFranchise/store-franchise-apply">가맹점 신청</a></li>
									<li><a class="nav-link" href="/storeFranchise/store-franchise-applyList">가맹점 신청목록</a></li>
								</ul>
						</li>
						<li id="more--view"> <a class="nav-link" href="#" >더보기</a>
								<ul id="nave--moreview--item"> 
									<li><a class="dropdown-item" href="/view-more/notice-list" >공지사항</a> </li>
									<li><a class="dropdown-item" href="/board/board-list">게시판</a></li>
									<li><a class="dropdown-item" href="/view-more/question-form/1">자주 묻는 질문</a></li>
									<li><a class="dropdown-item" href="/view-more/about-us">회사 소개</a></li>
									<li><a class="dropdown-item" href="/view-more/terms-list">약관 및 정책</a></li>
								</ul>
						</li>
						<li><a class="nav-link" href="/mypage">내 정보</a></li>
						<li><a class="nav-link" href="/logout">로그아웃</a></li>
			        </ul>
			    </div>			
			
			</c:otherwise>
		</c:choose>
</div>
</div>

