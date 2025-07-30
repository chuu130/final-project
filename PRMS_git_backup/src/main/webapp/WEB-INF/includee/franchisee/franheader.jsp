<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!-- BEGIN #header -->

			<!-- 시큐리티 아이디 정보저장 -->
			<security:authorize access="hasAuthority('FRANCHISEE')">
				<security:authentication property="principal" var="principal"/>
					<span id="empId" style="display:none">${principal.username }</span>
			</security:authorize>

			<!-- BEGIN desktop-toggler -->
			<div class="desktop-toggler">
				<button type="button" class="menu-toggler" data-toggle-class="app-sidebar-collapsed" data-toggle-target=".app">
					<span class="bar"></span>
					<span class="bar"></span>
				</button>
			</div>
			<!-- END desktop-toggler -->

			<!-- BEGIN mobile-toggler -->
			<div class="mobile-toggler">
				<button type="button" class="menu-toggler" data-toggle-class="app-sidebar-mobile-toggled" data-toggle-target=".app">
					<span class="bar"></span>
					<span class="bar"></span>
				</button>
			</div>
			<!-- END mobile-toggler -->

			<!-- BEGIN brand -->
			<div class="brand">
				<a href="${cPath }/main/franchisee/franchiseepage.do#franchiseepage" class="brand-logo">
					가맹점주
				</a>
			</div>
			<!-- END brand -->

			<!-- BEGIN menu -->
			<div class="menu">
<!-- 				<div class="menu-item dropdown"> -->
<!-- 					<a href="index.html" data-toggle-class="app-header-menu-search-toggled" data-toggle-target=".app" class="menu-link"> -->
<!-- 						<div class="menu-icon"><i class="bi bi-search nav-icon"></i></div> -->
<!-- 					</a> -->
<!-- 				</div> -->
				<div class="menu-item dropdown dropdown-mobile-full">
					<a href="#" data-bs-toggle="dropdown" data-bs-display="static" class="menu-link">
						<div class="menu-icon"><i class="bi bi-grid-3x3-gap nav-icon"></i></div>
					</a>
					<div class="dropdown-menu fade dropdown-menu-end w-300px text-center p-0 mt-1 overflow-hidden">
						<div class="row gx-0 p-1 pb-0">
							<div class="col-6">
								<div class="h-100 p-1">
									<a href="${cPath }/franchise/franchisePos" target="_blank" class="dropdown-item p-2 rounded-2">
										<div class="position-relative pt-1">
											<i class="bi bi-hdd-network fs-2 d-block text-body text-opacity-50"></i>
										</div>
										<div class="small">포스기 이용</div>
									</a>
								</div>
							</div>
							<div class="col-6">
								<div class="h-100 p-1">
									<security:authentication property="principal" var="principal"/>
									<a href="${cPath }/main/franchise/${principal.username}/francalendar" class="dropdown-item p-2 rounded-2">
										<div class="position-relative pt-1">
											<i class="bi bi-calendar4 fs-2 d-block text-body text-opacity-50"></i>
										</div>
										<div class="small">캘린더</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="menu-item dropdown dropdown-mobile-full">
					<a href="#" data-bs-toggle="dropdown" data-bs-display="static" class="menu-link">
						<div class="menu-icon"><i class="bi bi-bell nav-icon"></i></div>
						<div class="menu-badge bg-theme"></div>
					</a>
					<div class="dropdown-menu dropdown-menu-end mt-1 w-350px pt-1">
						<h6 class="dropdown-header mb-1">알림<span id="alermCount"></span></h6>
						<div class="dropdown-divider mt-1"></div>
						<div id="alermList">
