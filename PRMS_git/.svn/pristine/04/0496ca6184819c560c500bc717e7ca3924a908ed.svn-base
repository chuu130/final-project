<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

</style>

<section class="ms-blog padding-tb-30">
	<div class="container">
		<div class="row">
			<!-- Sidebar Area Start -->
			<div
				class="ms-blogs-sidebar ms-blogs-leftside col-lg-3 order-lg-first col-md-12 order-md-last m-t-991">
				<div class="ms-blog-sidebar-wrap">
					<!-- Sidebar Recent Blog Block -->
					<div class="ms-sidebar-block ms-sidebar-recent-blog">
						<div class="ms-sb-title">
							<h3 class="ms-sidebar-title">마이페이지 메뉴</h3>
						</div>
						<div class="ms-blog-block-content ms-sidebar-dropdown">
							<div class="ms-sidebar-block-item">
								<div class="ms-sidebar-block-detial">
									<c:url value="/market/member/${memberVO.memId }/mypage"
										var="memMypage" />
									<a href="${memMypage }">회원상세</a>
								</div>
							</div>
							<div class="ms-sidebar-block-item">
								<div class="ms-sidebar-block-detial">
									<c:url value="/market/member/orderList" var="memOrder" />
									<a href="${memOrder }">상품주문내역</a>
								</div>
							</div>
							<div class="ms-sidebar-block-item">
								<div class="ms-sidebar-block-detial">
									<c:url
										value="/market/member/${memberVO.memNo }/beautyResDetail"
										var="beautyResDetail" />
									<a href="${beautyResDetail }">미용예약내역</a>
								</div>
							</div>
							<div class="ms-sidebar-block-item">
								<div class="ms-sidebar-block-detial">
									<c:url value="/market/member/${memberVO.memNo }/hotelResDetail"
										var="hotelResDetail" />
									<a href="${hotelResDetail }">호텔예약내역</a>
								</div>
							</div>
							<div class="ms-sidebar-block-item">
								<div class="ms-sidebar-block-detial">
									<c:url value="/market/member/${memberVO.memNo }/memcoupon"
										var="memCouUrl" />
									<a href="${memCouUrl}">보유 쿠폰</a>
								</div>
							</div>
							<div class="ms-sidebar-block-item">
								<div class="ms-sidebar-block-detial">
									<c:url value="/market/member/${memberVO.memNo }/memreview"
										var="memReviewUrl" />
									<a href="${memReviewUrl}">내가 쓴 리뷰</a>
								</div>
							</div>
						</div>
					</div>
					<!-- Sidebar Recent Blog Block -->
				</div>
			</div>

			<!-- content Start -->
			<div
				class="ms-blogs-rightside col-lg-9 order-lg-last col-md-12 order-md-first">
				<div class="ms-blogs-content">
					<div class="ms-blogs-inner">
						<div class="row">
							<div class="section-title-2" id="titleresdt">
								<h2 class="ms-title">나의리뷰내역</h2>
							</div>


							<c:if test="${not empty memReview }">
								<c:forEach items="${memReview }" var="review">
									<c:if test="${review.reviewDelAt == 'N'}">
										<div class="col-md-12 col-sm-12 mb-6 ms-blog-block">
											<div class="ms-blog-item">
												<div class="news-info" style="padding: 0 24px 10px 24px;">
													<div class="detail">
														<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
															prefix="fmt"%>
														<label id="tmstyle">등록일:${review.reviewDe}</label>
														<h5 class="resinfotitle" style="margin-top: 0;">상품번호:
															${review.prodId }</h5>
														<div class="text-length col">
														<h6>${review.prodSleNm }</h6>
															<a href="${cPath}/market/prodDetail/${review.prodId}"><img
																src="/prms/files/${review.atchfile.fileDetails[0].streFileNm}_${review.atchfile.fileDetails[0].orignlFileNm}"
																style="width: 20%;" alt="myimage"></a>
															<div class="review-detail">
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
																<div class="row" style="margin-left: 0">
																	리뷰제목 : ${review.reviewSj} <br>리뷰번호 :
																	${review.reviewNo } <br>리뷰내용 : ${review.reviewCn }
																</div>
																<div class="more-info col" id="cancel">
																	<input type="button" value="리뷰삭제" id="allbtn"
																		class="deleteBtn" data-review-no="${review.reviewNo }" />
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>




			<!-- Pagination Start -->
			<!--                         <div class="ms-pro-pagination paging-Area"> -->
			<!--                             <ul class="ms-pro-pagination-inner"> -->
			<%--                             	${pagingHTML } --%>
			<!--                             </ul> -->
			<!--                         </div> -->
			<%-- 						<form:form id="searchForm" method="get" modelAttribute="condition"> --%>
			<%-- 							<form:input type="hidden" path="searchType"/> --%>
			<%-- 							<form:input type="hidden" path="searchWord"/> --%>
			<!-- 							<input type="hidden" name="page" /> -->
			<%-- 						</form:form> --%>
			<!-- Pagination End -->
			<!-- 	                    </div> -->
			<!--Blog content End -->
			<!--                 </div> -->
			<!--               </div> -->

			<!--               row End -->
		</div>
	</div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
