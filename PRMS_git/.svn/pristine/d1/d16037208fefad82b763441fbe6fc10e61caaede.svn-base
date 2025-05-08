/**
 * 
 */
/*
	// 리뷰신고하기 클릭이벤트
	$(document).ready(function() {
	
	    // 동적으로 생성된 요소에도 이벤트를 바인딩하기 위해 document에 이벤트 위임
		// 리뷰 아이디의 data 속성을 이용해 값을 가지고온다
		// 리뷰 리스트 동적생성.review-report-group 클릭하면 이벤트발생
	    $(document).on('click', '.review-report-group', function() { 
	        const reviewId = $(this).closest('.ms-t-review-item').data('review-id');
	        $('#reviewNo').val(reviewId);  // 숨겨진 입력 필드에 리뷰 번호 설정
	        $('#reportModal').css('display', 'block'); // 모달을 화면에 표시
	    });
	
	    $('.close').click(function() {
	        $('#reportModal').css('display', 'none'); // 모달을 화면에서 숨김
	    });
	
	    $(window).click(function(event) {
	        if ($(event.target).is('#reportModal')) {
	            $('#reportModal').css('display', 'none'); // 모달을 화면에서 숨김
	        }
	    });
	
	});

	$('#reportForm').submit(function(event) {
    event.preventDefault(); // 기본 제출 동작 방지
    
//    const reviewReport = $('#reviewReport').val();
//    const reviewId = $('#reviewNo').val();
    const reviewReportResn = $('#reviewReportResn').val();
	const reviewNo = $('#reviewNo').val(); // 해당 리뷰 번호
    const prodId = $('#prodId').val(); // 상품 ID를 가져옴  


	 console.log("reviewReportResn?",reviewReportResn);
	 console.log("reviewNo?",reviewNo);
	 console.log("prodId?",prodId);
       

   // 성공 메시지와 모달을 참조
	const successMessage = $('#successMessage');
	const modal = $('#reportModal');
	
	// AJAX 요청
	$.ajax({
	    url: `/prms/market/member/${prodId}/status`,
	    method: 'POST',
	    contentType: 'application/json',
	    data: JSON.stringify({
	        reviewNo: reviewNo,
	        reviewReportResn: reviewReportResn
	    }),
	    success: function(response) {
	        // 서버에서 반환한 JSON 응답을 처리
	        if (response.status === "success") {
	            successMessage.text(response.message).show(); // 성공 메시지 표시
	            alert('신고 접수에 성공했습니다.');
					setTimeout(() => {
	                modal.hide(); // 모달 숨기기
	                successMessage.hide(); // 성공 메시지 숨기기
	            }, 100); // 0.1초 후 숨기기
	        } else {
	            alert(response.message || '신고 접수에 실패했습니다.');
	        }
	    },
	    error: function(xhr, status, error) {
	        console.log("AJAX 요청 실패:", xhr, status, error);
	        console.log("서버 응답:", xhr.responseText);
	        alert('신고 접수에 실패했습니다.');
	    }
	});

});

*/