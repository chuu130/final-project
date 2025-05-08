<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	a{
  text-decoration:none; color:inherit; cursor: pointer;
}
 .right_area .icon{
    display: flex;
    align-items: center;
    justify-content: center;
    width: calc(100vw * (45 / 1920));
    height: calc(100vw * (45 / 1920));

    border-radius: 50%;
    border: solid 2px #eaeaea;
    background-color: #fff;
}

.icon.heart img{
    width: calc(100vw * (24 / 1920));
    height: calc(100vw * (24 / 1920));
}

.icon.heart.fas{
  color:red
}
.heart{
    transform-origin: center;
}
.heart.active img{
    animation: animateHeart .3s linear forwards;
}

@keyframes animateHeart{
    0%{transform:scale(.2);}
    40%{transform:scale(1.2);}
    100%{transform:scale(1);}
  }
</style>
<!-- 마켓 리뷰 리스트 및 신고 모달 css -->
<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketReview.css">

	 <!-- Breadcrumb start -->
    <div class="ms-breadcrumb">
        <div class="container">
            <div class="row" id="prod-detail-align">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">상품상세</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="index.html">홈</a></li>
                                <li class="ms-breadcrumb-item active">상품상세</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->



    <!-- Sart Single Product -->
    <section class="ms-single-product padding-b-30">
        <div class="container">
            <div class="row">
                <div class="ms-pro-rightside ms-common-rightside col-md-12">

                    <!-- Single product content Start -->
                    <div class="single-pro-block">
                        <div class="single-pro-inner mt-5">
                            	<button onclick="history.back()" id="backbtn"><i class="bi bi-chevron-left"></i>뒤로가기</button>
                            <div class="row mt-3">
                                <div class="single-pro-img single-pro-img-no-sidebar mt-4">
                                		<img alt="상품이미지" src="${adminvProd.prod.prodImage }" style="width:400px; height:400px" class="image-over">
                                </div>
                                <div class="single-pro-desc single-pro-desc-no-sidebar mt-5">
                                    <div class="single-pro-content">
                                        <h5 class="ms-single-title" data-prod-id="${adminvProd.prodId }" id="prodNm">${adminvProd.prod.prodSleNm }
                                        </h5>

                                        <div class="ms-single-price-stoke">
                                            <div class="ms-single-price">
                                                <div class="final-price">${adminvProd.prod.prodSlePcComma }원</div>
