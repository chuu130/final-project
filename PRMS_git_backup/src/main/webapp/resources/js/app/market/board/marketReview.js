
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
    const reviewReportResn = $('#reviewReportResn').val(); // 해당신고 값
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


    /* 사진 확대창 모달 열기 */
	function openModal(src) {
	    const modal = document.getElementById("imageModal");
	    const modalImg = document.getElementById("modalImage");
	    modal.style.display = "block";
	    modalImg.src = src;
	}

	/* 모달 닫기 */
	function closeModal() {
	    const modal = document.getElementById("imageModal");
	    modal.style.display = "none";
	}

	// 리뷰쓴 해당 아이디와 현재 로그인한 아이디가 일치하면
	// 리뷰 리스트에 노란색 배경으로 강조표시
	const reviewItems = document.querySelectorAll(".ms-t-review-item");
	const currentUserNoEl = document.getElementById("currentUserNo");
	
	let currentUserNo = null; // 기본값 null
		
	if(currentUserNoEl){
		currentUserNo = currentUserNoEl.value;
	}else{
		 console.warn("currentUserNo 없음");
	}
	console.log("reviewItems :", reviewItems);
	console.log("currentUserNoEl :", currentUserNoEl);
	console.log("currentUserNo :", currentUserNo);
	
	// 모든 리뷰 요소 가져와서
	reviewItems.forEach((item) => {
    const authorNo = item.getAttribute("data-author-No");
		console.log("authorNo :", authorNo);
		
	 // 작성자와 현재 로그인아이디 같으면 배경 강조
	 if (authorNo === currentUserNo) {
	      item.style.backgroundColor = "#ffeb3b26";
	    }
	  });


	// 마이페이지 리뷰버튼 클릭시 상품 디테일의 리뷰부분 보여주기
    document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const tab = params.get("tab");

	console.log("params :", params);
	console.log("tab :", tab);

    if (tab === "review") {
      // 상품리뷰 탭 링크 버튼 선택
      const reviewTabTrigger = document.querySelector('a[data-bs-target="#ms-spt-nav-review"]');
      
      if (reviewTabTrigger) {
        // Bootstrap 탭 기능 사용해서 탭 활성화
        const bootstrapTab = new bootstrap.Tab(reviewTabTrigger);
        bootstrapTab.show();

        // 선택된 탭 내용으로 이동 효과
        document.getElementById("ms-spt-nav-review").scrollIntoView({ behavior: "smooth" });
      }
    }
  });
	
	
