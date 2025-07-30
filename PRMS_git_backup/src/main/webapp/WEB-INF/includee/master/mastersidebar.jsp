<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!-- BEGIN #sidebar -->
<!-- BEGIN scrollbar -->
<input type="hidden" id="hash" value="${hash }" />
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
						<security:authorize access="hasAuthority('MASTER')">
							<security:authentication property="principal" var="principal"/>
							<div class="flex-grow-1 fw-bold" id="masterId">${principal.username }</div>
							<div class="ms-auto">
								<i class="fa fa-chevron-down"></i>
							</div>
						</security:authorize>
					</div>
				</div>
			</a>
			<div class="dropdown-menu dropdown-menu-end me-lg-3 mt-1 w-200px">

<!-- 				<a class="dropdown-item d-flex align-items-center" -->
<!-- 					href="profile.html"><i class="far fa-user fa-fw fa-lg me-3"></i> -->
<!-- 					개인정보</a> <a class="dropdown-item d-flex align-items-center" -->
<!-- 					href="email_inbox.html"><i -->
<!-- 					class="far fa-envelope fa-fw fa-lg me-3"></i> 메일함 </a>  -->
					<a
					class="dropdown-item d-flex align-items-center"
					href="${cPath }/main/master/calendar"><i
					class="far fa-calendar fa-fw fa-lg me-3"></i> 캘린더 </a>
<!-- 					<a -->
<!-- 					class="dropdown-item d-flex align-items-center" -->
<!-- 					href="settings.html"><i class="fa fa-sliders fa-fw fa-lg me-3"></i> -->
<!-- 					설정</a> -->
				<div class="dropdown-divider"></div>
				<a class="dropdown-item d-flex align-items-center"
					href="${cPath }/main/logout"><i
					class="fa fa-arrow-right-from-bracket fa-fw fa-lg me-3"></i> 로그아웃</a>
			</div>
		</div>
<!-- 		<div class="menu-header">My Info</div> -->
		<div class="menu-item" id="masterpage">
			<a href="${cPath}/main/master/masterpage.do#masterpage" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-qrcode"></i></span> <span class="menu-text">대시보드</span>
			</a>
		</div>

		<div id="menu-header-font" class="menu-header">온라인관리</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-receipt"></i></span> <span class="menu-text">주문거래관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="marketOrder">
					<a href="${cPath }/main/master/marketOrder/form#marketOrder" class="menu-link"> <span
						class="menu-text">온라인주문내역</span>
					</a>
				</div>
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="layout_starter.html" class="menu-link"> <span -->
<!-- 						class="menu-text">가맹점주문</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
			</div>
		</div>
		

		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-chart-line"></i></span> <span class="menu-text">매출관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="salesTerm">
					<a href="${cPath }/main/master/salesTerm#salesTerm" class="menu-link"> <span
						class="menu-text">기간별판매매출</span>
					</a>
				</div>
				<div class="menu-item" id="salesProd">
					<a href="${cPath }/main/master/salesProd#salesProd" class="menu-link"> <span
						class="menu-text">상품별매출</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-warehouse"></i></span> <span class="menu-text">본사재고관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="adminInvList">
					<a href="${cPath}/main/master/adminInvList.do#adminInvList" class="menu-link"> <span
						class="menu-text">재고현황</span>
					</a>
				</div>
				<div class="menu-item" id="releaseList">
					<a href="${pageContext.request.contextPath}/main/master/releaseList.do#releaseList" class="menu-link"> <span
						class="menu-text">상품출고</span>
					</a>
				</div>
			</div>
		</div>
<!-- 		<div class="menu-item has-sub"> -->
<!-- 			<a href="#" class="menu-link"> <span class="menu-icon"><i -->
<!-- 					class="fa fa-boxes"></i></span> <span class="menu-text">상품물류관리</span> -->
<!-- 				<span class="menu-caret"><b class="caret"></b></span> -->
<!-- 			</a> -->
<!-- 			<div class="menu-submenu"> -->

