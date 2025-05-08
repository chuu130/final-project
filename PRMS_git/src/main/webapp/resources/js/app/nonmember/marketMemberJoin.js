document.addEventListener("DOMContentLoaded", () => {

	const cPath = document.body.dataset.contextPath;
	const idChkMsg = document.querySelector("#id-chk-msg");
	const idChkBtn = document.querySelector("#id-chk-btn");

	// 중복체크 버튼 클릭 이벤트
	// 1. url 정보를 가져온다.
	// 2. memId값을 가져온다.
	// 3. accept 를 json으로 설정한다.
	// 4. 비동기 요청을 보낸다.
	// 5. json 데이터를 span에 추가한다.
	idChkBtn.addEventListener("click", (e) => {

		// 이전 메시지정보를 비운다.
		idChkMsg.innerHTML = "";

		// 아이디 입력값을 가져온다.
		let memIdTag = document.querySelector("#memId");
		let inputId = memIdTag.value;

		// 아이디 입력값이 없다면 리턴한다.
		if(!inputId.trim()) {
			return;
		}

		// 입력받은 아이디값을 서버로 전송하여 검증을 수행한다.
		let formData = new FormData();
		formData.append("inputId", inputId);

		FetchUtils.fetchForJSON(`${cPath}/market/join/idChk`, {
			method:"POST",
			headers:{
				accept:"application/json"
			},
			body:formData
		}).then(({chkStatus}) => {

			let idChkMsgTag = document.querySelector("#id-chk-msg");

			let msg = "";
			// 검증성공시, 사용가능 메시지를 출력한다.
			if(chkStatus) {
				msg = "사용가능"
			} else {
				// 검증실패시, 사용불가능 메시지를 출력한다.
				msg = "사용불가"

				// 아이디 입력창으로 포커스를 준다.
				memIdTag.focus();
			}

			idChkMsgTag.innerHTML = msg;
		});

	});



});