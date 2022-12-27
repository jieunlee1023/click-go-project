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
	href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@500&family=Sunflower:wght@300;500&display=swap"
	rel="stylesheet">

<style type="text/css">
* {
	font-family: 'DM Sans', sans-serif;
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
	<header style="background-color: #6885ab; text-align: center"
		class=" d-flex justify-content-center p-2"> Our company
		provides a service environment that makes leisure activities more fun
		and convenient. </header>
	<div>


		<nav class="navbar navbar-expand-md " style="margin-top: 10px">

			<div class="d-flex justify-content-center ">

				<a class="navbar-brand" href="/" style="color: black"> <img
					src="../image/favicon.png" alt="logo" style="width: 50px;"
					class="m-2">Click Go
				</a>

			</div>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon" style="font-size: 20px"> ▼
				</span>
			</button>

			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<nav class="navbar navbar-expand-sm navbar-light"
					style="color: black">
					<ul class="navbar-nav">
						<li class="nav-item " role="button"><a class="nav-link"
							href="?pageName=home" id="li--home">Home</a></li>
						<li class="nav-item " role="button"><a class="nav-link"
							href="/home/about-us?pageName=about-us" id="li--about-us">About
								us</a></li>
						<li class="nav-item" role="button"><a class="nav-link"
							href="/home/store?pageName=store" id="li--store">Store</a></li>
						<li class="nav-item" role="button"><a class="nav-link"
							href="/home/board/board-list?pageName=board" id="li--board">Board</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/home/content?pageName=content" id="li--content">Content</a></li>
					</ul>
				</nav>
			</div>
		</nav>
	</div>