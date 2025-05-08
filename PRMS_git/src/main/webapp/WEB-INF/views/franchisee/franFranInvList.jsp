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
						<li class="breadcrumb-item"><a href="#">재고관리</a></li>
						<li class="breadcrumb-item active">재고조회</li>
					</ul>
					<h1 class="page-header mb-0">재고조회</h1>
				</div>
			</div>

			<div class="card">
				<div class="tab-content p-4">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4">
							<div class="flex-fill position-relative">
								<div id="searchUI">
									<form>
										<input type="text" class="form-control px-35px rounded enterkey" id="searchWord" name="searchWord" placeholder="상품을 검색하세요." style="width: 50%" >
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
										<th class="border-top-0 pt-0 pb-2">상품 이미지</th>
										<th class="border-top-0 pt-0 pb-2">상품 명</th>
										<th class="border-top-0 pt-0 pb-2">개수</th>
										<th class="border-top-0 pt-0 pb-2">단가</th>
										<th class="border-top-0 pt-0 pb-2"> 반품/폐기</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty ffiList }">
										<c:forEach items="${ffiList }" var="franinv">
											<tr ${franinv.fivQy < 10 ? 'class="table-danger"' : ''}>
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
												<td class="align-middle">
													<div style="display: flex; gap: 5px;">
														<button class="btn btn-secondary btn-sm fivReturn" data-bs-toggle="modal" data-bs-target="#franInvReturn_modal" data-fiv-rid="${franinv.fivId }">반품</button>
														<button class="btn btn-secondary btn-sm fivDispose" data-bs-toggle="modal" data-bs-target="#franInvDispose_modal" data-fiv-did="${franinv.fivId }">폐기</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9"> 재고 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div class="modal fade" id="franInvReturn_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">재고반품</h5>
										</div>
										<div>
											<form id="InvReturnForm" method="get" action="${cPath }/main/franchisee/franFranInvReturn.do">
												<table style="margin: 50px auto;">
													<tr>
														<td style="text-align: right; ">
															재고ID:
														</td>
														<td>
															<input class="form-control" id="fivRId" type="text" name=fivId readonly/>
														</td>
													</tr>
													<tr>
														<td>
															반품수량:
														</td>
														<td>
															<input class="form-control" id="fivRQy" type="text" name=fivQy min="1" required/>
														</td>
													</tr>
												</table>
												<input type="hidden" name="searchWord" value="${simpleCondition.searchWord}"/>
												<input type="hidden" name="searchType" value="${simpleCondition.searchType}"/>
												<input type="hidden" name="page" value="${page}"/>
												<input type="hidden" name="franchiseId" value="${franchiseId}"/>
											</form>
										</div>
										<div class="modal-footer">
							    			<button type="button" class="btn btn-primary invReturn">반품</button>
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="franInvDispose_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">재고폐기</h5>
										</div>
										<div>
											<form id="InvDisposeForm" method="get" action="${cPath }/main/franchisee/franFranInvDispose.do">
												<table style="margin: 50px auto;">
													<tr>
														<td style="text-align: right; ">
															재고ID:
														</td>
														<td>
															<input class="form-control" id="fivDId" type="text" name=fivId readonly/>
														</td>
													</tr>
													<tr>
														<td>
															폐기수량:
														</td>
														<td>
															<input class="form-control" id="fivDQy" type="number" name=fivQy min="1" required/>
														</td>
													</tr>
												</table>
												<input type="hidden" name="searchWord" value="${simpleCondition.searchWord}"/>
												<input type="hidden" name="searchType" value="${simpleCondition.searchType}"/>
												<input type="hidden" name="page" value="${page}"/>
											</form>
										</div>
										<div class="modal-footer">
							    			<button type="button" class="btn btn-primary invDispose">폐기</button>
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- END table -->
						<form:form id="searchform" method="get" action="${cPath }/main/franchisee/franFranInvList.do#franFranInvList">
							<input type="hidden" id="searchType" name="searchType" value="${simpleCondition.searchType}"/>
							<input type="hidden" id="searchWord" name="searchWord" value="${simpleCondition.searchWord}"/>
							<input type="hidden" name="page"/>
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
		<%-- ReturnDisposeUpdate.js --%>
		<script src="${cPath }/resources/js/app/franchise/invReqRDUpdate.js"></script>

