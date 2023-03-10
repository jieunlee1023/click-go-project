<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/admin-layout.jsp"%>

<main class="container main">
	<div class="responsive-wrapper">

		<div class="content">
			<div class="content-panel">
				<div class="vertical-tabs">
					<a href="/admin/main" class="active">๐ค My</a> 
					<a href="/admin/private/team">๐ฅ Team</a>
					<a href="/admin/private/plan">๐ Plan</a>
					<a href="/admin/private/repository">๐ Repository</a> 
				</div>
			</div>
			<div class="content-main">
				<form action="/admin/private/profile/${principal.user.id }"
					method="post" enctype="multipart/form-data">
					<div class="admin-main-profile">
						<c:choose>
							<c:when test="${ empty adminEntity.profileUrl }">
								<img src="/image/profile.png" />
							</c:when>
							<c:otherwise>
								<img src="http://localhost:7777/admin/${adminEntity.profileUrl}" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="admin-main-my">

						<input type="text" class="form-control" placeholder="๋๋ค์์ ์๋ ฅํด์ฃผ์ธ์!"
							name="nickName" value="${adminEntity.nickName}"><br>
					</div>
					<div class="admin-main-my">
						<input type="text" class="form-control"
							value="${principal.user.phoneNumber }" readonly>
					</div>
					<div class="admin-main-my">
						<input type="text" class="form-control"
							value="${principal.user.email }" readonly>
					</div>
					<div class="admin-main-my">
						<div class="custom-file" id="admin-main-my-image-input">
							<input type="file" name="file" class="custom-file-input">
							<label class="custom-file-label" for="customFile">์๋ก๋ ํ 
								ํ๋กํ ์ด๋ฏธ์ง๋ฅผ ์ ํํด์ฃผ์ธ์</label>
						</div>
					</div>
					<div class="admin-main-my">
						<input type="text" class="form-control"
							placeholder="๋ธ๋ก๊ทธ ๋งํฌ๋ฅผ ๋จ๊ฒจ์ฃผ์ธ์!" name="blogLink"
							value="${adminEntity.blogLink}">
					</div>
					<div class="admin-main-my">
						<input type="text" class="form-control"
							placeholder="๊ฐ๋จํ ์๊ฐ๊ธ์ ์ธ ์ ์์ด์!" name="myInfo"
							value="${adminEntity.myInfo}">
					</div>
					<div class="admin-main-my">
						<button class="">์ ์ฅํ๊ธฐ</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</main>
<script>
	$(".custom-file-input").bind(
			"change",
			function() {
				console.log("test code:" + $(this).val());
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>

<script src="/js/user.js"></script>
<br>
<br>
<br>
<%@ include file="../layout/footer.jsp"%>








