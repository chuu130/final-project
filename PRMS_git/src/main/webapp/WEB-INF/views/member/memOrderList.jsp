<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


	<style>
		#order-style{
			table-layout: fixed;
			width: 100%;
		}
		#delivery-Btn{
			margin-right: 13px;
		}
		.order-align{
			margin: 20px;
		}

		.modal-content {
		  min-width: 1024px;
		  max-width: 1024px;
		  max-height: 861px;
		  overflow-y: auto;
		}

		.modal-dialog {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}

		.nav-link{
			color: #757575;
		}

		.reviewBtn{
			background: #54a06c;
    		border: none;
    		color: #fff;
    		font-weight: 500;
		}

		.reviewBtn:hover{
			background: #46855a;
    		color: #fff;
		}
	</style>

	<!-- 배송상태 -->
	<span style="display:none" id="chDlvySttus">${chDlvySttus }</span>


	<!-- 회원정보 -->
	<security:authorize access="hasAuthority('ROLE_USER')">
		<security:authentication property="principal" var="principal"/>
		<c:set value="${principal.realUser }"  var="member" />
	</security:authorize>


	<!-- 주문상세 모달 -->
	<div class="modal fade" id="orderDtModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="exampleModalLabel">주문상세</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<h5 id="orderDt">날짜</h5>
	      	<h6 id="orderNumber">주문번호</h6>
	      	<hr>
	        <h5>${member.memNm }</h5>
			<ul>
				<li>${member.memTelno }</li>
				<li id="deliveryLi">(우편번호)주소 상세주소</li>
			</ul>
			<hr>
	        <h5>주문상품</h5>
	        <table class="table">
				<thead>
					<tr>
						<th class="text-center">상품이미지</th>
						<th class="text-center">상품명</th>
						<th class="text-center">판매가</th>
						<th class="text-center">구매수량</th>
						<th class="text-center">총구매가</th>
					</tr>
				</thead>
				<tbody id="orderProdDt">

				</tbody>
	        </table>
			<hr>
	      	<h5>결제 정보</h5>
	        <table class="table table-borderless">
	        		<tbody id="orderPayDt">

	        		</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn ms-btn-2" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>


    <section class="ms-blog padding-tb-30">
        <div class="container">
            <div class="row">
            	<!-- Sidebar Area Start -->
	                <div class="ms-blogs-sidebar ms-blogs-leftside col-lg-3 order-lg-first col-md-12 order-md-last m-t-991">
	                    <div class="ms-blog-sidebar-wrap">
	                        <!-- Sidebar Recent Blog Block -->
	                        <div class="ms-sidebar-block ms-sidebar-recent-blog">
	                            <div class="ms-sb-title">
	                                <h3 class="ms-sidebar-title">마이페이지 메뉴</h3>
	                            </div>
	                            <div class="ms-blog-block-content ms-sidebar-dropdown">
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memId }/mypage" var="memMypage"/>
	                                        <a href="${memMypage }">회원상세</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/orderList" var="memOrder"/>
	                                        <a href="${memOrder }">상품주문내역</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memNo }/beautyResDetail" var="beautyResDetail"/>
	                                        <a href="${beautyResDetail }">미용예약내역</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memNo }/hotelResDetail" var="hotelResDetail"/>
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

                <div class="ms-blogs-rightside col-lg-9 order-lg-last col-md-12 order-md-first">
                    <!-- Blog content Start -->
                    <div class="ms-blogs-content">
                        <div class="ms-blogs-inner">
                            <div class="ms-single-blog-item">
                                <div class="single-blog-info">
                                    <div class="single-blog-detail">

									<!-- Sample section Start -->
                                      <section class="ms-register padding-b-30">

                                      	<div class="section-title-2" id="titleresdt">
			                            	<h2 class="ms-title">상품주문내역</h2>
										</div>

										<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
											<li class="nav-item me-2" role="presentation">
												<a href="#allTab"
												class="nav-link active px-2" data-bs-toggle="tab" id="all-tab"
												aria-controls="a1" aria-selected="true" role="tab">전체</a>
											</li>
											<li class="nav-item me-2" role="presentation">
												<a href="#allTab"
												class="nav-link  px-2" data-bs-toggle="tab" id="all-tab"
												aria-controls="a1" aria-selected="true" role="tab">입금확인</a>
											</li>
											<li class="nav-item me-2" role="presentation">
												<a href="#allTab"
												class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
												aria-controls="a1" aria-selected="true" role="tab">배송중</a>
											</li>
											<li class="nav-item me-2" role="presentation">
												<a href="#allTab"
												class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
												aria-controls="a1" aria-selected="true" role="tab">배송완료</a>
											</li>
											<li class="nav-item me-2" role="presentation">
												<a href="#allTab"
												class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
												aria-controls="a1" aria-selected="true" role="tab">취소완료</a>
											</li>
										</ul>

									  </section>
									<div>
										<c:choose>
											<c:when test="${memOrderList eq null or fn:length(memOrderList) == 0 }">
												<h4>[${chDlvySttus}]내역이 존재하지 않습니다.</h4>
											</c:when>
											<c:otherwise>
												<c:forEach items="${memOrderList }" var="memOrder">
													<div class="mb-3" style="border: solid 1px #dedede;">
														<div class="tab-content p-4">
															<div class="tab-pane fade show active" id="allTab" role="tabpanel">
																<div class="table-responsive">
																	  <div class="order-align">
																		<div class="d-flex justify-content-between">
																			<h5 class="mb-4" style="font-size: large;">주문번호 : <span class="text-success" >${memOrder.orderDtlsId }</span></h5>
																			<c:if test="${memOrder.delivery.dlvySttus eq '입금확인'}">
																				<h5 class="text-primary dlvyStatus" style="font-size: large;" >${memOrder.delivery.dlvySttus }</h5>
																			</c:if>
																			<c:if test="${memOrder.delivery.dlvySttus eq '배송중' or memOrder.delivery.dlvySttus eq '배송완료'}">
																				<h5 class="text-success dlvyStatus">${memOrder.delivery.dlvySttus }</h5>
																			</c:if>
																			<c:if test="${memOrder.delivery.dlvySttus eq '취소완료'}">
																				<h5 class="text-danger dlvyStatus">${memOrder.delivery.dlvySttus }</h5>
																			</c:if>
																		</div>
																		<div class="d-flex justify-content-end">
																			<h6>
																				<button class="orderDtBtn" data-order-number=${memOrder.orderDtlsId }>주문상세<i class="bi bi-chevron-right"></i></button>
																			</h6>
																		</div>
																		</div>
																		<table class="table table-hover text-nowrap" id="order-style">
																			<thead>
																				<tr>
																					<th class="text-center" style="width:20%;">상품이미지</th>
																					<th class="text-center" style="width:40%;">상품명</th>
																					<th class="text-center" style="width:10%;">판매가</th>
																					<th class="text-center" style="width:10%;">구매수량</th>
																					<th class="text-center" style="width:10%;">총구매가</th>
																					<th class="text-center" style="width:10%;">리뷰</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${memOrder.orderDtList }" var="orderDt">
																					<tr>
																						<td class="text-center align-middle" style="width:20%;"><a href="${cPath}/market/prodDetail/${orderDt.prodId}"><img src="${orderDt.prod.prodImage}" alt="상품이미지" style="width:60px; height:60px"></a></td>
																						<td class="text-center align-middle" style="width:40%; white-space: normal;">${orderDt.prod.prodSleNm }</td>
																						<td class="text-center align-middle" style="width:10%;">${orderDt.prod.prodSlePcComma}원</td>
																						<td class="text-center align-middle" style="width:10%;"><span class="cdQy">${orderDt.orderProdQy }</span>개</td>
																						<td class="text-center align-middle" style="width:10%;"><span class="prodQyPrice">${orderDt.prod.prodSlePcComma}</span>원</td>
																						<td class="text-center align-middle" style="width:10%;">
																						    <div class="product-item" data-prod-id="${orderDt.prodId}" data-dlvy-sttus="${memOrder.delivery.dlvySttus}">
																								<!--  리뷰버튼정보 비동기로 받아오기 -->
																						        <div class="review-button"></div>
																								<%--  <p>${orderDt.prodId }</p> --%>
																						    </div>
																						</td>
																					</tr>
																				</c:forEach>
																			</tbody>
																		</table>

																		<div class="d-flex justify-content-end gap-2 btnList" id="delivery-Btn" data-refund-amount=${memOrder.payment.payAmount} data-mem-order=${memOrder.orderDtlsId }>
																			<c:choose>
																				<c:when test="${memOrder.delivery.dlvySttus eq '입금확인'}">
																					<button class="ms-btn-1 refundBtn">환불하기</button>
																				</c:when>
																				<c:when test="${memOrder.delivery.dlvySttus eq '배송중' or memOrder.delivery.dlvySttus eq '배송완료'}">
<!-- 																					<button class="ms-btn-1 delvSelBtn">배송조회</button> -->
																				</c:when>
																			</c:choose>
																		</div>
																</div>
															</div>
														</div>
													</div>
													</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
                   </div>
               </div>
           </div>
       </div>
		<!--Blog content End -->
    </section>


    <script src="${cPath }/resources/js/app/market/member/memOrderList.js"></script>
    <script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>
