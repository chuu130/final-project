document.addEventListener("DOMContentLoaded", () => {

	
	const contextPath = document.body.dataset.contextPath;
	
	//$(".addCart").off().on("click", function(){
	$(".wishBody").on("click", ".addCart", function(){
		let memNo =  $(this).closest(".ms-availability").find(".memNo").val();
		let prodId =  $(this).closest(".ms-availability").find(".prodId").val();
		console.log(memNo, prodId);
		
		let url = `${contextPath}/market/prodDetail/addCart`;
		let method = "POST";
		let headers = {
				'content-type' : "application/json",
				'accept' : "application/json"
		};
		let body = JSON.stringify({
			prodId : prodId,
			cdQy : 1,
			memNo : memNo
		});

		FetchUtils.fetchForJSON(url, {
			method:method,
			headers:headers,
			body:body
		}).then(({serviceResult}) => {

			// 장바구니에 추가되었다면
			if(serviceResult == 'OK'){
			
				Swal.fire({
					title: '장바구니에 추가되었습니다. 이동하시겠습니까?',
					icon:'success',

					showCancelButton: true,
					confirmButtonColor: '#3E9172',
					cancelButtonColor: '#cecece',
					confirmButtonText: '이동',
					cancelButtonText: '닫기',
				}).then(result => {
					if(result.isConfirmed) {
						location.href =`${contextPath}/market/member/memberCart`;
					}
				});
			} else {
				Swal.fire({
					title: '장바구니에 해당상품이 담겨져 있습니다.',
					text:'나중에 다시 시도해주세요',
					icon:'error',
					confirmButtonColor: '#3E9172'
				})
			}
		});
	});

	
	//$("#wishRemove").off().on("click", function(){
	$(".wishBody").on("click", "#wishRemove", function(){
		let memNo =  $(this).closest(".ms-pro-content").find(".memNo").val();
		let prodId =  $(this).closest(".ms-pro-content").find(".prodId").val();
		console.log(memNo, prodId);
		
		Swal.fire({
			title: '찜 목록에서 삭제하시겠습니까?',
			icon: 'warning',

			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3E9172', // confrim 버튼 색깔 지정
			cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
			confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			reverseButtons: false, // 버튼 순서 거꾸로

		}).then(result => {
			// 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				Swal.fire({
						title: '찜 목록에서 삭제되었습니다',
						text:'',
						icon:'success',
						confirmButtonColor: '#3E9172'
				}).then(result2 =>{
					if(result2.isConfirmed){
							$.ajax({
								url : `${contextPath}/market/member/memberWishListDelete`,
								data : {"memNo" : memNo,
										"prodId" : prodId},
								method : "POST",
								success:(data)=>{
									console.log(data);
									$(".ms-wishlist-count").html(data);
									location.reload();
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