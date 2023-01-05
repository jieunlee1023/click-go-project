

Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시
var dropzone = new Dropzone('.dropzone', {

	url: '/care-store/detail/update', // 파일을 업로드할 서버 주소 url.
	method: 'post', // 기본 post로 request 감. put으로도 할수있음
	paramName: 'files',

	autoProcessQueue: false, // 자동으로 보내기. true : 파일 업로드 되자마자 서버로 요청, false : 서버에는 올라가지 않은 상태. 따로 this.processQueue() 호출시 전송
	clickable: true, // 클릭 가능 여부
	autoQueue: false, // 드래그 드랍 후 바로 서버로 전송
	createImageThumbnails: true, //파일 업로드 썸네일 생성

	maxFiles: 5, // 업로드 파일수
	maxFilesize: 100, // 최대업로드용량 : 100MB
	parallelUploads: 5, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 넘긴다.)
	uploadMultiple: false, // 다중업로드 기능
	timeout: 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자

	addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
	dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
	acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 이미지 파일 포맷만 허용


	init: function() {
		let myDropzone = this;
		console.log(myDropzone);

		document.querySelector('#carestore--update--detail').addEventListener('click', function() {
			myDropzone.processQueue();

		});
	}

});
