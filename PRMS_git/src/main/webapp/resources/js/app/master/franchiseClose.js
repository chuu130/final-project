/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
    const cPath = document.body.dataset.contextPath;
    const closeBtn = document.querySelectorAll(".closeBtn");

	 closeBtn.forEach(francloseTag => {
        francloseTag.addEventListener("click", (e) => {
			const franchiseId = e.currentTarget.dataset.franchiseId; // 클릭된 요소의 data-order-no 값을 가져옵니다.
            console.log(franchiseId);
			Swal.fire({
				   title: '가맹점을 폐업처리 하시겠습니까?',
				   text: '해당가맹점이 폐업처리가 되니 신중하게 선택하세요.',
				   icon: 'warning',

				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소' // cancel 버튼 텍스트 지정

				}).then(result => {
				   // 만약 Promise리턴을 받으면,
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					   Swal.fire({
						   title: '가맹점 폐업처리가 완료었습니다.',
						   text: '',
						   icon: 'success',
						   confirmButtonColor: '#3085d6'
					}).then(()=>{
							 $.ajax({
				                url: `${cPath}/main/master/${franchiseId}/franchiseClose`, // AJAX 요청 URL
				                method: "GET",
				                success: function(release) {
									location.href = `${cPath}/main/master/franchiseeList`;
								},
				                error: function(xhr, status, error) {
				                    console.error("AJAX 요청 실패:", error);
				                }
				            });

						});
				   }
				});
			 });
	});
});