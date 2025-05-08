<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- BEGIN #content -->
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">QNA</li>
		</ul>
		<h1 class="page-header mb-0">QNA</h1>
	</div>
</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap"></div>

<div class="card">

	<!-- END input-group -->

	<!-- BEGIN table -->
	<div class="tab-content p-4">
		<div class="table-responsive">
			<table class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th class="board-header-container">
							<div class="board-header-title">${center.ctrBbsNm}</div>
							<div class="board-header-date">${center.ctrBbsDe}</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="board-content-row">
						<td class="board-content">${center.ctrBbsCn}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- END table -->
		<!-- BEGIN table -->
		<div class="container">
<%-- 			<form name="commentInsertForm" method="post" enctype="multipart/form-data"> --%>
<%-- 		<p>${qnaviewList }</p> --%>
				<c:if test="${not empty qnaviewList}">
					<c:forEach items="${qnaviewList}" var="qnaview">
						<div class="container mt-5">
							<div class="comment-list">
								<div class="comment border p-3 mb-3 rounded">
									<div class="comment-body">
										<h3 class="fw-bold">답변</h3>
										<div class="comment-author fw-bold">${qnaview.empId}</div>
										<div class="comment-date text-muted small">${qnaview.qnaAnswerDe}</div>
										<div class="comment-content mt-2">${qnaview.qnaAnswerNm}</div>
										<div class="comment-content mt-2">${qnaview.qnaAnswerCn}</div>
										<div class="detailBtn">
										<form method="get" action="${cPath }/main/master/centerMasterUpdate/${qnaview.qnaAnswerId}" >
											<button type="submit" class="btn btn-primary">답변수정</button>
										</form>
										<form method="post" action="${cPath }/main/master/centerMasterDelete/${qnaview.qnaAnswerId}" id="deleteform">
											<input type="hidden" name="ctrBbsNo" value="${qnaview.ctrBbsNo}">
											<button type="button" data-answer-id="${qnaview.qnaAnswerId}" class="btn btn-danger delBtn">답변삭제</button>
										</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
<%-- 			</form> --%>
		</div>
		<!-- END table -->


		<div class="noticeBtn-group">
			<div class="d-lg-flex align-items-center">
				<div class="ms-auto">
					<a href="${cPath }/main/master/centerMasterList"
						class="btn btn-primary">목록조회</a>
				</div>
				<div class="ms-auto">
					<a href="${cPath }/main/master/centerMasterInsert/${center.ctrBbsNo}"
						class="btn btn-primary">답변등록</a>
				</div>
<!-- 				<div class="ms-auto"> -->
<%-- 					<a href="${cPath }/main/master/centerMasterUpdate/${ctrBbsNo}" --%>
<!-- 						class="btn btn-primary">답변수정</a> -->
<!-- 				</div> -->
<!-- 				<div class="ms-auto"> -->
<%-- 					<a href="${cPath }/main/master/centerMasterDelete/${ctrBbsNo}" --%>
<!-- 						class="btn btn-primary">답변삭제</a> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</div>
</div>
<!-- END table -->
<!-- END #content -->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

document.addEventListener("click", async (event) => {
    if (event.target.classList.contains("delBtn")) {
    	console.log(event.target);
    }
    const qnaAnswerId = event.target.getAttribute("data-answer-id");
    console.log("삭제할 답변 ID:", qnaAnswerId);
	
    if (qnaAnswerId) {
    
    const result = await Swal.fire({
        title: '삭제하시겠습니까?',
        text: '한 번 삭제하면 되돌릴 수 없습니다.',
        icon: 'warning',
        showCancelButton: true,// cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
        confirmButtonText: '확인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소'// cancel 버튼 텍스트 지정
    });

    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
    	 const url = `${cPath}/main/master/centerMasterDelete/\${qnaAnswerId}`;
    	 const form = event.target.closest('form');
    	 
    	 form.action = url;
    	 
    	 form.submit();
 
    	 Swal.fire({
            title: '삭제가 완료되었습니다.',
            text: '',
            icon: 'success',
            confirmButtonColor: '#3085d6'
        });
    	
    }
    }
});


// 선택한 요소의 부모폼 찾기
// const selectform = event.target.closest("selectform");

// if (selectform) {
// 	selectform.requestSubmit();
    
//아래 안쓰는 코드
	$(document).ready(function() {
		$('.answerUpdate').on('click', function() {
			//const reviewNo = $(this).data('qnaAnswer-Id');

			// Swal confirm 창으로 답변글 수정 확인
			Swal.fire({
				title: '답변을 수정하시겠습니까?',
				text: '',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3E9172',
				cancelButtonColor: '#cecece',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					// 답변 삭제 요청 처리
					$.ajax({
						url : `/prms/market/member/\${reviewNo}/delete`,
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
</script>