<%--                                                 <div class="mrp">*실버 : <span>${adminvProd.prod.prodSlePc * 95 / 100 }원</span></div> --%>
<%--                                                 <div class="mrp">*골드 : <span>${adminvProd.prod.prodSlePc * 93 / 100 }원</span></div> --%>
<%--                                                 <div class="mrp">*플래티넘 : <span>${adminvProd.prod.prodSlePc * 90 / 100 }원</span></div> --%>
                                            </div>
                                        </div>


                                        <div class="ms-pro-variation">
                                            <div class="ms-pro-variation-inner ms-pro-variation-size">
                                                <span>${adminvProd.prod.lprod.cmmnRemark1 } > ${adminvProd.prod.lprod.cmmnCodeNm }</span>
                                            </div>
                                        </div>
                                        <div class="ms-single-qty">
                                            <div class="qty-plus-minus">
                                                <input id="cdQy" class="qty-input" type="text" name="ms_qtybtn" value="1">
                                            </div>
                                            <div class="mx-3 mt-2"><span>구매가능 수량 : </span><span id="admininvQy">${adminvProd.admininvQy}</span><span>개</span></div>

	                                            <c:choose>
		                                            <c:when test="${check eq 'true'}">
			                                            <div class="ms-single-wishlist">
			                                                <a class="ms-btn-group wishlist icon heart active" title="Wishlist">
			                                                 	<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기">
			                                                </a>
			                                            </div>
		                                            </c:when>
		                                            <c:otherwise>
		                                            	<div class="ms-single-wishlist">
		                                                <a class="ms-btn-group wishlist icon heart" title="Wishlist">
		                                                 	<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
		                                                </a>
		                                            </div>
		                                            </c:otherwise>
	                                            </c:choose>
                                        </div>
                                        <div class="ms-single-qty mt-3">
                                            <div class="ms-single-cart">
                                                <button class="btn btn-primary ms-btn-2" id="cartBtn" style="margin-left: 0;">장바구니 담기</button>
                                            </div>
                                            <div class="ms-single-cart">
                                                <button class="btn btn-primary ms-btn-2" id="purchasingBtn">구매하기</button>
                                            </div>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Single product content End -->


                    <!-- Single product tab start -->
                    <div class="ms-single-pro-tab">
                        <div class="ms-single-pro-tab-wrapper">
                            <div class="ms-single-pro-tab-nav">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-bs-toggle="tab" data-bs-target="#ms-spt-nav-details" role="tab">상품설명</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#ms-spt-nav-review" role="tab">상품리뷰</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content  ms-single-pro-tab-content">
                                <div id="ms-spt-nav-details" class="tab-pane fade show active">
                                    <div class="ms-single-pro-tab-desc">
                                    	<p>
											${adminvProd.prod.prodDc }추천!!
                                    	</p>
                                    	<p>추석연휴로 인한 배송 일정 참고 부탁드립니다. 9월 23일 오후 1시 이후 결제 건은 24일부터 순차적으로 배송됩니다. :)</p>
                                    	<c:if test="${adminvProd.prod.prodId == '83827024889'}">
                                    	<img src="https://img.biteme.co.kr/editor/20240614142901570257916.jpg" style="width: 100%;">
                                  	 	</c:if>
                                  	 	<c:if test="${adminvProd.prod.prodId == '37524570621'}">
                                  	 	<img src="https://shop-phinf.pstatic.net/20221229_138/1672274488967x24jC_GIF/18.gif?type=wg860" style="width: 100%;">
                                  		</c:if>
                                    </div>
                                </div>
                                <div id="ms-spt-nav-review" class="tab-pane fade">
                                    <div class="row">
                                        <div class="ms-t-review-wrapper">
                                        	<c:choose>
                                        		<c:when test="${not empty reviewList }">
												<c:forEach items="${reviewList }" var="review">
													<div class="ms-t-review-item"
														data-review-id="${review.reviewNo}">
														<div>
															<img
																src="/prms/files/${review.atchfile.fileDetails[0].streFileNm}_${review.atchfile.fileDetails[0].orignlFileNm}"
																onclick="openModal(this.src)" alt="리뷰 등록한 이미지" class="rev-image"> 
														</div>
														<div class="ms-t-review-content" style="width: 50px;">
															<div class="ms-t-review-top">
																<div class="ms-t-review-name">
																	<span class="fs-6">${review.reviewSj }</span><br>
																	<small class="ms-6">${review.reviewDe }</small>
																</div>
																<small>${review.reviewWriter.memNm }</small>
																<div class="ms-t-review-rating">
																	<c:forEach begin="0" end="4" varStatus="loopStatus">
																		<c:if
																			test="${loopStatus.index + 1 <= review.reviewScore}">
																			<i class="msicon msi-star fill"></i>
																		</c:if>
																		<c:if
																			test="${loopStatus.index + 1 > review.reviewScore}">
																			<i class="msicon msi-star-o"></i>
																		</c:if>
																	</c:forEach>
																</div>
															</div>
															<div class="ms-t-review-bottom">
																<p style="width: 90%;">${review.reviewCn }</p>
															</div>
														</div>
														<div class="review-report-group">
															<div class="ms-single-cart">
															<c:choose>
										                          <c:when test="${not empty memNo}">
										                              <c:if test="${not empty review.memNo and review.memNo != memNo}">
										                                  <button class="btn ms-btn-2" id="">신고</button>
										                              </c:if>
										                          </c:when>
										                          <c:otherwise>
										                              <!-- 로그인하지 않은 상태에서는 신고 버튼을 보이지 않음 -->
										                          </c:otherwise>
										                      </c:choose>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p>해당 상품은 리뷰가 존재하지 않습니다.</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- product details description area end -->
			</div>
		</div>
	</div>
