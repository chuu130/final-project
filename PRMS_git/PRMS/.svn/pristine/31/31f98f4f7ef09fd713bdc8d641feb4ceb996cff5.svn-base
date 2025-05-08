<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
							style="background-image: url(${cPath }/resources/Franchise/template_html/dist/assets/img/user/user.jpg)"></div>
					</div>
					<div class="menu-profile-info">
					<div class="d-flex align-items-center">
						<security:authorize access="hasAuthority('STAFF')">
							<security:authentication property="principal" var="principal"/>
							<div class="flex-grow-1 fw-bold">${principal.username }</div>
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
						개인정보</a> <a class="dropdown-item d-flex align-items-center"
						href="email_inbox.html"><i
						class="far fa-envelope fa-fw fa-lg me-3"></i> 메일함 </a> <a
						class="dropdown-item d-flex align-items-center"
						href="calendar.html"><i
						class="far fa-calendar fa-fw fa-lg me-3"></i> 캘린더 </a> <a
						class="dropdown-item d-flex align-items-center"
						href="settings.html"><i class="fa fa-sliders fa-fw fa-lg me-3"></i>
						설정</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item d-flex align-items-center"
						href="page_login.html"><i
						class="fa fa-arrow-right-from-bracket fa-fw fa-lg me-3"></i>
						로그아웃</a>
				</div>
			</div>
			<div id="menu-header-font" class="menu-header">My Info</div>
			<div class="menu-item active">
				<a href="index.html" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-qrcode"></i></span> <span class="menu-text">메인표시할내용</span>
				</a>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"> <i
						class="fa fa-envelope-open-text"></i>
				</span> <span class="menu-text">이메일</span> <span class="menu-caret"><b
						class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item">
						<a href="email_inbox.html" class="menu-link"> <span
							class="menu-text">이메일</span>
						</a>
					</div>
				</div>
			</div>
			<div id="menu-header-font" class="menu-header">Components</div>
			<div class="menu-item has-sub">
				<a href="javascript:;" class="menu-link">
					<div class="menu-icon">
						<i class="fa fa-wallet"></i>
						<!--<span class="w-5px h-5px rounded-3 bg-theme position-absolute top-0 end-0 mt-3px me-3px"></span>-->
					</div>
					<div class="menu-text d-flex align-items-center">포스기관리</div> <span
					class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item">
						<a href="pos_customer_order.html" target="_blank"
							class="menu-link">
							<div class="menu-text">상품결제내역조회</div>
						</a>
					</div>
					<div class="menu-item">
						<a href="pos_kitchen_order.html" target="_blank" class="menu-link">
							<div class="menu-text">상품반품내역조회</div>
						</a>
					</div>
					<div class="menu-item">
						<a href="pos_kitchen_order.html" target="_blank" class="menu-link">
							<div class="menu-text">상품교환내역조회</div>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-font"></i></span> <span class="menu-text">주문거래관리</span> <span
					class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item">
						<a href="${cPath }/main/staff/staffFranchiseList.do" class="menu-link"> <span
							class="menu-text">근처가맹점조회</span>
						</a>
					</div>
					<div class="menu-item">
						<a href="${cPath }/main/staff/staffEmerFranInvList.do" class="menu-link"> <span
							class="menu-text">긴급재고신청</span>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-border-all"></i></span> <span class="menu-text">배송관리</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item">
						<a href="table_elements.html" class="menu-link"> <span
							class="menu-text">배송조회</span>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-chart-pie"></i></span> <span class="menu-text">상품물류관리</span>
					<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
					<div class="menu-item">
						<a href="${cPath }/main/staff/staffFranInvList.do" class="menu-link"> <span
							class="menu-text">재고현황조회</span>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-earth-asia"></i></span> <span class="menu-text">예약관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
				<div class="menu-item">
						<a href="layout_starter.html" class="menu-link"> <span
							class="menu-text">호텔예약조회</span>
						</a>
					</div>
					<div class="menu-item">
						<a href="layout_starter.html" class="menu-link"> <span
							class="menu-text">미용예약조회</span>
						</a>
					</div>

				</div>
			</div>
			<div class="menu-item has-sub">
				<a href="#" class="menu-link"> <span class="menu-icon"><i
						class="fa fa-earth-asia"></i></span> <span class="menu-text">폐기관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
				</a>
				<div class="menu-submenu">
				<div class="menu-item">
						<a href="layout_starter.html" class="menu-link"> <span
							class="menu-text">식품폐기관리</span>
						</a>
					</div>
					<div class="menu-item">
						<a href="layout_starter.html" class="menu-link"> <span
							class="menu-text">물품폐기관리</span>
						</a>
					</div>
				</div>
			</div>




		</div>
		<!-- END menu -->
		<div class="p-3 mt-auto">
			<a href="https://seantheme.com/droplet/documentation/index.html"
				target="_blank"
				class="btn d-block btn-theme fs-13px fw-semibold rounded-pill">
				<i class="fa fa-code-branch me-2 ms-n2 opacity-5"></i> Documentation
			</a>
		</div>
	</div>
	<!-- END scrollbar -->
<!-- END #sidebar -->
<!-- BEGIN mobile-sidebar-backdrop -->
<button class="app-sidebar-mobile-backdrop" data-toggle-target=".app"
	data-toggle-class="app-sidebar-mobile-toggled"></button>
<!-- END mobile-sidebar-backdrop -->
<script src="${cPath }/resources/js/app/utils/sidebar.js"></script>