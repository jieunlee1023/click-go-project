<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/admin-layout.jsp"%>

<main class="container main">
	<div class="responsive-wrapper">

		<div class="content">
			<div class="content-panel">
				<div class="vertical-tabs">
					<a href="/admin/main" >👤 My</a> 
					<a href="/admin/private/team">👥 Team</a>
					<a href="/admin/private/plan">📅 Plan</a>
					<a href="/admin/private/repository" class="active">📂 Repository</a> 
				</div>
			</div>
			<div class="content-main">
				<div class="card-grid">
					<article class="admin-card-trello">
						<div class="card-header-trello">
							<div>
								<span><img
									src="/image/trello.png" /></span>
							</div>
						</div>
						<div class="card-body">
							<p>Collaboration between designers and developers.</p>
						</div>
						<div class="card-footer">
							<a href="https://trello.com/b/KqSCBRxk/click-go-project" target="_blank">🖥️ View</a>
						</div>
					</article>
					<article class="admin-card-trello">
						<div class="card-header-trello">
							<div>
								<span><img
									src="/image/github.png" /></span>
							</div>
						</div>
						<div class="card-body">
							<p>From beginning to end! Check out the Click-Go project!</p>
							<p>Please update me if there is any correction. :)</p>
						</div>
						<div class="card-footer">
							<a href="https://github.com/jieunlee1023/click-go-project" target="_blank">🖥️ View</a>
						</div>
					</article>

				</div>
			</div>
		</div>
	</div>
</main>

<script src="/js/user.js"></script>
<br>
<br>
<br>
<%@ include file="../../layout/footer.jsp"%>
