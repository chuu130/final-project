<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<!-- BEGIN mobile-sidebar-backdrop -->
		<button class="app-sidebar-mobile-backdrop" data-toggle-target=".app" data-toggle-class="app-sidebar-mobile-toggled"></button>
		<!-- END mobile-sidebar-backdrop -->

			<div class="d-flex align-items-center mb-3">
				<div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Pages</a></li>
						<li class="breadcrumb-item active">Search</li>
					</ul>
					<h1 class="page-header mb-0">근처가맹점조회</h1>
				</div>
			</div>

			<div class="card">
				<div class="tab-content p-4">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4">

						</div>
						<!-- END input-group -->

						<!-- BEGIN table -->
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th class="border-top-0 pt-0 pb-2">가맹점 명</th>
										<th class="border-top-0 pt-0 pb-2">가맹점 지역</th>
										<th class="border-top-0 pt-0 pb-2">연락처</th>
										<th class="border-top-0 pt-0 pb-2">주소</th>
										<th class="border-top-0 pt-0 pb-2">이메일</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty sfcList }">
										<c:forEach items="${sfcList }" var="franchise">
											<tr>
												<td class="align-middle">${franchise.franchiseNm }</td>
												<td class="align-middle">${franchise.cmmnCodeNm }</td>
												<td class="align-middle">${franchise.franchiseTel }</td>
												<td class="align-middle">(${franchise.franchiseZip }) ${franchise.franchiseAdd1 } ${franchise.franchiseAdd2 }</td>
												<td class="align-middle">${franchise.franchiseEmail }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9"> 이력 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<!-- END table -->
						<form:form id="searchform" method="get" action="${cPath }/main/staff/staffFranchiseList.do">
							<input type="hidden" name="page" />
						</form:form>
						<div class="d-lg-flex align-items-center">
							<div class="me-lg-auto text-md-left text-center mt-2 mt-lg-0 mb-2 mb-lg-0">
							</div>
							<ul class="pagination mb-0 justify-content-center flex-wrap paging-area">
								${pagingHTML }
							</ul>
						</div>
					</div>
				</div>

	<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
		<!-- END btn-scroll-top -->


