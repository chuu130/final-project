<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

	<!-- Header Bottom  Start -->
	<div class="ms-header-bottom d-none d-lg-block">
		<div class="container position-relative">
			<div class="row">
				<div class="ms-flex">
					<!-- Header Logo Start -->
					<div class="align-self-center ms-header-logo">
						<div class="header-logo">
							<a href="${cPath }/market/marketpage.do"><img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/logo/marketlogo.png"
								alt="Site Logo"></a>
						</div>
					</div>
					<!-- Header Logo End -->

					<!-- Header Search Start -->
					<div class="align-self-center ms-header-search">
						<div class="header-search search-ui" data-target-form="#searchform">
							<form class="ms-search-group-form" onsubmit="return false;">
								<input class="form-control ms-search-bar" placeholder="검색어를 입력하세요" type="text" name="searchWord"
									onchange="this.form.querySelector('.search-btn').click();"
								/>
								<input type="hidden" name="searchType" value="search">
								<button type="submit" class="invisible"></button>
								<button class="search_submit search-btn" type="button">
									<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/search.svg" class="svg_img search_svg" alt="">
								</button>
							</form>
						</div>
							<c:if test="${not empty partprodSe }">
								<c:url var="action" value="/market/${partprodSe }/search.do"/>
							</c:if>
							<c:if test="${empty partprodSe }">
								<c:url var="action" value="/market/search.do"/>
							</c:if>
							<form id="searchform" method="get" action="${action }">
								<input type="hidden" id="searchType" name="searchType" value="${simpleCondition.searchType}"/>
								<input type="hidden" id="searchWord" name="searchWord" value="${simpleCondition.searchWord}"/>
								<input type="hidden" name="page" />
							</form>
					</div>
					<!-- Header Search End -->

					<!-- Header Button Start -->
					<div class="align-self-center">
						<div class="ms-header-bottons">
							<!-- Header User Start -->
							<div class="ms-acc-drop">
								<a href="javascript:void(0)"
									class="ms-header-btn ms-header-user dropdown-toggle ms-user-toggle"
									title="Account">
									<div class="header-icon">
										<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/user.svg"
											class="svg_img header_svg" alt="">
									</div>
									<div class="ms-btn-desc">
										<security:authorize access="hasAuthority('ROLE_USER')"> <!-- security의 조건문 -->
											<security:authentication property="principal" var="principal"/>
											<span class="ms-btn-title">${principal.username}</span>
											<span class="ms-btn-stitle">${principal.realUser.memNm}</span>
											<span class="ms-btn-stitle" style="display:none" id="memNo">${principal.realUser.memNo}</span>
										</security:authorize>
										<security:authorize access="!hasAuthority('ROLE_USER')"> <!-- security의 조건문 -->
											<span class="ms-btn-stitle">로그인</span>
										</security:authorize>
									</div>
								</a>
								<ul class="ms-dropdown-menu">
									<security:authorize access="hasAuthority('ROLE_USER')"> <!-- security의 조건문 -->
										<c:url value="/market/member/${principal.username}/mypage" var="memUrl" />
										<li style="padding: 10px;"><a class="dropdown-item" href="${memUrl }">마이페이지</a></li>
<!-- 										마이페이지가 없어서 일단 들어가야할 장바구니 버튼 -->
										<li style="padding: 10px;"><a class="dropdown-item" href="${cPath }/market/member/memberCart">장바구니</a></li>
										<li style="padding: 10px;"><a class="dropdown-item" href="${cPath }/market/logout">로그아웃</a></li>
									</security:authorize>
									<security:authorize access="!hasAuthority('ROLE_USER')"> <!-- security의 조건문 -->
										<li style="padding: 10px;"><a class="dropdown-item" href="${cPath }/market/join">회원가입</a></li>
										<li style="padding: 10px;"><a class="dropdown-item" href="${cPath }/market/login">로그인</a></li>
									</security:authorize>
								</ul>
							</div>
							<!-- Header User End -->
							<!-- Header wishlist Start -->
							<a href="javascript:void(0)" class="ms-header-btn ms-wish-toggle"
								title="Wishlist">
								<div class="header-icon">
									<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/wishlist.svg"
										class="svg_img header_svg" alt="">
								</div>
								<div class="ms-btn-desc">
									<span class="ms-btn-title">찜 목록</span> <span
										class="ms-btn-stitle"><b class="ms-wishlist-count">${wishCnt }</b>-items</span>
								</div>
							</a>
							<!-- Header wishlist End -->
							<!-- Header Cart Start -->
