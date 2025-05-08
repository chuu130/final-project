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
						<li class="breadcrumb-item active">Inventory</li>
					</ul>
					<h1 class="page-header mb-0">재고현황</h1>
				</div>
			</div>

			<div class="card">
				<div class="tab-content p-4">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4">
							<div class="flex-fill position-relative">
								<div id="searchUI">
									<form>
										<input type="text" class="form-control px-35px rounded enterkey" id="searchWord" name="searchWord" placeholder="상품을 검색하세요." >
										<input type="hidden" id="searchType" name="searchType" value="search">
										<div class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 start-0" style="z-index: 1020;">
											<i class="fa fa-search opacity-5"></i>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- END input-group -->

						<!-- BEGIN table -->
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th class="border-top-0 pt-0 pb-2">재고ID</th>
										<th class="border-top-0 pt-0 pb-2">상품 사진</th>
										<th class="border-top-0 pt-0 pb-2">상품 명</th>
										<th class="border-top-0 pt-0 pb-2">개수</th>
										<th class="border-top-0 pt-0 pb-2">단가</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty sfiList }">
										<c:forEach items="${sfiList }" var="franinv">
											<tr>
												<td class="align-middle">${franinv.fivId }</td>
												<c:choose>
													<c:when test="${not empty franinv.franprodImage }">
														<td class="align-middle"><img alt="" class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" width="60" height="40" src="${franinv.franprodImage }"></td>
													</c:when>
													<c:otherwise>
														<td class="align-middle">사진 없음</td>
													</c:otherwise>
												</c:choose>
												<td class="align-middle">${franinv.franprodNm }</td>
												<td class="align-middle">${franinv.fivQy }개</td>
												<td class="align-middle">${franinv.franprodPc }원</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9"> 상품 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<!-- END table -->
						<form:form id="searchform" method="get" action="${cPath }/main/staff/staffFranInvList.do">
							<input type="hidden" id="searchType" name="searchType" value="${simpleCondition.searchType}"/>
							<input type="hidden" id="searchWord" name="searchWord" value="${simpleCondition.searchWord}"/>
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