<!-- 				<div class="menu-item" id="delivery"> -->
<%-- 					<a href="${cPath }/main/master/deliveryList#delivery" class="menu-link"> <span --%>
<!-- 						class="menu-text">배송관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item" id="refundList"> -->
<%-- 					<a href="${cPath }/main/master/refundList#refundList" class="menu-link"> <span --%>
<!-- 						class="menu-text">환불신청관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item" id="adminProdList"> -->
<%-- 					<a href="${cPath}/main/master/adminProdList.do#adminProdList" class="menu-link"> <span --%>
<!-- 						class="menu-text">상품관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-address-book"></i></span> <span class="menu-text">회원관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="memberList">
					<a
						href="${pageContext.request.contextPath}/main/master/memberList.do#memberList"
						class="menu-link"> <span class="menu-text">회원정보</span>
					</a>
				</div>
				<div class="menu-item" id="blackList">
					<a
						href="${pageContext.request.contextPath}/main/master/blackList.do#blackList"
						class="menu-link"> <span class="menu-text">블랙리스트회원</span>
					</a>
				</div>
			</div>
		</div>

		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-clipboard"></i></span> <span class="menu-text">리뷰관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id ="reviewmasterList">
					<a href="${cPath}/main/master/reviewmasterList#reviewmasterList" class="menu-link"> <span
						class="menu-text">리뷰전체조회</span>
					</a>
				</div>
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="table_elements.html" class="menu-link"> <span -->
<!-- 						class="menu-text">리뷰블라인드처리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
			</div>
		</div>

		<div class="menu-item has-sub">
			<a href="javascript:;" class="menu-link">
				<div class="menu-icon">
					<i class="fa fa-headset"></i>
					<!--<span class="w-5px h-5px rounded-3 bg-theme position-absolute top-0 end-0 mt-3px me-3px"></span>-->
				</div>
				<div class="menu-text d-flex align-items-center">고객센터관리</div> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="noticeList">
					<a href="${cPath}/main/master/noticeList#noticeList" class="menu-link">
						<div class="menu-text">공지사항게시판관리</div>
					</a>
				</div>
				<div class="menu-item" id="centerMasterList">
					<a href="${cPath}/main/master/centerMasterList#centerMasterList" class="menu-link">
						<div class="menu-text">Q&A게시판</div>
					</a>
				</div>
			</div>
		</div>












		<div id="menu-header-font" class="menu-header">리테일관리</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-comments"></i></span> <span class="menu-text">창업상담관리</span>
				<span class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="foundCheckList">
					<a href="${cPath }/main/master/foundCheckList.do#foundCheckList" class="menu-link"> <span
						class="menu-text">창업자격승인검토</span>
					</a>
				</div>
				<div class="menu-item" id="foundApproveList">
					<a href="${cPath }/main/master/foundApproveList.do#foundApproveList" class="menu-link"> <span
						class="menu-text">창업상담일자배정</span>
					</a>
				</div>
				<div class="menu-item" id="counselATList">
					<a href="${cPath }/main/master/counselATList#counselATList" class="menu-link"> <span
						class="menu-text">창업상담승인</span>
					</a>
				</div>
			</div>
		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-store"></i></span> <span class="menu-text">매장관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="foundOpen">
					<a href="${pageContext.request.contextPath }/main/master/FoundOpen.do#foundOpen" class="menu-link"> <span
						class="menu-text">가맹점개업관리</span>
					</a>
				</div>
				<div class="menu-item" id="franchise">
					<a href="${cPath}/main/master/franchise#franchise" class="menu-link"> <span
						class="menu-text">가맹점정보관리</span>
					</a>
				</div>

<!-- 				<div class="menu-item" id="storemamage"> -->
<%-- 					<a href="${cPath}/main/master/storemamage.do#storemamage" class="menu-link"> <span --%>
<!-- 						class="menu-text">수리신청관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item" id="maintainlist"> -->
<%-- 					<a href="${cPath}/main/master/maintainlist.do#maintainlist" class="menu-link"> <span --%>
<!-- 						class="menu-text">관리비관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item" id="memorandomList"> -->
<%-- 					<a href="${cPath}/main/master/memorandumList.do#memorandomList" class="menu-link"> <span --%>
<!-- 						class="menu-text">공문발송관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
				<div class="menu-item" id="franchiseeList">
					<a href="${cPath }/main/master/franchiseeList#franchiseeList" class="menu-link"> <span
						class="menu-text">가맹점폐업관리</span>
					</a>
				</div>
			</div>
		</div>

		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-receipt"></i></span> <span class="menu-text">주문거래관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="franOrder">
					<a href="${pageContext.request.contextPath }/main/master/franOrder/form#franOrder" class="menu-link"> <span
						class="menu-text">가맹점발주내역</span>
					</a>
				</div>
			</div>
		</div>

		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-chart-simple"></i></span> <span class="menu-text">가맹점매출관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
				<div class="menu-item" id="adminFranSalesTerm">
					<a href="${cPath }/main/master/adminFranSalesTerm#adminFranSalesTerm" class="menu-link"> <span
						class="menu-text">총매출조회</span>
					</a>
				</div>
			</div>

		</div>
		<div class="menu-item has-sub">
			<a href="#" class="menu-link"> <span class="menu-icon"><i
					class="fa fa-magnifying-glass"></i></span> <span class="menu-text">가맹점감사관리</span> <span
				class="menu-caret"><b class="caret"></b></span>
			</a>
			<div class="menu-submenu">
