document.addEventListener("DOMContentLoaded", () => {

	// 아이디 찾기 모달
	let idFindModal = new bootstrap.Modal(document.getElementById('idFind_modal'), {
  		keyboard: false
	});

	// 비밀번호 변경 모달
	let pwFindModal = new bootstrap.Modal(document.getElementById('pwFind_modal'), {
  		keyboard: false
	});


	/* 아이디찾기 이벤트*/
	idSearchForm.addEventListener("submit", (e) => {

		// 아이디 찾기 폼전송을 막는다.
		e.preventDefault();

		// 아이디 찾기 폼정보를 가져온다.
		let form = e.target;
		let url = form.action;
		let method = form.method;

//		console.log(url);

		let empNmTag = document.querySelector("#empNm");
		let empTelnoTag = document.querySelector("#empTelno");

		let empNm = empNmTag.value;
		let empTelno = empTelnoTag.value;
		let body = JSON.stringify({
			empNm : empNm,
			empTelno : empTelno
		})


		// 입력값을 서버에 전송한다.
		FetchUtils.fetchForJSON(`${url}`, {
			method : method,
			headers : {
				"content-type" : 'application/json',
				accept : "application/json"
			},
			body : body
		}).then(({msg}) => {

			// 메시지를 호출한다.
			idFindModal.hide();

			Swal.fire({
				title:msg,
				icon:'info',
				confirmButtonColor: '#3085d6'
			}).then(result => {
				if(result.isConfirmed) {
					// 아이디 찾기에 성공했다면
					if(msg.includes("귀하의 아이디는")){
						// 모달창을 닫는다.

						// 모달창에 입력한 정보를 지운다.
						empNmTag.value = "";
						empTelnoTag.value = "";
					} else {
						idFindModal.show();
					}
				}
			});
		});
	});


	/* 비밀번호 변경 이벤트*/
	pwSearchForm.addEventListener("submit", (e) => {

		// 비밀번호 변경 폼전송을 막는다.
		e.preventDefault();

		// 비밀번호 변경 폼정보를 가져온다.
		let form = e.target;
		let url = form.action;
		let method = form.method;

		console.log(url);

		let empIdTag = document.querySelector("#empId");
		let empEmailTag = document.querySelector("#empEmail");

		let empId = empIdTag.value;
		let empEmail = empEmailTag.value;
		let body = JSON.stringify({
			empId : empId,
			empEmail : empEmail
		})


		// 입력값을 서버에 전송한다.
		FetchUtils.fetchForJSON(`${url}`, {
			method : method,
			headers : {
				"content-type" : 'application/json',
				accept : "application/json"
			},
			body : body
		}).then(({msg}) => {

			// 메시지를 호출한다.
			pwFindModal.hide();

			Swal.fire({
				title:msg,
				icon:'info',
				confirmButtonColor: '#3085d6'
			}).then(result => {
				if(result.isConfirmed) {
					// 비밀번호 변경에 성공했다면
					if(msg.includes("신규 비밀번호")){
						// 모달창을 닫는다.
						pwFindModal.hide();

						// 모달창에 입력한 정보를 지운다.
						empNmTag.value = "";
						empTelnoTag.value = "";
					} else {
						pwFindModal.show();
					}
				}
			});

		});
	});


});