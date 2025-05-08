<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">판매상품</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="${cPath }/market/marketpage.do">Home</a></li>
                                <li class="ms-breadcrumb-item active">판매상품</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<body>
    <!-- Shop section -->
    <section class="ms-shop padding-tb-30">
        <div class="container">
            <!-- Shop Banners Start -->
                <div class="ms-shop-rightside col-lg-12 order-lg-last col-md-12 order-md-first margin-b-30">
                    <!-- Shop Top Start -->
                    <div class="ms-pro-list-top d-flex">
                        <div class="col-md-6 ms-grid-list">
                            <div class="ms-gl-btn">
                                <button class="grid-btn btn-grid active">
                                    <img src="${cPath}/resources/Masterkart/masterkart-html/assets/img/icons/grid.svg" class="svg_img gl_svg" alt="">
                                </button>
                                <button class="grid-btn btn-list">
                                    <img src="${cPath}/resources/Masterkart/masterkart-html/assets/img/icons/list.svg" class="svg_img gl_svg" alt="">
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- Shop Top End -->
                    <!-- Shop content Start -->
                    <div class="shop-pro-content">
                        <div class="shop-pro-inner">
                            <div class="row">
                            <!-- 한단락 -->
                            <c:choose>
	                            <c:when test="${empty aiList }">
									검색한 상품이 없습니다.
	                            </c:when>
		                        <c:otherwise>
                            		<c:forEach items="${aiList }" var="sp" >
		                               <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6 pro-gl-content ms-product-content">
		                                    <div class="ms-product-inner">
		                                        <div class="ms-pro-image-outer">
		                                            <div class="ms-pro-image">
		                                                <a href="${cPath }/market/prodDetail/${sp.prodId}" class="image" style="pointer-events: auto;">
		                                                    <c:if test="${not empty sp.prod.prodImage}">
		                                                    <img class="main-image" src="${sp.prod.prodImage}" style="width: 400px; height: 300px;padding: 20px;"
		                                                        alt="Product">
		                                                    <img class="hover-image" src="${sp.prod.prodImage}" style="width: 400px; height: 300px;padding: 20px;"
		                                                        alt="Product">
		                                                    </c:if>
		                                                    <c:if test="${empty sp.prod.prodImage}">
		                                                    <img class="main-image" src="${cPath}/resources/Masterkart/masterkart-html/assets/img/product-images/2_1.jpg" style="width: 400px; height: 300px"
		                                                        alt="Product">
		                                                    <img class="hover-image" src="${cPath}/resources/Masterkart/masterkart-html/assets/img/product-images/2_2.jpg" style="width: 400px; height: 300px"
		                                                        alt="Product">
		                                                    </c:if>
		                                                </a>
		                                            </div>
		                                        </div>
		                                        <div class="ms-pro-content">
		                                        <a href="${cPath }/market/prodDetail/${sp.prodId}">
		                                            <h6 class="ms-pro-stitle" style="font-size:14px;">${sp.cmmnCodeNm}</h6>
		                                        </a>
		                                            <h5 class="ms-pro-title"><a href="${cPath }/market/prodDetail/${sp.prodId}" style="font-size:14px;">${sp.prod.prodSleNm }</a></h5>
		                                            <div class="ms-pro-rat-price">
		                                                <a href="${cPath }/market/prodDetail/${sp.prodId}">
			                                                <span class="ms-price">
			                                                    	<span class="new-price">${sp.prod.prodSlePcComma}원</span>
			                                                </span>
		                                                </a>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </c:forEach>
		                        </c:otherwise>
	                         </c:choose>
                                <!-- 한단락 -->
                        <!-- Pagination Start -->
                        <div data-target-form="#searchform" class="ms-pro-pagination paging-area">
                            <ul class="ms-pro-pagination-inner">
                            <c:choose>
	                            <c:when test="${empty aiList }">

	                            </c:when>
	                            <c:otherwise>
									${pagingHTML }
	                            </c:otherwise>
                            </c:choose>

                            </ul>
                        </div>
                        <!-- Pagination End -->
                    </div>
                	</div>
				</div>
                    <!--Shop content End -->
			</div>
		</div>
	</section>


    <!-- Add to Cart Notify -->
    <div class="ms-cart-notify">
        <a href="javascript:void(0)" class="ms-cart-toggle"><img src="${cPath}/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img"
                alt="cart"><span>3</span></a>
    </div>

    <!-- Add to Wishlist Notify  -->
    <div class="ms-wish-notify"></div>

    <!-- Add to Compare list Notify  -->
    <div class="ms-compare-notify"></div>

    <!-- Back to top  -->
    <a class="ms-back-to-top"></a>

    <!-- Main Js -->
    <script src="${cPath}/resources/Masterkart/masterkart-html/assets/js/main.js"></script>
    <script src="${cPath}/resources/Masterkart/masterkart-html/assets/js/paging.js"></script>