<!-- 							<a href="javascript:void(0)" class="ms-header-btn ms-cart-toggle" -->
<!-- 								title="Cart"> -->
							<a href="${cPath }/market/member/memberCart" class="ms-header-btn ">
								<div class="header-icon">
									<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/cart_5.svg"
										class="svg_img header_svg" alt="">
<!-- 										<span class="main-label-note-new"></span> -->
								</div>
								<div class="ms-btn-desc">
									<span class="ms-btn-title">장바구니</span> <span
										class="ms-btn-stitle"><b class="ms-cart-count">${cartCount }</b>-items</span>
								</div>
							</a>
<!-- 							</a> -->
							
							<!-- Header Cart End -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header Button End -->

	<!-- Header menu -->
	<div class="ms-header-cat d-none d-lg-block">
		<div class="container position-relative">
			<div class="row justify-content-between">

<!-- 				Category Toggle -->
<!-- 				<div class="col ms-category-icon-block"> -->
<!-- 					<div class="ms-category-menu"> -->
<!-- 						<div class="ms-category-toggle"> -->
<%-- 							<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/category-icon.svg" --%>
<!-- 								class="svg_img header_svg svg_cat" alt="icon"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


				<!-- Main Menu Start -->
				<div id="ms-main-menu-desk" class="d-none d-lg-block sticky-nav">
					<div class="position-relative nav-desk">
						<div class="row">
							<div class="col-md-12 align-self-center">
								<div class="ms-main-menu">
									<ul style="margin-left: 100px;">
										<li class="dropdown drop-list position-static"><a
											href="javascript:void(0)" class="dropdown-arrow">상품<i class="msicon msi-angle-right"></i></a>
											<ul class="mega-menu d-block">
												<li class="d-flex"><span class="bg"></span>
													<c:forEach items="${menuList }" var="m">
														<ul class="d-block">
														<li class="menu_title"><a href="javascript:void(0)">${m.CMMN_CODE_NM}</a></li>
														<c:forEach items="${m.children }" var="mc">
														<li><a href="${cPath }/market/${mc.CMMN_CODE_ID }/">${mc.CMMN_CODE_NM}</a></li>
														</c:forEach>
														</ul>
													</c:forEach>
												</li>
											</ul></li>
										<li class="non-drop"><a href="${cPath }/market/beauty">애견미용예약</a></li>
										<li class="non-drop"><a href="${cPath }/market/hotel">애견호텔예약</a></li>
										<li class="dropdown drop-list"><a
											href="javascript:void(0)" class="dropdown-arrow">고객센터<i
												class="msicon msi-angle-right"></i></a>
											<ul class="sub-menu">
												<li><a href="${cPath }/market/member/noticeList">공지사항</a></li>
												<li><a href="${cPath }/market/member/centerMarketList">Q&A</a></li>
											</ul>
										</li>
										<li class="non-drop"><a href="${cPath }/"><img
												src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/track-3.svg" class="svg_img"
												alt="discover">펫코노미</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Main Menu End -->

