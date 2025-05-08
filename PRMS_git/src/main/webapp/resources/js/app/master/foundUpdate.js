/**
 *
 */

document.addEventListener("DOMContentLoaded", ()=>{
	const contextPath = document.body.dataset.contextPath;
	const updateForm = document.querySelectorAll(".updateForm");
	const successFound = document.querySelectorAll(".foundSuccess");
	const failFound = document.querySelectorAll(".foundFail");

	//승인
	for(let i=0; i<successFound.length; i++){ //successFound의 길이만큼 반복해서
		let successBtn = successFound[i];//해당하는 열의 정보를 가져온다.
		successBtn.addEventListener("click", function(e){
			e.preventDefault
			Swal.fire({
			   title: '승인 하시겠습니까?',
			   text: '다시 되돌릴 수 없습니다. 신중하세요.',
			   icon: 'warning',

			   showCancelButton: true, // cancel버튼 보이기.
			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
			   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
			   // 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   		Swal.fire({
						title: '승인이 완료되었습니다.',
						text:'',
						icon:'success',
						confirmButtonColor: '#3085d6'
					}).then(()=>{
						updateForm[i].requestSubmit();
					});
			  	}
			});
		});
	}



	//반려
	for(let i=0; i<failFound.length; i++){
		let failBtn = failFound[i];
		const foundEmail = failFound[i].dataset.email;
		failBtn.addEventListener("click", function(e){
		console.log("foundEmail",foundEmail);
			e.preventDefault
			Swal.fire({
				title:'반려 사유를 입력하세요',
				input:'text',
				inputPlaceholder:'반려사유 입력',
				confirmButtonColor: '#3085d6'
			}).then(({value})=> {
				Swal.fire({
				   title: '반려 하시겠습니까?',
				   text: '다시 되돌릴 수 없습니다. 신중하세요.',
				   icon: 'warning',

				   showCancelButton: true, // cancel버튼 보이기.
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
				}).then(result => {
				   // 만약 Promise리턴을 받으면,
					if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						//메일 발송
						rejectReqeustStatus(foundEmail,value, failBtn, i);
				  	}
				});
			});
		});
	}


	//반려 사유 보낼 java mail api
	const rejectReqeustStatus = async (foundEmail, value, failBtn, i) => {
		let url = `${contextPath}/foundReturnMail.do`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};

		let foundRequest = {
			foundEmail : foundEmail,
			foundReCn : value
		}


		let options = {
			method:method,
			headers:headers,
			body:JSON.stringify(foundRequest)
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();

		console.log(jsonData);

		if(jsonData) {
			Swal.fire({
				title: '반려가 완료되었습니다.',
				text:'',
				icon:'success',
				confirmButtonColor: '#3085d6'
			}).then(()=>{
				failBtn.closest("td").querySelector(".updateForm").querySelector(".confmat").value = "N";
				updateForm[i].requestSubmit();
			});
		}
	}
});