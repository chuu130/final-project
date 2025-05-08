<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="hidden" id="hash" value="${hash }" />
<!-- BEGIN #sidebar -->
	<!-- BEGIN scrollbar -->
	<div class="app-sidebar-content" data-scrollbar="true"
		data-height="100%">
		<!-- BEGIN menu -->
		<div class="menu">
			<div class="menu-profile">
				<a href="javascript:;" class="menu-profile-link"
					data-bs-toggle="dropdown">
					<div class="menu-profile-cover with-shadow"></div>
					<div class="menu-profile-image">
						<div class="menu-profile-img"
							style="background-image: url(${pageContext.request.contextPath}/resources/Franchise/template_html/dist/assets/img/user/user.jpg)"></div>
					</div>
					<div class="menu-profile-info">
					<div class="d-flex align-items-center">
						<security:authorize access="hasAuthority('FRANCHISEE')">
							<security:authentication property="principal" var="principal"/>
							<div class="flex-grow-1 fw-bold" id="franNm">${franNm}
							${pricapal.realUser.franchiseId }</div>
							<div class="ms-auto">
								<i class="fa fa-chevron-down"></i>
							</div>
						</security:authorize>
					</div>
				</div>
				</a>
				<div class="dropdown-menu dropdown-menu-end me-lg-3 mt-1 w-200px">
					<a class="dropdown-item d-flex align-items-center"
						href="profile.html"><i class="far fa-user fa-fw fa-lg me-3"></i>
						개인정보</a>
						<security:authentication property="principal" var="principal"/>
						 <a class="dropdown-item d-flex align-items-center"
						href="${cPath }/main/franchise/${principal.username}/francalendar" ><i
						class="far fa-calendar fa-fw fa-lg me-3"></i> 캘린더 </a>
						 <a class="dropdown-item d-flex align-items-center"
						href="settings.html"><i class="fa fa-sliders fa-fw fa-lg me-3"></i>
						설정</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item d-flex align-items-center"
						href="page_login.html"><i
						class="fa fa-arrow-right-from-bracket fa-fw fa-lg me-3"></i>
						로그아웃</a>
				</div>
			</div>
			<div class="menu-item" id="franchiseepage">
				<a href="${cPath }/main/franchisee/franchiseepage.do#franchiseepage" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-qrcode"></i></span> <span class="menu-text">대시보드</span>
				</a>
			</div>
			<div id="menu-header-font" class="menu-header">My Serivce</div>
			<div class="menu-item" id="franchisePos">
				<a href="${cPath }/franchise/franchisePos#franchisePos" onclick="window.open(this.href, 'POS', 'width=1700, height=1000'); return false;" class="menu-link">
					<span class="menu-icon"><i class="fa fa-cash-register"></i></span>
					<span class="menu-text">포스기 이용</span>
				</a>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i class="fa fa-receipt"></i>
				</span> <span class="menu-text">포스기 내역</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="franchisePosHistory">
						<a href="${cPath }/franchise/franchisePosHistory#franchisePosHistory" class="menu-link"> <span
							class="menu-text">포스기 결제내역</span>
						</a>
					</div>
				</div>
				<div class="menu-submenu">
					<div class="menu-item" id="franchisePosCancleHistory">
						<a href="${cPath }/franchise/franchisePosCancleHistory#franchisePosCancleHistory" class="menu-link"> <span
							class="menu-text">포스기 환불내역</span>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i class="fa fa-hotel"></i>
				</span> <span class="menu-text">호텔관리</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="hotelRes">
						<a href="${cPath }/main/franchisee/hotelRes#hotelRes" class="menu-link"> <span
							class="menu-text">호텔예약현황</span>
						</a>
					</div>
				</div>
				<div class="menu-submenu">
					<div class="menu-item" id="hotelroom">
						<a href="${cPath }/main/franchisee/hotelroom#hotelroom" class="menu-link"> <span
							class="menu-text">호텔방관리</span>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-scissors"></i></span> <span class="menu-text">미용예약관리</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="beautyRes">
						<a href="${cPath }/main/franchisee/beautyRes#beautyRes" class="menu-link"> <span
							class="menu-text">미용예약현황</span>
						</a>
					</div>
				</div>
			</div>

			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-chart-simple"></i></span> <span class="menu-text">매출관리</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="franSalesTerm">
						<a href="${cPath }/main/franchisee/franSalesTerm#franSalesTerm" class="menu-link"> <span
							class="menu-text">기간별판매매출</span>
						</a>
					</div>
					<div class="menu-item" id="franByProdSale">
						<a href="${cPath }/main/franchisee/franByProdSale#franByProdSale" class="menu-link"> <span
							class="menu-text">상품별매출</span>
						</a>
					</div>


				</div>
			</div>

