<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!-- 자주 묻는 질문  -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Click-go</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../image/favicon.png" rel="shortcut icon" type="image/x-icon">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e1456a9ac9148a20acaf98282066ab1"></script>

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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<!-- 드랍다운 -->
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css' />


<!-- CSS 연결 -->
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/login-join-infosearch.css" rel="stylesheet" type="text/css" />
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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>

<body>

<header class="header">
  
  <div class="container">
    <div class="header-content responsive-wrapper">
      <div class="header-logo">
			<a class="navbar-brand" href="/" style="color: black"> 
			<img src="/image/favicon.png" alt="로고" style="width: 40px"></a>
      </div>
      <div class="header-navigation">
        <nav class="header-navigation-links">
         <a  href="/">홈</a>
          <a href="/store/main">상점</a>
          <a href="/board/list">게시판</a>
          <a href="/logout">로그아웃</a>
        </nav>
        <div class="header-navigation-actions">
        <form action="/storeFranchise/store-franchise-message" method="get">
			<div class="nav-btn justify-content-bottom" id="notification" style="position: relative; margin: 0px">
				<button type="submit" id="btn--msg">
						<span id="msg--icon">💌</span> <span class="note-num" id="msg--count">${waitMsg}</span>
				</button>
			</div>
		</form>
          <a href="/admin/main" class="avatar">
            <c:choose>
				<c:when test="${ empty adminEntity.profileUrl }">
					<img src="/image/profile.png" />
				</c:when>
				<c:otherwise>			
			 	 	<img src="http://localhost:7777/admin/${adminEntity.profileUrl}" />
				</c:otherwise>
			</c:choose>
          </a>
          
        </div>
      </div>
      <a href="#" class="button">
        <i class="ph-list-bold"></i>
        <span>Menu</span>
      </a>
    </div>
    </div>
  </header>
  
  
  <main class="container main">
    <div class="responsive-wrapper">
      <div class="main-header">
        <h1>💻 관리자 페이지</h1>
        <div class="search">
        </div>
        
        
        
      </div>
      <div class="horizontal-tabs">
       <a href="/admin/user" ><span>회원관리</span></a>
        <a href="/admin/store" > <span>가맹점관리</span></a>
        <a href="/admin/reservation" > <span>예약조회</span></a>
        <a href="/admin/one-to-one-list" > <span>1:1문의</span></a>
        <a href="/admin/report" ><span>신고관리</span></a>
        <a href="/admin/chart"><span>통계보기</span></a>
      </div>
	</div>
</main>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>