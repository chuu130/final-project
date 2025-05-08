/**
 *
 */

document.addEventListener("DOMContentLoaded", ()=>{
	//반품
	const fivReturn = document.querySelectorAll(".fivReturn");
	const fivRId = document.querySelector("#fivRId");
	const fivRQy = document.querySelector("#fivRQy");
	const invReturn = document.querySelector(".invReturn");
	const InvReturnForm = document.querySelector("#InvReturnForm");

	//폐기
	const fivDispose = document.querySelectorAll(".fivDispose");
	const fivDId = document.querySelector("#fivDId");
	const fivDQy = document.querySelector("#fivDQy");
	const invDispose = document.querySelector(".invDispose");
	const InvDisposeForm = document.querySelector("#InvDisposeForm");

	console.log("fivDQy",fivDQy);
	//반품 폐기 모달
	new bootstrap.Modal(document.getElementById('franInvReturn_modal'), {

	});
	new bootstrap.Modal(document.getElementById('franInvDispose_modal'), {

	});

	//반품 폐기의 재고ID
	fivReturn.forEach(res => {
		res.addEventListener("click", (e) =>{
			e.preventDefault();
			let fId = res.dataset.fivRid;
			fivRId.value = fId;
		})
	})
	fivDispose.forEach(res => {
		res.addEventListener("click", (e) =>{
			e.preventDefault();
			let fId = res.dataset.fivDid;
			fivDId.value = fId;
		})
	})

	//반품 클릭 이벤트 서브밋
	invReturn.addEventListener("click",function(e){
		e.preventDefault();
		Swal.fire({
		   title: '반품 하시겠습니까?',
		   text: '다시 되돌릴 수 없습니다. 신중하세요.',
		   icon: 'warning',

		   showCancelButton: true, // cancel버튼 보이기.
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
		   confirmButtonText: '반품', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

		}).then(result => {
		   // 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				if(!fivRQy.value){
					Swal.fire({
						title: '반품 실패했습니다.',
						text:'다시 시도해주세요.',
						icon:'error',
						confirmButtonColor: '#3085d6'
					}).then(()=>{
						InvReturnForm.requestSubmit();
					});
				} else {
			   		Swal.fire({
						title: '반품 완료되었습니다.',
						text:'',
						icon:'success',
						confirmButtonColor: '#3085d6'
					}).then(()=>{
						InvReturnForm.requestSubmit();
					});
				}
		  	}
		});
	})

	//폐기 클릭 이벤트 서브밋
	invDispose.addEventListener("click",function(e){
		e.preventDefault();
		Swal.fire({
		   title: '폐기 하시겠습니까?',
		   text: '다시 되돌릴 수 없습니다. 신중하세요.',
		   icon: 'warning',

		   showCancelButton: true, // cancel버튼 보이기.
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
		   confirmButtonText: '폐기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

		}).then(result => {
		   // 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		   		if(!fivDQy.value){
					Swal.fire({
						title: '폐기 실패했습니다.',
						text:'다시 시도해주세요.',
						icon:'error',
						confirmButtonColor: '#3085d6'
					}).then(()=>{
						InvDisposeForm.requestSubmit();
					});
				} else {
			   		Swal.fire({
						title: '폐기 완료되었습니다.',
						text:'',
						icon:'success',
						confirmButtonColor: '#3085d6'
					}).then(()=>{
						InvDisposeForm.requestSubmit();
					});
				}
		  	}
		});
	})


});