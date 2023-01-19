<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.tab_container .tab_content {
	width: 100% padding: 30px 0;
}

.tabs ul {
	width: 100%;
	display: table;
	table-layout: fixed;
	padding: 0
}

.tabs li {
	display: table-cell;
	background: #f6f7f9;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
	padding: 20px;
	border-bottom: 1px solid #222;
	text-align: center;
}

.tabs li.active {
	background: #fff;
	border-top: 1px solid #222;
	border-left: 1px solid #222;
	border-right: 1px solid #222;
	border-bottom: 0;
}

.tabs li.active a {
	color: #0051a4;
	font-weight: 500;
}

.tabs li a {
	font-size: 14px;
	color: #222;
	display: block;
	width: 100%;
	height: 100%;
	vertical-align: middle;
	text-decoration: none;
	color: #000
}
</style>

<c:choose>
	<c:when test="${principal.user.role eq 'GEUST'}">
		<div class="modal fade" id="followModal" role="dialog">
			<!-- //이곳에 적어준 id 값을 토대로 모달을 호출하게 된다.  -->
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">


					<div class="tab_container">
						<!--탭 메뉴 영역 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<div class="tabs">
							<ul>
								<li class="active"><a href="#" rel="tab1">쪽지보내기</a></li>
								<li><a href="#" rel="tab2">내 쪽지함</a></li>
							</ul>
						</div>
						<div id="tab1" class="tab_content">
							<div class="modal-body">
								<c:forEach var="reservation"
									items="${sessionScope.reservationeds}">
									<div class="d-flex justify-content-between">
										<div>${reservation.store.storeName}</div>
										<div>
											${reservation.store.category.id}
											<button
												onclick="sendMessageToHost(`${reservation.store.id}`,`${reservation.store.storeName}`);"
												class="btn btn-outline-primary">쪽지보내기</button>
										</div>
									</div>
									<div style="border: solid 1px gray; margin: 10px;"></div>
								</c:forEach>
							</div>
						</div>
						<div id="tab2" class="tab_content">
							<div class="modal-body">
								<c:forEach var="myNote" items="${sessionScope.myNoteList}">
									<table class="modal_table mt-3" id="table--${myNote.id}">
										<tr>
											<td id="modal_userID">${myNote.store.storeName}가게 사장님</td>
											<td id="modal_userFollow">
												<button
													onclick="resendMessageToHOST(`${myNote.content}`,`${myNote.store.storeName}`,`${myNote.id}`);"
													class="btn btn-outline-primary">답장하기</button>
											</td>
										</tr>
									</table>
								</c:forEach>
							</div>
						</div>
					</div>
					<div id="count" value="1"></div>
				</div>
			</div>
		</div>
	</c:when>


	<c:when test="${principal.user.role eq 'HOST'}">
		<div class="modal fade" id="followModal" role="dialog">
			<!-- //이곳에 적어준 id 값을 토대로 모달을 호출하게 된다.  -->
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<!-- //모달창의 header 부분에 해당한다.  -->
						<h4 class="modal-title">💬쪽지함</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>

					</div>
					<div class="modal-body">
						<c:forEach var="note" items="${sessionScope.noteList}">
							<table class="modal_table mt-3" id="table--${note.id}">
								<tr>
									<td id="modal_userID">${note.user.username}유저</td>
									<td id="modal_userFollow">
										<button
											onclick="sendMessageToGeust(`${note.content}`,`${note.user.username}`,`${note.id}`);"
											class="btn btn-outline-primary">답장하기</button>
									</td>
								</tr>
							</table>
						</c:forEach>

					</div>
					<div id="count" value="1"></div>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>
<script type="text/javascript">

// user > host
function sendMessageToHost(storeId,storeName) {
	
	(async () => {
	    const { value: sendmsg } = await Swal.fire({
	        title: storeName,
	        input: 'text',
	        inputPlaceholder: storeName + "  사장님께...",
	        confirmButtonText: '전송하기'
	    })
	    // 이후 처리되는 내용.
	    if (sendmsg) {
	    	let data = {
	    			content : sendmsg,
	    			storeId : storeId
	    	}
	    	$.ajax({
	    		type: 'POST',
				url: '/api/user/send-message/'+storeId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=UTF-8",
				dataType: "json"	
	    	}).done(function(){
	    	});
	        Swal.fire('성공')
	    }
	})()
}

// host > user
function sendMessageToGeust(content,username,noteId) {
	
	(async () => {
	    const { value: sendmsg } = await Swal.fire({
	        title: content,
	        input: 'text',
	        inputPlaceholder: username + "  님께...",
	        confirmButtonText: '답장하기'
	    })
	    // 이후 처리되는 내용.
	    if (sendmsg) {
	    	let data = {
	    			content : sendmsg
	    	}
	    	$.ajax({
	    		type: 'POST',
				url: '/api/user/check-message/' + noteId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=UTF-8",
				dataType: "json"
	    	}).done(function(data){
	    		console.log(data);
	    		const element = document.getElementById('table--' + data.body);
	    		element.remove(); 
	    	}).fail(function(error){
	    		alert("ㅠㅠ");
	    	});
	        Swal.fire('메세지가 성공적으로 발송되었습니다.')
	    }
	})()
}

function resendMessageToHOST(content,storeName,noteId) {
	(async () => {
	    const { value: sendmsg } = await Swal.fire({
	        title: content,
	        input: 'text',
	        inputPlaceholder: storeName + "  가게 사장님께...",
	        confirmButtonText: '답장하기'
	    })
	    // 이후 처리되는 내용.
	    if (sendmsg) {
	    	let data = {
	    			content : sendmsg
	    	}
	    	$.ajax({
	    		type: 'POST',
				url: '/api/user/resend-message/' + noteId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=UTF-8",
				dataType: "json"
	    	}).done(function(data){
	    		const element = document.getElementById('table--' + data.body);
	    		element.remove(); 
	    	}).fail(function(error){
	    		alert("ㅠㅠ");
	    	});
	    	Swal.fire('메세지가 성공적으로 발송되었습니다.')
	    }
	})()
}

//탭 컨텐츠 숨기기
$(".tab_content").hide();

// 첫번째 탭콘텐츠 보이기
$(".tab_container").each(function () {
  $(this).children(".tabs li:first").addClass("active"); //Activate first tab
  $(this).children(".tab_content").first().show();
});
//탭메뉴 클릭 이벤트
$(".tabs li a").click(function () {
  
  $(this).parent().siblings("li").removeClass("active");
  $(this).parent().addClass("active"); $(this).parent().parent().parent().parent().find(".tab_content").hide();
  var activeTab = $(this).attr("rel");
   $("#" + activeTab).fadeIn();
});
</script>





