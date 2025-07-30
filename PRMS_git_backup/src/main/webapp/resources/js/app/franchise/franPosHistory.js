document.addEventListener("DOMContentLoaded", () => {

	const contextPath = document.body.dataset.contextPath;





	$(".posRefund").on("click", function(e) {
		var franprodSetlNo = $(this).closest(".body").find(".franprodSetlNo").val();


		console.log(franprodSetlNo);

		Swal.fire({
			title: '환불 처리 하시겠습니까?',
			icon: 'warning',

			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		    cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
			confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			reverseButtons: false, // 버튼 순서 거꾸로

		}).then(result => {
			// 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				   Swal.fire({
				            title: '환불 신청이 완료되었습니다.',
				            text: '',
				            icon: 'success',
				            confirmButtonColor: '#3085d6', // Success 메시지의 확인 버튼 색상 변경
				}).then(result2 =>{
					if(result2.isConfirmed){
							$.ajax({
								url : `${contextPath}/franchise/franchisePosCancle`,
								data : {"franprodSetlNo" : franprodSetlNo},
								type : "POST",
								success:(data)=>{
									console.log(data);
									
									location.href= `${contextPath}/franchise/franchisePosHistory`;
								},
								error: (jqXHR, textStatus, errorThrown)=>{
											console.log("textStatus", textStatus);
								}
							})

					}
				});

			}
		});
	});
});