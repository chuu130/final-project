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
						style="background-image: url(${pageContext.request.contextPath}/resources/Franchise/template_html/dist/assets/img/user/user.jpg)"></div>
				</div>
				<div class="menu-profile-info">
					<div class="d-flex align-items-center">
						<security:authorize access="hasAuthority('EMPLOYEE')">
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
					class="fa fa-arrow-right-from-bracket fa-fw fa-lg me-3"></i> 로그아웃</a>
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

		<div id="menu-header-font" class="menu-header">온라인관리</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-border-all"></i></span> <span class="menu-text">회원관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="table_elements.html" class="menu-link"> <span
						class="menu-text">회원정보조회</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">회원블랙리스트추가</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-border-all"></i></span> <span class="menu-text">매출관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="table_elements.html" class="menu-link"> <span
						class="menu-text">기간별판매매출조회</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">상세매출조회</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">상품별매출조회</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">전년대비매출조회</span>
					</a>
				</div>
			</div>
		</div>

		<div class="menu-item has-sub">
			<a href="javascript:;" class="menu-link">
				<div class="menu-icon">
					<i class="fa fa-wallet"></i>
					<!--<span class="w-5px h-5px rounded-3 bg-theme position-absolute top-0 end-0 mt-3px me-3px"></span>-->
				</div>
				<div class="menu-text d-flex align-items-center">고객센터관리</div> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="pos_customer_order.html" target="_blank" class="menu-link">
						<div class="menu-text">공지사항게시판관리</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="pos_kitchen_order.html" target="_blank" class="menu-link">
						<div class="menu-text">Q&A게시판</div>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-palette"></i></span> <span class="menu-text">쿠폰발급</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="ui_bootstrap.html" class="menu-link"> <span
						class="menu-text">쿠폰지급설정</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="ui_bootstrap.html" class="menu-link"> <span
						class="menu-text">쿠폰발급조회</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-font"></i></span> <span class="menu-text">등급관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="form_elements.html" class="menu-link"> <span
						class="menu-text">회원등급관리</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-border-all"></i></span> <span class="menu-text">리뷰관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="table_elements.html" class="menu-link"> <span
						class="menu-text">신고리뷰조회</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_elements.html" class="menu-link"> <span
						class="menu-text">리뷰블라인드처리</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-chart-pie"></i></span> <span class="menu-text">협력업체관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="chart_js.html" class="menu-link"> <span
						class="menu-text">배송업체관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="chart_js.html" class="menu-link"> <span
						class="menu-text">반려동물관련자재업체관리</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">상품물류관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">재고현황</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">배송관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_fixed_footer.html" class="menu-link"> <span
						class="menu-text">환불반품관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_full_height.html" class="menu-link"> <span
						class="menu-text">재배송관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_full_height.html" class="menu-link"> <span
						class="menu-text">상품조회</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_full_height.html" class="menu-link"> <span
						class="menu-text">상품수정</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_full_height.html" class="menu-link"> <span
						class="menu-text">상품삭제</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_full_height.html" class="menu-link"> <span
						class="menu-text">상품등록</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_full_height.html" class="menu-link"> <span
						class="menu-text">상품정보관리</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">주문거래관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">상풍주문현황확인</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">가맹점주문</span>
					</a>
				</div>
			</div>
		</div>

				<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">입출고관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">상품입고</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">상품출고</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">입고내역수정</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">출고내역수정</span>
					</a>
				</div>
			</div>
		</div>





		<div id="menu-header-font" class="menu-header">리테일관리</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">창업상담관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">창업자격검토</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">창업승인절차</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">개점관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">교육훈련관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">개점일정계획</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">가맹비</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">가맹점개업관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">가맹점폐업관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">시설관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">가맹문서관리</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">일정관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">일정관리캘린더</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">교육관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">교육일정리스트</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">감사관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">방문감사리스트</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">부진매장관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">점검미달가맹점처리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">가맹점점검내역조회</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-border-all"></i></span> <span class="menu-text">매장관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="table_elements.html" class="menu-link"> <span
						class="menu-text">가맹점기본정보</span>
					</a>
				</div>

				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">수리신청관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">관리비관리</span>
					</a>
				</div>
				<div class="menu-item">
					<a href="table_plugins.html" class="menu-link"> <span
						class="menu-text">공문발송관리</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-earth-asia"></i></span> <span class="menu-text">매출관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">총매출조회</span>
					</a>
				</div>
			</div>
			<div class="menu-submenu">
				<div class="menu-item">
					<a href="layout_starter.html" class="menu-link"> <span
						class="menu-text">매출분석</span>
					</a>
				</div>
			</div>
		</div>

	</div>
	<!-- END menu -->
	<div class="p-3 mt-auto">
		<a href="https://seantheme.com/droplet/documentation/index.html"
			target="_blank"
			class="btn d-block btn-theme fs-13px fw-semibold rounded-pill"> <i
			class="fa fa-code-branch me-2 ms-n2 opacity-5"></i> Documentation
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