<!-- 							<a href="#" class="d-flex align-items-center dropdown-item text-wrap"> -->
<!-- 								<div class="fs-20px bg-primary bg-opacity-15 w-40px h-40px rounded-pill d-flex align-items-center justify-content-center"> -->
<!-- 									<i class="fa fa-box fa-lg text-primary"></i> -->
<!-- 								</div> -->
<!-- 								<div class="flex-1 flex-wrap ps-3"> -->
<!-- 									<div>New order received ($1,299)</div> -->
<!-- 									<div class="small text-body text-opacity-50">just now</div> -->
<!-- 								</div> -->
<!-- 								<div class="ps-2 text-body text-opacity-25"> -->
<!-- 									<i class="fa fa-chevron-right"></i> -->
<!-- 								</div> -->
<!-- 							</a> -->
<!-- 							<a href="#" class="d-flex align-items-center dropdown-item text-wrap"> -->
<!-- 								<div class="fs-20px bg-body w-40px h-40px rounded-pill d-flex align-items-center justify-content-center"> -->
<!-- 									<i class="fa fa-user text-body text-opacity-50"></i> -->
<!-- 								</div> -->
<!-- 								<div class="flex-1 flex-wrap ps-3"> -->
<!-- 									<div>3 new account created</div> -->
<!-- 									<div class="small text-body text-opacity-50">2 minutes ago</div> -->
<!-- 								</div> -->
<!-- 								<div class="ps-2 text-body text-opacity-25"> -->
<!-- 									<i class="fa fa-chevron-right"></i> -->
<!-- 								</div> -->
<!-- 							</a> -->
<!-- 							<a href="#" class="d-flex align-items-center dropdown-item text-wrap"> -->
<!-- 								<div class="fs-20px bg-primary bg-opacity-15 w-40px h-40px rounded-pill d-flex align-items-center justify-content-center"> -->
<!-- 									<i class="fa fa-server text-primary"></i> -->
<!-- 								</div> -->
<!-- 								<div class="flex-1 flex-wrap ps-3"> -->
<!-- 									<div>Setup completed</div> -->
<!-- 									<div class="small text-body text-opacity-50">3 minutes ago</div> -->
<!-- 								</div> -->
<!-- 								<div class="ps-2 text-body text-opacity-25"> -->
<!-- 									<i class="fa fa-chevron-right"></i> -->
<!-- 								</div> -->
<!-- 							</a> -->
<!-- 							<a href="#" class="d-flex align-items-center dropdown-item text-wrap"> -->
<!-- 								<div class="fs-20px bg-primary bg-opacity-15 w-40px h-40px rounded-pill d-flex align-items-center justify-content-center"> -->
<!-- 									<i class="fa fa-screwdriver-wrench text-primary"></i> -->
<!-- 								</div> -->
<!-- 								<div class="flex-1 flex-wrap ps-3"> -->
<!-- 									<div>Widget installation done</div> -->
<!-- 									<div class="small text-body text-opacity-50">5 minutes ago</div> -->
<!-- 								</div> -->
<!-- 								<div class="ps-2 text-body text-opacity-25"> -->
<!-- 									<i class="fa fa-chevron-right"></i> -->
<!-- 								</div> -->
<!-- 							</a> -->
<!-- 							<a href="#" class="d-flex align-items-center dropdown-item text-wrap"> -->
<!-- 								<div class="fs-20px bg-primary bg-opacity-15 w-40px h-40px rounded-pill d-flex align-items-center justify-content-center"> -->
<!-- 									<i class="fa fa-file-invoice text-primary"></i> -->
<!-- 								</div> -->
<!-- 								<div class="flex-1 flex-wrap ps-3"> -->
<!-- 									<div>Payment method enabled</div> -->
<!-- 									<div class="small text-body text-opacity-50">10 minutes ago</div> -->
<!-- 								</div> -->
<!-- 								<div class="ps-2 text-body text-opacity-25"> -->
<!-- 									<i class="fa fa-chevron-right"></i> -->
<!-- 								</div> -->
<!-- 							</a> -->
						</div>

						<div class="dropdown-divider"></div>
						<div class="text-center">
							<a href="#" class="text-decoration-none fw-bold">see all</a>
						</div>
					</div>
				</div>
				<div class="menu-item dropdown dropdown-mobile-full">
					<a href="#" data-bs-toggle="dropdown" data-bs-display="static" class="menu-link">
						<div class="menu-img online">
							<span class="menu-img-bg" style="background-image: url(${pageContext.request.contextPath}/resources/Franchise/template_html/dist/assets/img/user/user.jpg)"></span>
						</div>
						<div class="menu-text d d-none">username@account.com</div>
					</a>
					<div class="dropdown-menu dropdown-menu-end me-lg-3 mt-1 w-200px">
<!-- 						<a class="dropdown-item d-flex align-items-center" href="profile.html"><i class="far fa-user fa-fw fa-lg me-3"></i> Profile</a> -->
<!-- 						<a class="dropdown-item d-flex align-items-center" href="email_inbox.html"><i class="far fa-envelope fa-fw fa-lg me-3"></i> Inbox</a> -->
<!-- 						<a class="dropdown-item d-flex align-items-center" href="calendar.html"><i class="far fa-calendar fa-fw fa-lg me-3"></i> Calendar</a> -->
<!-- 						<a class="dropdown-item d-flex align-items-center" href="settings.html"><i class="fa fa-sliders fa-fw fa-lg me-3"></i> Settings</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
						<form action="${cPath }/main/logout">
							<button type="submit" class="dropdown-item d-flex align-items-center"><i class="fa fa-arrow-right-from-bracket fa-fw fa-lg me-3"></i>로그아웃</button>
						</form>
					</div>
				</div>
			</div>
			<!-- END menu -->

			<!-- BEGIN menu-search -->
			<form class="menu-search" method="POST" name="header_search_form">
				<div class="menu-search-container">
					<div class="menu-search-icon"><i class="bi bi-search"></i></div>
					<div class="menu-search-input">
						<input type="text" class="form-control form-control-lg" placeholder="Search menu...">
					</div>
					<div class="menu-search-icon">
						<a href="#" data-toggle-class="app-header-menu-search-toggled" data-toggle-target=".app"><i class="bi bi-x-lg"></i></a>
					</div>
				</div>
			</form>
			<!-- END menu-search -->
		<!-- END #header -->

		<!-- 웹소켓 -->
		<script src="${cPath }/resources/js/app/websocket/alermCommon.js"></script>