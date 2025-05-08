document.addEventListener("DOMContentLoaded", () =>{

	const contextPath = document.body.dataset.contextPath; // 컨텍스트 패스
	const idFindBtn = document.querySelector("#id_find_btn"); // 아이디 찾기 버튼
	const pwFindBtn = document.querySelector("#pw_find_btn"); // 비밀번호 찾기 버튼

	const idFindModal = document.querySelector(".idFind_modal"); // 아이디 찾기 모달
	const pwFindModal = document.querySelector(".pwFind_modal"); // 비밀번호 찾기 모달


	/* 아이디 찾기 버튼 클릭 이벤트 */
	idFindBtn.addEventListener("click", (e) => {
		e.preventDefault();


		// 1. 아이디 찾기 모달을 호출한다.
		idFindModal.classList.add("on");


		// 1.1. 찾기 버튼을 클릭하면
		let idFindModalIdFindBtn = document.querySelector(".idFind_moadl_idFind_btn");
		idFindModalIdFindBtn.addEventListener("click", () => {

			// 1.1.1. 회원이름과 전화번호를 가져온다.
			let memNmTag = document.querySelector("#memNm");
			let memTelnoTag = document.querySelector("#memTelno");

			let memNm = memNmTag.value;
			let memTelno = memTelnoTag.value;

			// 1.1.2 서버에서 검증한다.
			let url=`${contextPath}/market/memberFinding/id`;
			let method="POST";
			let headers = {
				'content-type' : "application/json",
				'accept' : "application/json"
			};
			let body = JSON.stringify({
				memNm : memNm,
				memTelno : memTelno
			});

			fetch(url, {
				method:method,
				headers:headers,
				body:body
			}).then((resp) => {
				if(resp.ok) {
					return resp.json();
				}
			}).then(({msg}) => {

				// 메시지를 호출한다.
				console.log(msg);
				document.querySelector('.idFind_modal').style = "z-index:0";

				Swal.fire({
					title:msg,
					icon:'info',
				}).then(result => {
					if(result.isConfirmed) {
						document.querySelector('.idFind_modal').style = "z-index:9999";
					}
				});


				// 아이디 찾기에 성공했다면
				if(msg.includes("회원님의 아이디는")){
					// 모달창을 닫는다.
					idFindModal.classList.remove("on");

					// 모달창에 입력한 정보를 지운다.
					memNmTag.value = "";
					memTelnoTag.value = "";
				}


			}).catch((err) => {
				console.log(err);
			});
		});


		// 2.2. 닫기 버튼을 클릭할시, 모달창을 닫는다.
		let idFindModalIdFindCloseBtn = document.querySelector(".idFind_modal_idFind_closeBtn");
		idFindModalIdFindCloseBtn.addEventListener("click", () => {
			idFindModal.classList.remove("on");
		});
	});


	/* 비밀번호 찾기 이벤트*/
	pwFindBtn.addEventListener("click", (e) => {
		e.preventDefault();

		// 1. 비밀번호 찾기 모달을 호출한다.
		pwFindModal.classList.add("on");

		// 2. 전송 버튼을 클릭하면
		let pwFindModalpwFindBtn = document.querySelector(".pwFind_moadl_pwFind_btn");
		pwFindModalpwFindBtn.addEventListener("click", () => {
				// 2.1.1. 회원이름과 전화번호를 가져온다.
			let memIdTag = document.querySelector("#memId");
			let memEmailTag = document.querySelector("#memEmail");

			let memId = memIdTag.value;
			let memEmail = memEmailTag.value;

			// 2.1.2 서버에서 검증한다.
			let url=`${contextPath}/market/memberFinding/pw`;
			let method="POST";
			let headers = {
				'content-type' : "application/json",
				'accept' : "application/json"
			};
			let body = JSON.stringify({
				memId : memId,
				memEmail : memEmail
			});

			fetch(url, {
				method:method,
				headers:headers,
				body:body
			}).then((resp) => {
				if(resp.ok) {
					return resp.json();
				}
			}).then(({msg}) => {

				// 메시지를 호출한다.
				document.querySelector('.pwFind_modal').style = "z-index:0";

				Swal.fire({
					title:msg,
					icon:'success',
				}).then(result => {
					if(result.isConfirmed) {
						document.querySelector('.pwFind_modal').style = "z-index:9999";
					}
				});

				// 올바른 비밀번호를 입력했다면
				if(msg.includes("신규 비밀번호")){
					pwFindModal.classList.remove("on");
				}

				// 모달창에 입력한 정보를 지운다.
				memIdTag.value = "";
				memEmailTag.value = "";

			}).catch((err) => {
				console.log(err);
			});
		});


		// 1.2. 닫기 버튼을 클릭할시, 모달창을 닫는다.
		let pwFindModalIdfindCloseBtn = document.querySelector(".pwFind_modal_pwFind_closeBtn");
		pwFindModalIdfindCloseBtn.addEventListener("click", () => {
			pwFindModal.classList.remove("on");
		});
	});

});