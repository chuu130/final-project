<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

	<!-- Breadcrumb start -->
    <div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">주문서</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="ms-breadcrumb-item active">결제완료</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->

	 <!-- Checkout section -->
    <section class="ms-checkout-section padding-tb-30">
        <h2 class="d-none">Checkout Page</h2>
        <div class="container">
            <div class="row">
                <div class="ms-checkout-leftside col-lg-10 col-md-12 mx-auto">
                    <!-- checkout content Start -->
                    <div class="ms-checkout-content">
                        <div class="ms-checkout-inner">

                            <div class="ms-checkout-wrap m-b-30">
                                <div class="ms-checkout-block ms-check-new d-flex justify-content-center">
                                    <h1 class="ms-checkout-title">주문완료</h1>
                                </div>
                                <hr>
                                <div class="ms-checkout-wrap">
	                                <h4 class="d-flex justify-content-center"><span class="fw-bold">주문번호 : </span><span class="text-success fw-bold ms-2">${memOrder.orderDtlsId }</span></h4>
                                </div>
	                            <hr>
	                            <div class="ms-checkout-block ms-check-login">
                                    <h3 class="ms-checkout-title">상품정보</h3><br>
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
										<tbody>
											<c:forEach items="${memOrder.orderDtList }" var="orderDtList">
												<tr>
													<td class="text-center align-middle"><img src="${orderDtList.prod.prodImage }" alt="상품이미지" style="width:100px; heigth:100px"></td>
													<td class="align-middle">${orderDtList.prod.prodSleNm }</td>
													<td class="text-center align-middle">${orderDtList.prod.prodSlePcComma }원</td>
													<td class="text-center align-middle"><span class="cdQy">${orderDtList.orderProdQy }</span>개</td>
													<td class="text-center align-middle"><span class="prodQyPrice">${orderDtList.prod.prodSlePcComma }</span>원</td>
												</tr>
											</c:forEach>
										</tbody>
                                    </table>
                                </div>

                                <div class="ms-checkout-block ms-check-login">
                                    <h3 class="ms-checkout-title">결제정보</h3><br>
                                    <div class="ms-check-login-form">
                                    	<div class="d-flex justify-content-between"><span class="h5">주문금액</span><span class="h5">${memOrder.orderDtList[0].orderProdAmountComma }원</span></div> <br>
                                    	<div class="d-flex justify-content-between"><span class="h5">마일리지할인</span><span class="h5 text-danger">${memOrder.payment.payMileageTotalDiscountComma }원</span></div> <br>
                                    	<div class="d-flex justify-content-between"><span class="h5">쿠폰할인</span><span class="h5 text-danger">${memOrder.payment.payCouponDiscount eq 0 ? 0 : memOrder.payment.payCouponDiscountComma}원</span></div>
										<hr>
										<div class="d-flex justify-content-between"><span class="h5">최종결제금액</span><span class="h5">${memOrder.payment.payAmountComma }원</span></div>
                                    </div>
                                </div>
                                <hr>
                                <div class="ms-checkout-block ms-check-login">
                                	<h3 class="ms-checkout-title">배송지</h3>
                                    <div class="ms-bl-block-content">
                                    	<table>
                                   			<tr>
                                   				<th class="h5">우편번호</th>
												<td class="h5 ps-5">${memOrder.delivery.dlvyZip }</td>
                                   			</tr>
											<tr>
                                   				<th class="h5">주소</th>
												<td class="h5 ps-5">${memOrder.delivery.dlvyAdres1 }  ${memOrder.delivery.dlvyAdres2 }</td>
											</tr>
                                    	</table>
                                    </div>
                                    <hr>
                                    <div class="ms-bl-block-content">
                                    	<span class="ms-check-order-btn">
			                                <a class="ms-btn-2" href="${cPath }/market/marketpage.do">메인페이지로이동</a>
			                            </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>
			<!--cart content End -->

			<script src="${cPath }/resources/js/app/market/payment/marketMultiplePurchasingSuccess.js"></script>