</section>
<!-- End Single Product -->

    <!-- Related product section -->
    <section class="ms-new-product padding-tb-30">
        <div class="container">
            <div class="section-title-2">
                <h2 class="ms-title">비슷한 <span>상품</span></h2>
                <p>고객님을 위한 추천 상품</p>
            </div>
            <div class="row p-t-15">
                <div class="ms-new-product col-lg-12">
                    <div class="section-bg-color section-space-p30 main-border-radius">
                        <div class="ms-product-block m-minus-15">
                            <div class="new-product-carousel owl-carousel">
								<c:choose>
									<c:when test="${not empty similarProdList }">
										<c:forEach items="${similarProdList }" var="similarProd">
											<div class="ms-product-content">
			                                    <div class="ms-product-inner">
			                                        <div class="ms-pro-image-outer">
			                                            <div class="ms-pro-image">
			                                                <a href="${cPath }/market/prodDetail/${similarProd.prodId}" class="image">
			                                                    <span class="label veg">
			                                                        <span class="dot"></span>
			                                                    </span>
			                                                    <img class="main-image" src="${similarProd.prodImage }"
			                                                        alt="상품이미지">
			                                                </a>
			                                            </div>
			                                        </div>
			                                        <div class="ms-pro-content">
			                                            <a href="${cPath }/market/prodDetail/${similarProd.prodId}">
			                                                <h6 class="ms-pro-stitle">${similarProd.lprod.cmmnCodeNm }</h6>
			                                            </a>
			                                            <h5 class="ms-pro-title"><a href="${cPath }/market/prodDetail/${similarProd.prodId}">${similarProd.prodSleNm }</a></h5>
			                                            <div class="ms-pro-rat-price">
<!-- 			                                                <span class="ms-pro-rating"> -->
<!-- 			                                                    <i class="msicon msi-star fill"></i> -->
<!-- 			                                                    <i class="msicon msi-star fill"></i> -->
<!-- 			                                                    <i class="msicon msi-star"></i> -->
<!-- 			                                                    <i class="msicon msi-star"></i> -->
<!-- 			                                                    <i class="msicon msi-star"></i> -->
<!-- 			                                                </span> -->
			                                                <span class="ms-price">
			                                                    <span class="new-price">${similarProd.prodSlePcComma }원</span>
<!-- 			                                                    <span class="old-price">$50.00</span> -->
			                                                </span>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
		                                </c:forEach>
									</c:when>
									<c:otherwise>
										<div><p>비슷한 상품정보가 없습니다.</p></div>
									</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

        <!-- 모달 창 -->
	<div id="reportModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <form action="/prms/market/member/${prodId}/status" method="post" id="reportForm" >
	            <label for="reviewReportResn">신고 사유를 입력하세요:</label><br>
	            <input type="hidden" id="reviewNo" name="reviewNo">
	            <input type="hidden" id="prodId" name="prodId" value="${prodId}">
	            <input type="text" id="reviewReportResn" name="reviewReportResn" placeholder="신고사유" required><br><br>
	            <button type="submit">신고하기</button>
	        </form>
	    </div>
	</div>

    <script>
    	console.log(${ejJsonStr});

    </script>
    <!-- Related product section End -->


    <div id="imageModal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImage">
</div>

	<script>
	/* 모달 열기 js링크연결 잘 안됨 */
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
	</script>

	<script src="${cPath }/resources/js/app/market/board/marketReview.js"></script>
    <script src="${cPath }/resources/js/app/market/prod/prodDetail.js"></script>
	<script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>
