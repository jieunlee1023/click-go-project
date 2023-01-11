<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/admin-layout.jsp"%>

<main class="container main">
	<div class="responsive-wrapper">

		<div class="content">
			<div class="content-panel">
				<div class="vertical-tabs">
					<a href="/admin/main" >👤 My</a> 
					<a href="/admin/private/team" class="active">👥 Team</a>
					<a href="/admin/private/plan">📅 Plan</a>
					<a href="/admin/private/repository">📂 Repository</a> 
				</div>
			</div>
			<div class="content-main">
				<div class="card-grid-team">

					<c:forEach var="admin" items="${admins }">
						<article class="admin-card">
							<div class="card-header-team">
								<div>
									<span><img
										src="http://localhost:7777/admin/${admin.profileUrl}" /></span>
								</div>
								<div>
									<h3>${admin.nickName }</h3>
								</div>
							</div>
							<div class="card-body">
								<p>${admin.myInfo }</p>
							</div>
							<div class="card-footer">
								<button type="button" data-toggle="tooltip" class="admin--main--btn"
									data-placement="bottom" title="${admin.user.phoneNumber }">
									📞</button>
								<button type="button" data-toggle="tooltip" class="admin--main--btn"
									data-placement="bottom" title="${admin.user.email}">
									📧</button>
								<a href="${admin.blogLink }" target="_blank">💻</a>
							</div>
						</article>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</main>

<script>
	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	});
</script>

<script src="/js/user.js"></script>
<br>
<br>
<br>
<%@ include file="../../layout/footer.jsp"%>
