document.addEventListener("DOMContentLoaded", ()=>{
	const contextPath = document.body.dataset.contextPath;

	$(".save").on("click", function(e){
		var r1 = $('input[name=r1]:checked').val();
		var r2 = $('input[name=r2]:checked').val();
		var r3 = $('input[name=r3]:checked').val();
		var r4 = $('input[name=r4]:checked').val();
		var r5 = $('input[name=r5]:checked').val();
		var r6 = $('input[name=r6]:checked').val();
		var r7 = $('input[name=r7]:checked').val();

		console.log("r1 : " + r1);
		console.log("r2 : " + r2);
		console.log("r3 : " + r3);
		console.log("r4 : " + r4);
		console.log("r5 : " + r5);
		console.log("r6 : " + r6);
		console.log("r7 : " + r7);

		var total = Number(r1)+Number(r2)+Number(r3)+Number(r4)+Number(r5)+Number(r6)+Number(r7);

		let audit = '';
		let confirm = '';

		if(Number(total) >= 60){
			audit = '우수';
			confirm = 'Y';
		}else if (Number(total)<60 && Number(total) >=40 ){
			audit ='양호';
			confirm = 'Y';
		}else{
			audit = '미달';
			confirm = 'N';
		}

		var checkNo = $("#checkNo").val();
		var text = $("#text").val();
		r1 = Number(r1);
		r2 = Number(r2);
		r3 = Number(r3);
		r4 = Number(r4);
		r5 = Number(r5);
		r6 = Number(r6);
		r7 = Number(r7);

		console.log(checkNo);
		console.log(audit);
		console.log(text);

		Swal.fire({
			title: '저장하시겠습니까?',
			icon: 'success',

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
				title: '내용이 저장되었습니다.',
				text: '',
				icon:'success',
				confirmButtonColor: '#3085d6'
			}).then(result2 =>{
					if(result2.isConfirmed){
						$.ajax({
							url : 'saveFranAuditCheckList',
							type: "POST",
							data: {
								"checkNo" : checkNo,
								"r1" : r1,
								"r2" : r2,
								"r3" : r3,
								"r4" : r4,
								"r5" : r5,
								"r6" : r6,
								"r7" : r7,
								"confirm" : confirm,
								"audit" : audit,
								"text" : text,
							},
							success:(data)=>{
								console.log(data);
								location.href=`${contextPath}/main/master/franAuditList`;
							},
							error: (jqXHR, textStatus, errorThrown)=>{
										console.log("textStatus", textStatus);
							}
						});

					}
				})

			}
		});

	});
});