<!-- 			<div class="menu-item has-sub"> -->
<!-- 				<a href="#" class="menu-link"> <span class="menu-icon"><i -->
<!-- 						class="fa fa-address-book"></i></span> <span class="menu-text">직원관리</span> -->
<!-- 					<span class="menu-caret"><b class="caret"></b></span> -->
<!-- 				</a> -->
<!-- 				<div class="menu-submenu"> -->
<!-- 					<div class="menu-item" id="staffList"> -->
<%-- 						<a href="${pageContext.request.contextPath }/main/franchisee/staffList#staffList" class="menu-link"> <span --%>
<!-- 							class="menu-text">직원목록</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="menu-submenu"> -->
<!-- 					<div class="menu-item" id="quitstaffList"> -->
<%-- 						<a href="${pageContext.request.contextPath }/main/franchisee/quitstaffList#quitstaffList" class="menu-link"> <span --%>
<!-- 							class="menu-text">퇴사한직원목록</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-boxes"></i></span> <span class="menu-text">재고관리</span> <span
					class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="franFranInvList">
						<a href="${cPath }/main/franchisee/franFranInvList.do#franFranInvList" class="menu-link"> <span
							class="menu-text">재고조회</span>
						</a>
					</div>
					<div class="menu-item" id="franHeadInvList">
						<a href="${cPath }/main/franchisee/franHeadInvList.do#franHeadInvList" class="menu-link"> <span
							class="menu-text">발주신청</span>
						</a>
					</div>
					<div class="menu-item" id="franInvReqList">
						<a href="${cPath }/main/franchisee/franInvReqList.do#franInvReqList" class="menu-link"> <span
							class="menu-text">발주내역</span>
						</a>
					</div>
				</div>
			</div>

			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-cart-flatbed"></i></span> <span class="menu-text">긴급재고신청관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="franFranchiseList">
						<a href="${cPath }/main/franchisee/franFranchiseList.do#franFranchiseList" class="menu-link"> <span
							class="menu-text">근처가맹점조회</span>
						</a>
					</div>
					<div class="menu-item" id="franEmerFranInvList">
						<a href="${cPath }/main/franchisee/franEmerFranInvList.do#franEmerFranInvList" class="menu-link"> <span
							class="menu-text">긴급재고신청</span>
						</a>
					</div>
					<div class="menu-item" id="franEmerFranInvApplyList">
						<a href="${cPath }/main/franchisee/franEmerFranInvApplyList.do#franEmerFranInvApplyList" class="menu-link"> <span
							class="menu-text">긴급재고신청목록조회</span>
						</a>
					</div>
					<div class="menu-item" id="franRetrieveEmerFranInvApproveList">
						<a href="${cPath }/main/franchisee/franRetrieveEmerFranInvApproveList.do#franRetrieveEmerFranInvApproveList" class="menu-link"> <span
							class="menu-text">긴급재고승인목록조회</span>
						</a>
					</div>
				</div>
			</div>
<!-- 			<div class="menu-item has-sub"> -->
<!-- 				<a href="#" class="menu-link"> <span class="menu-icon"><i -->
<!-- 						class="fa fa-calendar-check "></i></span> <span class="menu-text">본사 공문</span> -->
<!-- 					<span class="menu-caret"><b class="caret"></b></span> -->
<!-- 				</a> -->
<!-- 				<div class="menu-submenu"> -->
<!-- 					<div class="menu-item" id="memorandum"> -->
<%-- 						<security:authentication property="principal" var="principal"/> --%>
<%-- 						<a href="${cPath }/main/franchise/${principal.username}/memorandum#memorandum" class="menu-link"> <span --%>
<!-- 							class="menu-text">공문</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-calendar-check "></i></span> <span class="menu-text">일정관리</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item" id="francalendar">
						<security:authentication property="principal" var="principal"/>
						<a href="${cPath }/main/franchise/${principal.username}/francalendar#francalendar" class="menu-link"> <span
							class="menu-text">일정캘린더</span>
						</a>
					</div>
				</div>
			</div>


<!-- 			<div class="menu-item has-sub"> -->
<!-- 				<a href="#" class="menu-link"> <span class="menu-icon"><i -->
<!-- 						class="fa fa-shop"></i></span> <span class="menu-text">매장시설관리</span> -->
<!-- 				<span class="menu-caret"><b class="caret"></b></span> -->
<!-- 				</a> -->
<!-- 				<div class="menu-submenu"> -->
<!-- 					<div class="menu-item" id="storemanageList"> -->
<%-- 						<a href="${cPath }/main/franchisee/storemanageList#storemanageList" class="menu-link"> <span --%>
<!-- 							class="menu-text">시설수리신청목록</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="menu-item" id="storemanageInsert"> -->
<%-- 						<a href="${cPath }/main/franchisee/storemanageInsert#storemanageInsert" class="menu-link"> <span --%>
<!-- 							class="menu-text">시설수리신청</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<!-- END menu -->
	</div>
	<!-- END scrollbar -->
<!-- END #sidebar -->
<!-- BEGIN mobile-sidebar-backdrop -->
<button class="app-sidebar-mobile-backdrop" data-toggle-target=".app"
	data-toggle-class="app-sidebar-mobile-toggled"></button>
<!-- END mobile-sidebar-backdrop -->
<script src="${cPath }/resources/js/app/utils/sidebar.js"></script>