<!-- 				<div class="col ms-location-block"> -->
<!-- 					<div class="ms-location-menu"> -->
<!-- 						<div class="ms-location-toggle"> -->
<%-- 							<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 								class="svg_img header_svg svg_loc" alt="icon"> <span -->
<!-- 								class="ms-location-title d-1199 ms-location" id="ms_location"></span> -->
<!-- 							<i class="msicon msi-angle-down d-1199" aria-hidden="true"></i> -->
<!-- 						</div> -->
<!-- 						<div class="ms-location-content"> -->
<!-- 							<div class="ms-location-dropdown"> -->
<!-- 								<div class="row ms-location-wrapper"> -->
<!-- 									<ul class="loc-grid"> -->
<!-- 										<li class="loc-list current"><img -->
<%-- 											src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 											class="svg_img header_svg svg_loc" alt="icon"><span -->
<!-- 											class="ms-detail-current">current Location</span></li> -->
<!-- 										<li class="loc-list"><img -->
<%-- 											src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 											class="svg_img header_svg svg_loc" alt="icon"><span -->
<!-- 											class="ms-detail">rajkot, in</span></li> -->
<!-- 										<li class="loc-list"><img -->
<%-- 											src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 											class="svg_img header_svg svg_loc" alt="icon"><span -->
<!-- 											class="ms-detail">Mountain View, us</span></li> -->
<!-- 										<li class="loc-list"><img -->
<%-- 											src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 											class="svg_img header_svg svg_loc" alt="icon"><span -->
<!-- 											class="ms-detail">Birmingham, UK</span></li> -->
<!-- 										<li class="loc-list"><img -->
<%-- 											src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 											class="svg_img header_svg svg_loc" alt="icon"><span -->
<!-- 											class="ms-detail">Jakarta, id</span></li> -->
<!-- 										<li class="loc-list"><img -->
<%-- 											src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/location.svg" --%>
<!-- 											class="svg_img header_svg svg_loc" alt="icon"><span -->
<!-- 											class="ms-detail">lima, pe</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</div>
		</div>
	</div>
	<!-- Header menu End -->


	<!-- Mobile Menu sidebar Start -->
	<div class="ms-mobile-menu-overlay"></div>
	<div id="ms-mobile-menu" class="ms-mobile-menu">
		<div class="ms-menu-title">
			<span class="menu_title">My Menu</span>
			<button class="ms-close-menu">×</button>
		</div>
		<div class="ms-menu-inner">
			<div class="ms-menu-content">
				<div class="ms-mobile-search">
					<form>
						<input type="text" name="search" placeholder="Search..">
						<button class="search_submit" type="submit">
							<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/search.svg" class="svg_img search_svg"
								alt="">
						</button>
					</form>
				</div>
				<ul>
					<li><a href="index.html">Home</a></li>

					<li><a href="javascript:void(0)">Categories</a>
						<ul class="sub-menu">
							<li><a href="javascript:void(0)">Classic Variation</a>
								<ul class="sub-menu">
									<li><a href="shop-left-sidebar-col-3.html">Left
											sidebar 3 column</a></li>
									<li><a href="shop-left-sidebar-col-4.html">Left
											sidebar 4 column</a></li>
									<li><a href="shop-right-sidebar-col-3.html">Right
											sidebar 3 column</a></li>
									<li><a href="shop-right-sidebar-col-4.html">Right
											sidebar 4 column</a></li>
									<li><a href="shop-full-width.html">Full width 4 column</a></li>
								</ul></li>
							<li><a href="javascript:void(0)">Classic Variation</a>
								<ul class="sub-menu">
									<li><a href="shop-banner-left-sidebar-col-3.html">Banner
											left sidebar 3 column</a></li>
									<li><a href="shop-banner-left-sidebar-col-4.html">Banner
											left sidebar 4 column</a></li>
									<li><a href="shop-banner-right-sidebar-col-3.html">Banner
											right sidebar 3 column</a></li>
									<li><a href="shop-banner-right-sidebar-col-4.html">Banner
											right sidebar 4 column</a></li>
									<li><a href="shop-banner-full-width.html">Banner Full
											width 4 column</a></li>
								</ul></li>
							<li><a href="javascript:void(0)">Columns Variation</a>
								<ul class="sub-menu">
									<li><a href="shop-full-width-col-3.html">3 Columns
											full width</a></li>
									<li><a href="shop-full-width-col-4.html">4 Columns
											full width</a></li>
									<li><a href="shop-full-width-col-5.html">5 Columns
											full width</a></li>
									<li><a href="shop-full-width-col-6.html">6 Columns
											full width</a></li>
									<li><a href="shop-banner-full-width-col-3.html">Banner
											3 Columns</a></li>
								</ul></li>
							<li><a href="javascript:void(0)">List Variation</a>
								<ul class="sub-menu">
									<li><a href="shop-list-left-sidebar.html">Shop left
											sidebar</a></li>
									<li><a href="shop-list-right-sidebar.html">Shop right
											sidebar</a></li>
									<li><a href="shop-list-banner-left-sidebar.html">Banner
											left sidebar</a></li>
									<li><a href="shop-list-banner-right-sidebar.html">Banner
											right sidebar</a></li>
									<li><a href="shop-list-full-col-2.html">Full width 2
											columns</a></li>
								</ul></li>
						</ul></li>
					<li><a href="javascript:void(0)">Products</a>
						<ul class="sub-menu">
							<li><a href="product-left-sidebar.html">Product left
									sidebar</a></li>
							<li><a href="product-right-sidebar.html">Product right
									sidebar</a></li>
							<li><a href="product-full-width.html">product-full-width</a></li>
						</ul></li>
					<li class="dropdown"><a href="javascript:void(0)">Blog</a>
						<ul class="sub-menu">
							<li><a href="blog-left-sidebar.html">Blog left sidebar</a></li>
							<li><a href="blog-right-sidebar.html">Blog right sidebar</a></li>
							<li><a href="blog-detail-left-sidebar.html">Blog detail
									left sidebar</a></li>
							<li><a href="blog-detail-right-sidebar.html">Blog detail
									right sidebar</a></li>
							<li><a href="blog-full-width.html">Blog full width</a></li>
							<li><a href="blog-detail-full-width.html">Blog detail
									full width</a></li>
						</ul></li>
					<li><a href="javascript:void(0)">Others</a>
						<ul class="sub-menu">
							<li><a href="about-us.html">About Us</a></li>
							<li><a href="contact-us.html">Contact Us</a></li>
							<li><a href="cart.html">Cart</a></li>
							<li><a href="checkout.html">Checkout</a></li>
							<li><a href="compare.html">Compare</a></li>
							<li><a href="faq.html">FAQ</a></li>
							<li><a href="login.html">Login</a></li>
							<li><a href="register.html">Register</a></li>
							<li><a href="track-order.html">Track Order</a></li>
							<li><a href="terms-condition.html">Terms Condition</a></li>
							<li><a href="privacy-policy.html">Privacy Policy</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="header-res-lan-curr">
				<!-- Social Start -->
				<div class="header-res-social">
					<div class="header-top-social">
						<ul class="mb-0">
							<li class="list-inline-item"><a href="#"><i
									class="msicon msi-facebook"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="msicon msi-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="msicon msi-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="msicon msi-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- Social End -->
			</div>
		</div>
	</div>
	<!-- Mobile Menu sidebar End -->

	<!-- Header responsive Bottom  Start -->
	<div class="ms-header-bottom d-lg-none">
		<div class="container position-relative">
			<div class="row ">
				<div class="ms-flex">
					<!-- Header Logo Start -->
					<div class="col ms-header-logo">
						<div class="header-logo">
							<a href="index.html"> <img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/logo/marketlogo.png"
								alt="Site Logo">
							</a>
						</div>
					</div>
					<!-- Header Logo End -->
					<!-- Header menu Start -->
					<a href="javascript:void(0)"
						class="ms-header-btn ms-site-menu-icon d-lg-none"> <img
						src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/menu.svg" class="svg_img" alt="menu">
					</a>
					<!-- Header menu End -->

				</div>
			</div>
		</div>
	</div>
	<!-- Header responsive Bottom  End -->