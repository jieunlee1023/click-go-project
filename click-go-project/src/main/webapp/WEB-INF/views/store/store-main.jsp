<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br>

<div class="container">


	<nav class="mynav">
		<ul>
			<li><a href="/store/main">전체 보기</a></li>

			<c:forEach var="category" items="${categories}">
				<a href="/store/main?pageName=${category}">${category}</a>
			</c:forEach>

		</ul>
	</nav>

<div class="search--container">
  <form >
    <div class="finder">
      <div class="finder__outer">
        <div class="finder__inner">
          <div class="finder__icon" ref="icon"></div>
          <input class="finder__input" type="text" name="q" />
        </div>
      </div>
    </div>
  </form>
</div>



	<div class="d-flex justify-content-center">
		<div class="d-flex-column">
			<c:forEach var="store" items="${stores.content}">
				<input type="hidden" id="store-size"
					value="${stores.content.size()}">
				<%@ include file="../common/store.jsp"%>
			</c:forEach>
		</div>
	</div>
</div>


<script type="text/javascript" src="/js/store.js"></script>
<%@ include file="../layout/footer.jsp"%>
