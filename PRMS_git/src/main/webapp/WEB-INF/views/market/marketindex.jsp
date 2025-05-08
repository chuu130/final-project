<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--=========================================================
Item Name: Masterkart - Multipurpose eCommerce HTML Template.
Author: ashishmaraviya
Version: 1
Copyright 2024
============================================================-->
<c:set value="${wishList }" scope="session" var="wishList"></c:set>
<body class="hero-anime">
	<!-- Hero Slider Start -->
    <section class="section ms-hero m-t-30">
        <div class="container">
            <div class="ms-main-content">
                <!-- Hero Slider Start -->
                <div class="ms-slider-content">
                    <div class="ms-main-slider">
                        <div class="ms-slider swiper-container main-slider-nav main-slider-dot">
                            <!-- Main slider -->
                            <div class="swiper-wrapper">
                                <div class="ms-slide-item swiper-slide d-flex slide-1">
                                	<div class="image-container position-relative h-100">
                                	<img src="${cPath }/resources/images/강아지사료.jpg" style="width:856px; height:450px;" alt="Dog Image">
<!-- 	                                    <div class="ms-slide-content slider-animation text-overlay position-absolute top-50 start-50 translate-middle"> -->
<!-- 	                                        <h1 class="ms-slide-title">반려동물 하우스</h1> -->
<!-- 	                                        <h2 class="ms-slide-stitle">세상에서 가장 편안한 잠자리, 우리 아이만을 위한 특별한 공간.</h2> -->
<!-- 	                                    </div> -->
                                    </div>
                                </div>
                                <div class="ms-slide-item swiper-slide d-flex slide-2">
                                	<div class="image-container position-relative">
	                                	<a href="/prms/market/event/eventList">
	                                		<img src="${cPath }/resources/images/행사.jpg" style="width:856px; height:450px;" alt="Dog Image" class="img-fluid">
										</a>
                                    </div>
                                </div>
                                <div class="ms-slide-item swiper-slide d-flex slide-3">
                                	<div class="image-container position-relative">
	                                	<a href="/prms/market/event/eventList">
	                                		<img src="${cPath }/resources/images/유모차2.png" style="width:856px; height:450px;" alt="Dog Image" class="img-fluid">
										</a>
                                    </div>
                                </div>
                                <div class="ms-slide-item swiper-slide d-flex slide-4">
                                	<div class="image-container position-relative">
                                		 <a href="/prms/market/event/eventList">
                                			<img src="${cPath }/resources/images/유모차3.png" style="width:856px; height:450px;" alt="Dog Image" class="img-fluid">
                                		</a>
                                    </div>
                                </div>
                                <div class="ms-slide-item swiper-slide d-flex slide-5">
                                	<div class="image-container position-relative">
                                		 <a href="/prms/market/event/eventList">
                                			<img src="${cPath }/resources/images/고양이.jpg" style="width:856px; height:450px;" alt="Dog Image" class="img-fluid">
                                		</a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-pagination swiper-pagination-white"></div>
                            <div class="swiper-buttons">
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Hero Banner 1 Start -->
                <div class="ms-banner-content align-self-center">
                   	<div class="image-container position-relative">
                      		<img src="${cPath }/resources/Masterkart/landing-assets/img/petBanner.png" style="width:415.98px; height:213px;">
<!--                       		<div class="position-absolute top-50 start-50 translate-middle"> -->
<!--                            		<p>프리미엄 사료</p> -->
<!--                            		<h6 class="grid-animation"><span class="ms-grid-sub-title">잘먹잘싸!</span></h6> -->
<!--                            		<a href="#" class="ms-btn-2">구매하기<i class="msicon msi-angle-double-right" -->
<!--                                    aria-hidden="true"></i></a> -->
<!-- 							</div> -->
                    </div>
                </div>
                <!-- Hero Banner 2 Start -->
                <div class="ms-banner-content align-self-center">
                  <a href="/prms/market/event/eventList">
                  	<img src="${cPath }/resources/images/bannerimage.png" style="width:415.98px; height: 213px;" alt="Imagebanner1">
                  </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Slider End -->

    <!-- Category section -->
    <section class="ms-category body-bg p-b-30">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 border-content-color">
                    <div class="ms-category-block owl-carousel">
                        <div class="ms-cat-box ms-cat-box-1">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
