/**
 *
 */

document.addEventListener("DOMContentLoaded", ()=>{
	const updateForm = document.querySelectorAll(".updateForm");
	const emerCancel = document.querySelectorAll(".emerCancel");


	for(let i=0; i < emerCancel.length; i++){ //successFound의 길이만큼 반복해서
		let cancelBtn = emerCancel[i];//해당하는 열의 정보를 가져온다.
		cancelBtn.addEventListener("click", function(e){
			e.preventDefault();
			Swal.fire({
			   title: '발주취소 하시겠습니까?',
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
						title: '취소가 완료되었습니다.',
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
});