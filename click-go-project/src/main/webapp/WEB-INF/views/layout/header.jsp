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
   <!-- 자주 묻는 질문  -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

   <!-- 자주 묻는 질문  -->

<style type="text/css">
* {
   font-family: 'Noto Sans KR', sans-serif;
}

.login:hover {
   color: #578cd2
}

.signup:hover {
   color: #578cd2
}

.navbar-toggler-icon:hover {
   color: #578cd2
}

#btn--login:hover {
   color: #578cd2
}

#id-password-btn:hover {
   text-decoration: none;
   color: #578cd2;
}

#signin-btn:hover {
   text-decoration: none;
   color: #578cd2;
}

#btn--save:hover {
   color: #578cd2;
}

//
TODO
#update-btn:hover {
   text-decoration: none;
   color: #578cd2;
}

<!-- 검색 애니메이션 -->
*{
  box-sizing: border-box;
}

.search-img {
  margin: 10px;
  margin-right: 
}

.search-box{
  width: fit-content;
  height: fit-content;
  position: relative;
}
.input-search{
  height: 50px;
  width: 50px;
  border-style: none;
  padding: 10px;
  font-size: 18px;
  letter-spacing: 2px;
  outline: none;
  border-radius: 25px;
  transition: all .5s ease-in-out;
  padding-right: 40px;
  color:070707;
}
.input-search::placeholder{
  color:rgba(255,255,255,.5);
  font-size: 18px;
  letter-spacing: 2px;
  font-weight: 100;
}
.btn-search{
  width: 50px;
  height: 50px;
  border-style: none;
  font-size: 20px;
  font-weight: bold;
  outline: none;
  cursor: pointer;
  border-radius: 50%;
  position: absolute;
  right: 0px;
  color:#ffffff ;
  background-color:transparent;
  pointer-events: painted;  
  padding-right: 58px;
}
.btn-search:focus ~ .input-search{
  width: 300px;
  border-radius: 0px;
  background-color: transparent;
  border: 1px solid rgba(0,0,0,.5);
  transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
}
.input-search:focus{
  width: 300px;
  border-radius: 0px;
  background-color: transparent;
  border: 1px solid rgba(0,0,0,.5);
  transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
}



/*  footer   */
footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida  Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}
footer .fa-heart{
    color: red;
}
footer .fa-dev{
    color: #fff;
}
footer .fa-twitter-square{
  color:#1da0f1;
}
footer .fa-instagram{
  color: #f0007c;
}
fotter .fa-linkedin{
  color:#0073b1;
}
footer .fa-codepen{
  color:#fff
}
footer a {
    color: #3c97bf;
    text-decoration: none;
  margin-right:5px;
}
.youtubeBtn{
    position: fixed;
    left: 50%;
  transform:translatex(-50%);
    bottom: 45px;
    cursor: pointer;
    transition: all .3s;
    vertical-align: middle;
    text-align: center;
    display: inline-block;
}
.youtubeBtn i{
   font-size:20px;
  float:left;
}
.youtubeBtn a{
    color:#ff0000;
    animation: youtubeAnim 1000ms linear infinite;
  float:right;
}
.youtubeBtn a:hover{
  color:#c9110f;
  transition:all .3s ease-in-out;
  text-shadow: none;
}
.youtubeBtn i:active{
  transform:scale(.9);
  transition:all .3s ease-in-out;
}
.youtubeBtn span{
    font-family: 'Lato';
    font-weight: normal;
    color: #fff;
    display: block;
    font-size: 12px;
    float: right;
    line-height: 20px;
    padding-left: 5px;
  
}

@keyframes youtubeAnim{
  0%,100%{
    color:#c9110f;
  }
  50%{
    color:#ff0000;
  }
}
/* footer  */
<!-- 검색 애니메이션 -->
</style>


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>


<body>



   <input type="hidden" value="${nowPage}" id="nowPage">
   <!-- 
   <header style="background-color: #6885ab; text-align: center"
      class=" d-flex justify-content-center p-2"> Our company
      provides a service environment that makes leisure activities more fun
      and convenient. </header>
 -->

   <div>

      <nav class="navbar navbar-expand-md " style="padding-top: 10px;">

         <div class="d-flex justify-content-center ">

            <a class="navbar-brand" href="/" style="color: black"> <img
               src="../image/favicon.png" alt="logo" style="width: 50px;"
               class="m-2">Click Go
            </a>

         </div>

         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"> <img
               src="../image/menu.png" width="30px" height="30px">
            </span>
         </button>

         <div class="collapse navbar-collapse justify-content-end"
            id="collapsibleNavbar">
            <nav class="navbar navbar-expand-sm navbar-light"
               style="color: black">
               <ul class="navbar-nav">
               
               
               <!-- 검색 애니메이션 -->
                 <div class="search-box">
                 <form action="/board" method="get">
                   <button class="btn-search"><img class="search-img" alt="검색"
                        src="../image/search.png" width="18px"></button>
                   <input type="text" class="input-search">
                    </form>
                 </div>



               
               
               <!-- 검색 애니메이션 -->
               

               <!--    <li class="nav-item search-box" role="button"><a class="nav-link btn-search"
                     href="#" id="li--search"><img alt="검색"
                        src="../image/search.png" width="18px"></a>
                  </li> -->

                  <li class="nav-item " role="button"><a class="nav-link"
                     href="/?pageName=home" id="li--home">홈</a></li>
                  <li class="nav-item" role="button"><a class="nav-link"
                     href="/home/store?pageName=store" id="li--store">상점</a></li>

                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" data-toggle="dropdown"> 더보기
                  </a>
                     <div class="dropdown-menu">
                        <a class="dropdown-item" href="/home/about-us?pageName=about-us"
                           id="li--about-us">회사 소개</a>
                            <a class="dropdown-item"
                           href="/home/board/board-form?pageName=board" id="li--board">게시판</a>
                        <a class="dropdown-item" href="#">1:1문의</a>
                        <a class="dropdown-item" href="/home/board/question-form">자주 묻는 질문</a>
                     </div></li>


                  <c:choose>
                     <c:when test="${empty principal}">

                        <li class="nav-item"><a class="nav-link"
                           href="/auth/login-form" id="li--content">로그인</a></li>

                     </c:when>
                     <c:otherwise>

                        <li class="nav-item"><a class="nav-link"
                           href="/home/content?pageName=content" id="li--content">가맹점
                              신청</a></li>

                        <input type="hidden" value="${principal.user.role}" name="role">

                        <li class="nav-item"><a class="nav-link"
                           href="/mypage?role=${principal.user.role}" id="li--content">내
                              정보</a></li>

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
      $("#li--search").bind("click",function() {
         
           $("#div--search").show();
            });
   </script>