<!--                                 <span class="ms-lbl">30%</span> -->
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-food_8876517.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">사료/간식</h4>
                                <p class="items">320 Items</p>
                            </a>
                        </div>
                        <div class="ms-cat-box ms-cat-box-2">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-harness2.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">목줄/하네스</h4>
                                <p class="items">65 Items</p>
                            </a>
                        </div>
                        <div class="ms-cat-box ms-cat-box-3">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
<!--                                 <span class="ms-lbl">15%</span> -->
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-clothes3.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">의류</h4>
                                <p class="items">548 Items</p>
                            </a>
                        </div>
                        <div class="ms-cat-box ms-cat-box-4">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
<!--                                 <span class="ms-lbl">10%</span> -->
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-shampoo.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">샴푸</h4>
                                <p class="items">48 Items</p>
                            </a>
                        </div>
                        <div class="ms-cat-box ms-cat-box-5">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-cage.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">캐리어 & 케이지</h4>
                                <p class="items">59 Items</p>
                            </a>
                        </div>
                        <div class="ms-cat-box ms-cat-box-6">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-toy.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">장난감 </h4>
                                <p class="items">845 Items</p>
                            </a>
                        </div>
                        <div class="ms-cat-box ms-cat-box-7">
                            <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon">
                                <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pet-pad.png" class="svg_img" alt="icon">
                                <h4 class="ms-cat-title">배변패드</h4>
                                <p class="items">652 Items</p>
                            </a>
                        </div>
<!--                         <div class="ms-cat-box ms-cat-box-8"> -->
<!--                             <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon"> -->
<!--                                 <span class="ms-lbl">20%</span> -->
<%--                                 <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/cat-8.svg" class="svg_img" alt="icon"> --%>
<!--                                 <h4 class="ms-cat-title">Fast Food</h4> -->
<!--                                 <p class="items">253 Items</p> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="ms-cat-box ms-cat-box-9"> -->
<!--                             <a href="shop-left-sidebar-col-3.html" class="ms-cat-icon"> -->
<%--                                 <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/cat-9.svg" class="svg_img" alt="icon"> --%>
<!--                                 <h4 class="ms-cat-title">Eggs</h4> -->
<!--                                 <p class="items">154 Items</p> -->
<!--                             </a> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Category section End -->


    <!--  Day Of The Deal Start -->
    <section class="ms-deal-section padding-tb-30">
        <div class="container">
            <div class="row overflow-hidden">
                <div class="ms-deal-section col-lg-12">
                    <div class="section-bg-color section-space-p30 main-border-radius">
                        <div class="section-title">
                            <h2 class="ms-title">새로 들어온 <span>상품</span></h2>
                            <div id="dealend" class="dealend-timer"></div>
                        </div>
                        <div class="ms-deal-block m-minus-12">
                            <div class="deal-owl-carousel owl-carousel">

								<c:forEach items="${latestProdList}" var= "prod">
	                                <div class="ms-product-content">
	                                    <div class="ms-product-inner">
	                                        <div class="ms-pro-image-outer">
	                                            <div class="ms-pro-image">
	                                                <a href="product-left-sidebar.html" class="image">
<!-- 	                                                    <span class="label veg"> -->
<!-- 	                                                        <span class="dot"></span> -->
<!-- 	                                                    </span> -->
	                                                    <img class="main-image" src="${prod.prodImage }"
	                                                        alt="Product">
	                                                </a>
	                                                <span class="flags">
	                                                    <span class="new">New</span>
	                                                </span>
<!-- 	                                                <div class="ms-pro-actions"> -->
<!-- 	                                                    <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%-- 	                                                        title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!-- 	                                                            class="svg_img pro_svg" alt=""></a> -->
<!-- 	                                                    <a href="#" class="ms-btn-group quickview" -->
<!-- 	                                                        data-link-action="quickview" title="Quick view" -->
<!-- 	                                                        data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%-- 	                                                            src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!-- 	                                                            alt=""></a> -->
<!-- 	                                                    <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%-- 	                                                        title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!-- 	                                                            class="svg_img pro_svg" alt=""></a> -->
<!-- 	                                                    <a href="javascript:void(0)" title="Add To Cart" -->
<!-- 	                                                        class="ms-btn-group add-to-cart"><img -->
<%-- 	                                                            src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!-- 	                                                            alt=""></a> -->
<!-- 	                                                </div> -->
	                                            </div>
	                                        </div>
	                                        <div class="ms-pro-content">
	                                            <a href="shop-left-sidebar-col-3.html">
	                                                <h6 class="ms-pro-stitle">Primium</h6>
	                                            </a>
	                                            <h5 class="ms-pro-title"><a href="product-left-sidebar.html">${prod.prodSleNm}</a></h5>
	                                            <div class="ms-pro-rat-price">
	                                                <span class="ms-pro-rating">
	                                                		<b>⭐신규상품⭐</b>
