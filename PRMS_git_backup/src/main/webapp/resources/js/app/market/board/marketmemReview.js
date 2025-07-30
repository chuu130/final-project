	
	// 마이페이지 나의 리뷰 내역 목록가기 버튼 이벤트
		$(document).ready(function() {
		$('.showRvBtn').on('click', function() {
			  const prodIdno = $(this).data('prodid-no'); 
		      const url = `/prms/market/prodDetail/${prodIdno}?tab=review`;
		        window.location.href = url;
	    });
	});
	
	// 마이페이지 나의 리뷰 내역 삭제 버튼 이벤트
	// 삭제 sweetalert 확인창
		$(document).ready(function() {
			$('.deleteBtn').on('click', function() {
				const reviewNo = $(this).data('review-no');
	
				// Swal confirm 창으로 리뷰 삭제 확인
				Swal.fire({
					title: '리뷰를 삭제하시겠습니까?',
					text: '',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3E9172',
					cancelButtonColor: '#cecece',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						// 리뷰 삭제 요청 처리
						$.ajax({
							url : `/prms/market/member/${reviewNo}/memdelete`,
							type : 'POST',
							contentType : "application/json",
							data : JSON.stringify({
								reviewNo : reviewNo
							}),
							success : function(response) {
								if (response === 'success') {
									// Swal alert로 성공 메시지
									Swal.fire({
										title: '삭제 완료',
										text: '',
										icon: 'success',
										confirmButtonColor: '#3E9172'
									}).then(() => {
										location.reload();
									});
								} else {
									// Swal alert로 실패 메시지
									Swal.fire({
										title: '실패',
										text: '',
										icon: 'error',
										confirmButtonColor: '#3E9172'
									});
								}
							},
							error : function(xhr, status, error) {
								console.error('오류:', error);
								Swal.fire({
									title: '오류',
									text: '',
									icon: 'error',
									confirmButtonColor: '#3E9172'
								});
							}
						});
					}
				});
			});
		});
		
		
	
