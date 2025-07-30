<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">
<style>

.ms-t-review-avtar span {
font-weight: bold;
font-size: 14px;
}

.ms-t-review-content {
flex-grow: 1;
margin-left: 20px;
}

.ms-t-review-top {
display: flex;
justify-content: space-between;
align-items: center;
margin-bottom: 5px;
align-items: flex-start;
}

.ms-t-review-name {
font-weight: bold;
font-size: 16px;
}

/* 리뷰 리스트 별점 */
.ms-t-review-rating {
color: #ffa500; /* 별점 색상 */
}

.ms-t-review-bottom p {
font-size: 14px;
line-height: 1.6;
margin: 10px 0 0;
}

.msicon.msi-star.fill {
color: #ffa500; /* 채워진 별 색상 */
}

.msicon.msi-star-o {
color: #ccc; /* 빈 별 색상 */
}

.ms-single-cart {
margin-top: 10px;
text-align: left;
}

/* 리뷰이미지사이즈 fix */
.rev-image{
object-fit: contain; 
height: 150px;
width: 150px;
margin-left: 20px;
	
}

</style>

<!-- 본사 master 공지사항 디테일 페이지 -->
<!-- BEGIN #content -->
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">리뷰</li>
		</ul>
		<h1 class="page-header mb-0">리뷰상세 상세조회</h1>
	</div>
</div>


<!-- #contentBOX -->
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">
			<%-- 			<c:if test="${not empty memReview }"> --%>
			<%-- 				<c:forEach items="${memReview }" var="review"> --%>
			<div class="detail">
				<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
				<label id="tmstyle">${review.reviewDe}</label>
				<h5 class="resinfotitle" style="margin-top: 0;">상품번호 :
					${review.prodId }</h5>
				<div class="text-length col">
					<div class="col-md-4 p-3">
						<a href="${cPath}/market/prodDetail/${review.prodId}">
						<img src="/prms/main/atch/${review.atchfile.atchFileId}/${review.atchfile.fileDetails[0].fileSn}"
							alt="리뷰이미지" class="card-img">
						</a>
					</div>
					<div class="row" style="margin-left: 0">
						리뷰제목 : ${review.reviewSj} <br>
						리뷰번호 : ${review.reviewNo } <br>
						리뷰내용: ${review.reviewCn }<br>
						리뷰평점: ${review.reviewScore }
						
					</div>
				</div>
			</div>
			<%-- 				</c:forEach> --%>
			<%-- 			</c:if> --%>


			<!-- END table -->
					<div class="ms-t-review-rating custom-star-list"
																	style="justify-content: left; margin-left: 4%; margin-top: 1%; ">
																	<c:forEach begin="0" end="4" varStatus="loopStatus">
																		<c:if
																			test="${loopStatus.index + 1 <= review.reviewScore}">
																			<i class="msicon msi-star fill"
																				style="font-size: 20px !important;"></i>
																		</c:if>
																		<c:if
																			test="${loopStatus.index + 1 > review.reviewScore}">
																			<i class="msicon msi-star-o"
																				style="font-size: 20px !important;"></i>
																		</c:if>
																	</c:forEach>
																</div>
			<div class="detailBtn">
				<div class="detailBtn-align">
					<div class="d-lg-flex align-items-center">
						<div class="ms-auto">
							<a href="${cPath}/main/master/reviewmasterList"
								class="btn btn-theme fw-semibold fs-13px">목록조회</a>
						<input type="button" value="리뷰삭제" class="deleteBtn btn btn-theme fw-semibold fs-13px"" data-review-no="${review.reviewNo }" />
						</div>
					</div>
				</div>
			</div>

			<script>
// 				function deletebtn() {
// 					return confirm("정말 삭제하시겠습니까?");
// 				}
				
				// 관리자 리뷰 내역 삭제 버튼 이벤트
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
										url : `/prms/main/master/${reviewNo}/listdelete`,
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
													location.href = '/prms/main/master/reviewmasterList';
													//location.reload(); 
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

		</div>
	</div>
</div>
<!-- #contentBOX END -->