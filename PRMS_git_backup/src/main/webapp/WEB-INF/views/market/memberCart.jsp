<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <!-- Breadcrumb start -->
    <div class="ms-breadcrumb">
        <div class="container">
            <div class="row" id="prod-detail-align">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">장바구니</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="index.html">홈</a></li>
                                <li class="ms-breadcrumb-item"><a href="index.html">마이페이지</a></li>
                                <li class="ms-breadcrumb-item active">장바구니</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->

<section class="ms-shop padding-tb-30">
	<div class="container">
		<!-- Shop Banners Start -->
		<div
			class="ms-shop-rightside col-lg-12 order-lg-last col-md-12 order-md-first margin-b-30">
			<!-- Shop Top Start -->

			<!-- Shop Top End -->
			<!-- Shop content Start -->
			<div class="shop-pro-content">
				<div class="shop-pro-inner list-view">
					<div class="row">
					<c:set var="cartList" value="${cartList }" scope="session" />
					<c:set var="cartCount" value="${cartCount }" scope="session" />
						<!-- 한단락 -->
						<c:choose>
							<c:when test="${empty cartList }">
								<div>
									<a>장바구니에 담은 상품이 없습니다</a>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${cartList }" var="cart">
									<div
										class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6 pro-gl-content ms-product-content width-100">
										<div class="ms-product-inner" style="justify-content: space-between;">
											<div class="d-flex">
											<div class="ms-pro-image-outer">
												<div class="ms-pro-image">
													<a href="/prms/market/prodDetail/${cart.prodId }" class="image">
														<span class="label veg"> <span class="dot"></span>
													</span> <img class="main-image" src="${cart.prod.prodImage }"
														style="width: 150px;pointer-events: auto; height: 165px" alt="Product"> <img
														class="hover-image" src="${cart.prod.prodImage }"
														style="width: 150px; height: 165px;pointer-events: auto;" alt="Product">

													</a>
												</div>
											</div>
											<div class="ms-pro-content">
												<div class="ms-pro-title">
													<a href="/prms/market/prodDetail/${cart.prodId }" class="fs-5">${cart.prod.prodSleNm}</a>
												</div>
												<div class="ms-pro-rat-price mt-3">
													<fmt:formatNumber value="${cart.prod.prodSlePc * cart.cdQy }" pattern="#,###" var="cartProdPc"/>
													<span class="ms-price"> <span class="new-price fs-5">${cartProdPc }원</span>
													</span>
													<c:set var="total" value="${total + cart.prod.prodSlePc * cart.cdQy}" />
												</div>
												<div class="num">
													<span class="fs-6 ms-3">수량</span>
													<input type="hidden" class="slePc" value="${cart.prod.prodSlePc }" />
													<input type="hidden" class="memNo" value="${cart.memNo }" />
													<input type="hidden" class="prodId" value="${cart.prodId }" />
													<input type="hidden" class="admininvQy" value="${cart.adminInv.admininvQy }" />
													<div class="count ms-3">
														<a class="btn btn-secondary btn-sm minus">-</a>
														<input class=" text-center qty-input" style="width:50px; height: 30px;" type="text" id="qty" value="${cart.cdQy }" readonly="readonly" />
														<a class="btn btn-secondary btn-sm plus">+</a>
													</div>
												</div>
											</div>
											</div>
											<div>
											<a class="remove px-2" style="display: block; height: 30px; color: red; font-size: 22px; text-align: right; ">×</a>
											</div>
										</div>
									</div>
								</c:forEach>
										<div>
											<input type="hidden" class="totalPrice" value="${total }" />
											<fmt:formatNumber value="${total }" pattern="#,###" var="totalComma"/>
											<span class="fs-4">총가격 : </span> <span class="total-price fs-4">${totalComma}원</span>
											<a href="${cPath }/market/member/multiplePurchasing" class="btn ms-btn-2" style="float:right;">결제하기</a>
										</div>
							</c:otherwise>
						</c:choose>



						<!-- 한단락 -->
						<!-- Pagination Start -->

						<!-- Pagination End -->
					</div>
				</div>
			</div>
			<!--Shop content End -->
		</div>
	</div>
</section>

<script src="${cPath }/resources/js/app/market/cart/memberCart.js"></script>