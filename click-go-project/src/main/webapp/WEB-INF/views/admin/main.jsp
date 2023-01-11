<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/admin-layout.jsp"%>

<main class="container main">
	<div class="responsive-wrapper">

		<div class="content">
			<div class="content-panel">
				<div class="vertical-tabs">
					<a href="/admin/main" class="active">👤 My</a> 
					<a href="/admin/private/team">👥 Team</a>
					<a href="/admin/private/plan">📅 Plan</a>
					<a href="/admin/private/repository">📂 Repository</a> 
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

						<input type="text" class="form-control" placeholder="닉네임을 입력해주세요!"
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
							<label class="custom-file-label" for="customFile">업로드 할
								프로필 이미지를 선택해주세요</label>
						</div>
					</div>
					<div class="admin-main-my">
						<input type="text" class="form-control"
							placeholder="블로그 링크를 남겨주세요!" name="blogLink"
							value="${adminEntity.blogLink}">
					</div>
					<div class="admin-main-my">
						<input type="text" class="form-control"
							placeholder="간단한 소개글을 쓸 수 있어요!" name="myInfo"
							value="${adminEntity.myInfo}">
					</div>
					<div class="admin-main-my">
						<button class="">저장하기</button>
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








