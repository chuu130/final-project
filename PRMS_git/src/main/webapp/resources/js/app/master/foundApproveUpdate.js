/**
 *
 */



document.addEventListener("DOMContentLoaded", ()=>{
	const faUpdateForm = document.querySelector(".faUpdateForm");
	const insertDe = document.querySelectorAll(".insertDe");
	const faSuccess = document.querySelector(".faSuccess");
	const foundNo = document.querySelector("#foundNo");

	//상담배정 모달
	new bootstrap.Modal(document.getElementById('foundAp_modal'), {
		keyboard: false
	});

	insertDe.forEach(res => {
		res.addEventListener("click", (e) =>{
			e.preventDefault();
			let fNo = res.dataset.no;
			foundNo.value = fNo;
		})
	})


	faSuccess.addEventListener("click",function(e){
		e.preventDefault();

		const dateInput = document.getElementById('datepicker');
		    dateInput.addEventListener('focus', function(event) {
		        event.preventDefault();
		        event.stopPropagation();
		    }, true);

		Swal.fire({
		   title: '배정 하시겠습니까?',
		   text: '',
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
					title: '배정이 완료되었습니다.',
					text:'',
					icon:'success',
					confirmButtonColor: '#3085d6'
				}).then(()=>{
					faUpdateForm.requestSubmit();
				});
		  	}
		});
	})

});
