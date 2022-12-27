

let boardIndex = {
	init: function(){
		$("#btn--save").bind("click", () => {
			this.save
		});
	},
	
	save: function(){
		let xCheckTitle = XSSCheck($("#title").val());
		let token = $("meta[name='_csrf']").attr("content");
		let csrfHeader = $("meta[name='_csrf_header']").attr("content");
		
		let data={
			title: xCheckTitle,
			content: $("#content").val()
		};
		
		$.ajax({
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeader, token);
			},
			type: "POST",
			url: "/api/board",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json"
		}).done(function(data, textStatus, xhr){
			console.log(data);
			if(data.status == "OK"){
				alert("글쓰기 성공");
				location.href = "/";
			}
		}).fail(function(error){
			alert("글 등록 실패" + error.responseJSON.message);
		});
		
	},
	
	
	
	
} // boardIndex 종료


boardIndex.init();