<!-- 				<div class="menu-item" id="checkList"> -->
<%-- 					<a href="${cPath }/main/master/checkList#checkList" class="menu-link"> <span --%>
<!-- 						class="menu-text">체크리스트(예시)</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
				<div class="menu-item" id="franchiseAuditList">
					<a href="${cPath }/main/master/franchiseAuditList#franchiseAuditList" class="menu-link"> <span
						class="menu-text">가맹점감사평가</span>
					</a>
				</div>
				<div class="menu-item" id="franAuditList">
					<a href="${cPath }/main/master/franAuditList#franAuditList" class="menu-link"> <span
						class="menu-text">가맹점감사결과</span>
					</a>
				</div>
				<div class="menu-item" id="underPerformingFranchiseList">
					<a href="${cPath }/main/master/underPerformingFranchiseList#underPerformingFranchiseList" class="menu-link"> <span
						class="menu-text">부진매장관리</span>
					</a>
				</div>
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="table_plugins.html" class="menu-link"> <span -->
<!-- 						class="menu-text">점검미달가맹점처리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
			</div>
		</div>
<!-- 		<div class="menu-item has-sub"> -->
<!-- 			<a href="#" class="menu-link"> <span class="menu-icon"><i -->
<!-- 					class="bi bi-graph-down-arrow"></i></span> <span class="menu-text">부진매장 교육관리</span> <span -->
<!-- 				class="menu-caret"><b class="caret"></b></span> -->
<!-- 			</a> -->
<!-- 			<div class="menu-submenu"> -->
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="layout_starter.html" class="menu-link"> <span -->
<!-- 						class="menu-text">추가교육일정리스트</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<div class="menu-item has-sub"> -->
<!-- 			<a href="#" class="menu-link"> <span class="menu-icon"><i -->
<!-- 					class="fa fa-door-open"></i></span> <span class="menu-text">개업관리</span> <span -->
<!-- 				class="menu-caret"><b class="caret"></b></span> -->
<!-- 			</a> -->
<!-- 			<div class="menu-submenu"> -->
<!-- 				<div class="menu-item" id="calendar1"> -->
<%-- 					<a href="${pageContext.request.contextPath }/main/master/calendar#calendar1" class="menu-link"> <span --%>
<!-- 						class="menu-text">교육훈련관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="layout_starter.html" class="menu-link"> <span -->
<!-- 						class="menu-text">개업일정계획</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="layout_starter.html" class="menu-link"> <span -->
<!-- 						class="menu-text">가맹비</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 					<div class="menu-item"> -->
<!-- 						<a href="layout_starter.html" class="menu-link"> <span -->
<!-- 							class="menu-text">개업매장 일정캘린더</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				<div class="menu-item"> -->
<!-- 					<a href="layout_starter.html" class="menu-link"> <span -->
<!-- 						class="menu-text">시설관리</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu-item" id="openContract"> -->
<%-- 					<a href="${cPath}/main/master/openContract#openContract" class="menu-link"> <span --%>
<!-- 						class="menu-text">가맹문서</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->





	</div>
	<!-- END menu -->
	<br>
	<br>
</div>
<!-- END scrollbar -->
<!-- END #sidebar -->
<!-- BEGIN mobile-sidebar-backdrop -->
<button class="app-sidebar-mobile-backdrop" data-toggle-target=".app"
	data-toggle-class="app-sidebar-mobile-toggled"></button>
<!-- END mobile-sidebar-backdrop -->

<script src="${cPath }/resources/js/app/utils/sidebar.js"></script>