<!-- 	                                                    <i class="msicon msi-star fill"></i> -->
<!-- 	                                                    <i class="msicon msi-star fill"></i> -->
<!-- 	                                                    <i class="msicon msi-star"></i> -->
<!-- 	                                                    <i class="msicon msi-star"></i> -->
<!-- 	                                                    <i class="msicon msi-star"></i> -->
	                                                </span>
	                                                <span class="ms-price">
	                                                    <span class="new-price">${prod.prodSlePcComma }원</span>
	                                                </span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </c:forEach>
<!--                                 <div class="ms-product-content"> -->
<!--                                     <div class="ms-product-inner"> -->
<!--                                         <div class="ms-pro-image-outer"> -->
<!--                                             <div class="ms-pro-image"> -->
<!--                                                 <a href="product-left-sidebar.html" class="image"> -->
<!--                                                     <span class="label veg"> -->
<!--                                                         <span class="dot"></span> -->
<!--                                                     </span> -->
<%--                                                     <img class="main-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/13_1.jpg" --%>
<!--                                                         alt="Product"> -->
<%--                                                     <img class="hover-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/13_1.jpg" --%>
<!--                                                         alt="Product"> -->
<!--                                                 </a> -->
<!--                                                 <span class="flags"> -->
<!--                                                     <span class="sale">Sale</span> -->
<!--                                                 </span> -->
<!--                                                 <div class="ms-pro-actions"> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%--                                                         title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="#" class="ms-btn-group quickview" -->
<!--                                                         data-link-action="quickview" title="Quick view" -->
<!--                                                         data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%--                                                         title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" title="Add To Cart" -->
<!--                                                         class="ms-btn-group add-to-cart"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="ms-pro-content"> -->
<!--                                             <a href="shop-left-sidebar-col-3.html"> -->
<!--                                                 <h6 class="ms-pro-stitle">Tuber root</h6> -->
<!--                                             </a> -->
<!--                                             <h5 class="ms-pro-title"><a href="product-left-sidebar.html">Onion - -->
<!--                                                     Hybrid</a></h5> -->
<!--                                             <div class="ms-pro-rat-price"> -->
<!--                                                 <span class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <span class="qty">10 kg</span> -->
<!--                                                 </span> -->
<!--                                                 <span class="ms-price"> -->
<!--                                                     <span class="new-price">$25.00</span> -->
<!--                                                     <span class="old-price">$30.00</span> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="ms-product-content"> -->
<!--                                     <div class="ms-product-inner"> -->
<!--                                         <div class="ms-pro-image-outer"> -->
<!--                                             <div class="ms-pro-image"> -->
<!--                                                 <a href="product-left-sidebar.html" class="image"> -->
<!--                                                     <span class="label veg"> -->
<!--                                                         <span class="dot"></span> -->
<!--                                                     </span> -->
<%--                                                     <img class="main-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/25_1.jpg" --%>
<!--                                                         alt="Product"> -->
<%--                                                     <img class="hover-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/25_1.jpg" --%>
<!--                                                         alt="Product"> -->
<!--                                                 </a> -->
<!--                                                 <span class="flags"> -->
<!--                                                     <span class="new">New</span> -->
<!--                                                 </span> -->
<!--                                                 <div class="ms-pro-actions"> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%--                                                         title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="#" class="ms-btn-group quickview" -->
<!--                                                         data-link-action="quickview" title="Quick view" -->
<!--                                                         data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%--                                                         title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" title="Add To Cart" -->
<!--                                                         class="ms-btn-group add-to-cart"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="ms-pro-content"> -->
<!--                                             <a href="shop-left-sidebar-col-3.html"> -->
<!--                                                 <h6 class="ms-pro-stitle">Fresh fruit</h6> -->
<!--                                             </a> -->
<!--                                             <h5 class="ms-pro-title"><a href="product-left-sidebar.html">Lichi</a></h5> -->
<!--                                             <div class="ms-pro-rat-price"> -->
<!--                                                 <span class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <span class="qty">500 g</span> -->
<!--                                                 </span> -->
<!--                                                 <span class="ms-price"> -->
<!--                                                     <span class="new-price">$25.00</span> -->
<!--                                                     <span class="old-price">$35.00</span> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="ms-product-content"> -->
<!--                                     <div class="ms-product-inner"> -->
<!--                                         <div class="ms-pro-image-outer"> -->
<!--                                             <div class="ms-pro-image"> -->
<!--                                                 <a href="product-left-sidebar.html" class="image"> -->
<!--                                                     <span class="label veg"> -->
<!--                                                         <span class="dot"></span> -->
<!--                                                     </span> -->
<%--                                                     <img class="main-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/2_1.jpg" --%>
<!--                                                         alt="Product"> -->
<%--                                                     <img class="hover-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/2_2.jpg" --%>
<!--                                                         alt="Product"> -->
<!--                                                 </a> -->
<!--                                                 <span class="flags"> -->
<!--                                                     <span class="sale">Sale</span> -->
<!--                                                 </span> -->
<!--                                                 <div class="ms-pro-actions"> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%--                                                         title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="#" class="ms-btn-group quickview" -->
<!--                                                         data-link-action="quickview" title="Quick view" -->
<!--                                                         data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%--                                                         title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" title="Add To Cart" -->
<!--                                                         class="ms-btn-group add-to-cart"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="ms-pro-content"> -->
<!--                                             <a href="shop-left-sidebar-col-3.html"> -->
<!--                                                 <h6 class="ms-pro-stitle">Dried Fruits</h6> -->
<!--                                             </a> -->
<!--                                             <h5 class="ms-pro-title"><a href="product-left-sidebar.html">Dates Value -->
<!--                                                     Pouch</a></h5> -->
<!--                                             <div class="ms-pro-rat-price"> -->
<!--                                                 <span class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                 </span> -->
<!--                                                 <span class="ms-price"> -->
<!--                                                     <span class="new-price">$78.00</span> -->
<!--                                                     <span class="old-price">$85.00</span> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="ms-product-content"> -->
<!--                                     <div class="ms-product-inner"> -->
<!--                                         <div class="ms-pro-image-outer"> -->
<!--                                             <div class="ms-pro-image"> -->
<!--                                                 <a href="product-left-sidebar.html" class="image"> -->
<!--                                                     <span class="label nonveg"> -->
<!--                                                         <span class="dot"></span> -->
<!--                                                     </span> -->
<%--                                                     <img class="main-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/19_1.jpg" --%>
<!--                                                         alt="Product"> -->
<%--                                                     <img class="hover-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/19_1.jpg" --%>
<!--                                                         alt="Product"> -->
<!--                                                 </a> -->
<!--                                                 <div class="ms-pro-actions"> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%--                                                         title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="#" class="ms-btn-group quickview" -->
<!--                                                         data-link-action="quickview" title="Quick view" -->
<!--                                                         data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%--                                                         title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" title="Add To Cart" -->
<!--                                                         class="ms-btn-group add-to-cart"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="ms-pro-content"> -->
<!--                                             <a href="shop-left-sidebar-col-3.html"> -->
<!--                                                 <h6 class="ms-pro-stitle">Eggs</h6> -->
<!--                                             </a> -->
<!--                                             <h5 class="ms-pro-title"><a href="product-left-sidebar.html">Farm Eggs - -->
<!--                                                     Brown</a></h5> -->
<!--                                             <div class="ms-pro-rat-price"> -->
<!--                                                 <span class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <span class="qty">3 pcs</span> -->
<!--                                                 </span> -->
<!--                                                 <span class="ms-price"> -->
<!--                                                     <span class="new-price">$3.00</span> -->
<!--                                                     <span class="old-price">$5.00</span> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="ms-product-content"> -->
<!--                                     <div class="ms-product-inner"> -->
<!--                                         <div class="ms-pro-image-outer"> -->
<!--                                             <div class="ms-pro-image"> -->
<!--                                                 <a href="product-left-sidebar.html" class="image"> -->
<!--                                                     <span class="label veg"> -->
<!--                                                         <span class="dot"></span> -->
<!--                                                     </span> -->
<%--                                                     <img class="main-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/24_1.jpg" --%>
<!--                                                         alt="Product"> -->
<%--                                                     <img class="hover-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/24_1.jpg" --%>
<!--                                                         alt="Product"> -->
<!--                                                 </a> -->
<!--                                                 <span class="flags"> -->
<!--                                                     <span class="new">New</span> -->
<!--                                                 </span> -->
<!--                                                 <div class="ms-pro-actions"> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%--                                                         title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="#" class="ms-btn-group quickview" -->
<!--                                                         data-link-action="quickview" title="Quick view" -->
<!--                                                         data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%--                                                         title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" title="Add To Cart" -->
<!--                                                         class="ms-btn-group add-to-cart"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="ms-pro-content"> -->
<!--                                             <a href="shop-left-sidebar-col-3.html"> -->
<!--                                                 <h6 class="ms-pro-stitle">Fresh Fruit</h6> -->
<!--                                             </a> -->
<!--                                             <h5 class="ms-pro-title"><a href="product-left-sidebar.html">Cherry</a></h5> -->
<!--                                             <div class="ms-pro-rat-price"> -->
<!--                                                 <span class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <span class="qty">1 kg</span> -->
<!--                                                 </span> -->
<!--                                                 <span class="ms-price"> -->
<!--                                                     <span class="new-price">$20.00</span> -->
<!--                                                     <span class="old-price">$21.00</span> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="ms-product-content"> -->
<!--                                     <div class="ms-product-inner"> -->
<!--                                         <div class="ms-pro-image-outer"> -->
<!--                                             <div class="ms-pro-image"> -->
<!--                                                 <a href="product-left-sidebar.html" class="image"> -->
<!--                                                     <span class="label veg"> -->
<!--                                                         <span class="dot"></span> -->
<!--                                                     </span> -->
<%--                                                     <img class="main-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/17_1.jpg" --%>
<!--                                                         alt="Product"> -->
<%--                                                     <img class="hover-image" src="${cPath }/resources/Masterkart/masterkart-html/assets/img/product-images/17_1.jpg" --%>
<!--                                                         alt="Product"> -->
<!--                                                 </a> -->
<!--                                                 <div class="ms-pro-actions"> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group wishlist" -->
<%--                                                         title="Wishlist"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_wishlist.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="#" class="ms-btn-group quickview" -->
<!--                                                         data-link-action="quickview" title="Quick view" -->
<!--                                                         data-bs-toggle="modal" data-bs-target="#ms_quickview_modal"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/quickview.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" class="ms-btn-group compare" -->
<%--                                                         title="Compare"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/compare.svg" --%>
<!--                                                             class="svg_img pro_svg" alt=""></a> -->
<!--                                                     <a href="javascript:void(0)" title="Add To Cart" -->
<!--                                                         class="ms-btn-group add-to-cart"><img -->
<%--                                                             src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img pro_svg" --%>
<!--                                                             alt=""></a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="ms-pro-content"> -->
<!--                                             <a href="shop-left-sidebar-col-3.html"> -->
<!--                                                 <h6 class="ms-pro-stitle">Tuber root</h6> -->
<!--                                             </a> -->
<!--                                             <h5 class="ms-pro-title"><a href="product-left-sidebar.html">Ginger - -->
<!--                                                     Organic</a></h5> -->
<!--                                             <div class="ms-pro-rat-price"> -->
<!--                                                 <span class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                     <span class="qty">100 g</span> -->
<!--                                                 </span> -->
<!--                                                 <span class="ms-price"> -->
<!--                                                     <span class="new-price">$2.00</span> -->
<!--                                                     <span class="old-price">$3.00</span> -->
<!--                                                 </span> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--  Day Of The Deal Start End -->


    <!-- Add to Cart Notify -->
    <div class="ms-cart-notify">
        <a href="javascript:void(0)" class="ms-cart-toggle"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/pro_cart.svg" class="svg_img"
                alt="cart"><span>3</span></a>
    </div>

    <!-- Add to Wishlist Notify  -->
    <div class="ms-wish-notify"></div>

    <!-- Add to Compare list Notify  -->
    <div class="ms-compare-notify"></div>

    <!-- Back to top  -->
    <a class="ms-back-to-top"></a>

    <!-- Add to Compare list Notify  -->
    <div class="ms-compare-notify"></div>

