/**
 *
 */

document.addEventListener("DOMContentLoaded", ()=>{
	const contextPath = document.body.dataset.contextPath;
	const updateFormSuccess = document.querySelectorAll(".updateFormSuccess");
	const updateFormReturn = document.querySelectorAll(".updateFormReturn");
	const emerApproveSuccess = document.querySelectorAll(".emerApproveSuccess");
	const emerApproveReturn = document.querySelectorAll(".emerApproveReturn");
	const fLink = document.querySelectorAll(".fLink");
	let headers = {
						'content-type' : "application/json",
						'accept' : "application/json"
					};

	// 승인
	for(let i=0; i < emerApproveSuccess.length; i++){ //emerApproveSuccess의 길이만큼 반복해서
		let successBtn = emerApproveSuccess[i];//해당하는 열의 버튼정보를 가져온다.
		let emerNo =fLink[i].dataset.no;
		successBtn.addEventListener("click", function(e){
			e.preventDefault();
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
						fetch(`${contextPath}/main/franchisee/approveYourEmpId.do?emerNo=${emerNo}`, {
							headers:headers
						}).then((resp) =>{
							if(resp.ok){
								return resp.text();
							}
						}).then((otherFranId)=>{
							console.log("textData",otherFranId);
							let franNm = document.querySelector("#franNm").innerHTML;
							// 알림을 보낸다.
							let alermVO = {
								alermSenderId: empId,
								alermReciverId: otherFranId,
								alermKind: "긴급재고알림",
								alermContent: `[${franNm}]에서 요청한 긴급재고주문을 승인했어요!`
							}
							sendEmpAlerm(alermVO);

							updateFormSuccess[i].requestSubmit();
						}).then(()=>{
						})
					});
			  	}
			});
		});
	}
	// 반려
	for(let i=0; i < emerApproveReturn.length; i++){ //emerApproveReturn의 길이만큼 반복해서
		let returnBtn = emerApproveReturn[i];//해당하는 열의 버튼정보을 가져온다.
		let emerNo =fLink[i].dataset.no;
		console.log("emerNo",emerNo);
		returnBtn.addEventListener("click", function(e){
			e.preventDefault();
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
						rejectReqeustStatus(emerNo, value, i);
				  	}
				});
			});
		});
	}

	//반려 사유 보낼 fetch
	const rejectReqeustStatus = async (emerNo, value, i) => {
		console.log("emerNo",emerNo);
		let url = `${contextPath}/main/franchisee/franUpdateEmerFranInvStatus.do`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};
		let foundRequest = {
			emerNo : emerNo,
			emerRejCn : value
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
				fetch(`${contextPath}/main/franchisee/approveYourEmpId.do?emerNo=${emerNo}`, {
					headers:headers
				}).then((resp) =>{
					if(resp.ok){
						return resp.text();
					}
				}).then((otherFranId)=>{
					console.log("textData",otherFranId);

					let franNm = document.querySelector("#franNm").innerHTML;
					// 알림을 보낸다.
					let alermVO = {
						alermSenderId: empId,
						alermReciverId: otherFranId,
						alermKind: "긴급재고알림",
						alermContent: `[${franNm}]에서 요청한 긴급재고주문을 반려했어요!`
					}
					sendEmpAlerm(alermVO);

					updateFormReturn[i].requestSubmit();
				}).then(()=>{
				})
			});
		}
	}
});