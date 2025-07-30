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
						<li class="breadcrumb-item active">발주신청내역</li>
					</ul>
					<h1 class="page-header mb-0">발주신청내역</h1>
				</div>
			</div>

			<div class="card">
				<div class="tab-content p-4">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4">
							<div class="flex-fill position-relative">
								<div id="searchUI">
									<form>
										<select class="form-select selectkey" id="searchWord" name="searchWord" style="width: 20%">
											<option value>전체</option>
											<option value="P" ${simpleCondition.searchWord == 'P' ? 'selected' : ''}>승인대기</option>
											<option value="Y" ${simpleCondition.searchWord == 'Y' ? 'selected' : ''}>승인완료</option>
											<option value="N" ${simpleCondition.searchWord == 'N' ? 'selected' : ''}>반려</option>
											<option value="C" ${simpleCondition.searchWord == 'C' ? 'selected' : ''}>발주취소</option>
										</select>
										<input type="hidden" id="searchType" name="searchType" value="search">
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
										<th class="border-top-0 pt-0 pb-2">발주ID</th>
										<th class="border-top-0 pt-0 pb-2">발주신청일</th>
										<th class="border-top-0 pt-0 pb-2">발주상태</th>
										<th class="border-top-0 pt-0 pb-2">반려사유</th>
										<th class="border-top-0 pt-0 pb-2">발주 총금액</th>
										<th class="border-top-0 pt-0 pb-2">발주취소</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty firList }">
										<c:forEach items="${firList }" var="fireq">
											<tr>
												<td class="align-middle">
													<a href="javascript:;" class="fLink" data-bs-toggle="modal" data-bs-target="#fiOrder_modal" data-no="${fireq.fireqId }">${fireq.fireqId }</a>
												</td>
												<td class="align-middle">${fireq.fireqDe }</td>
												<c:choose>
													<c:when test="${fireq.fireqSttus eq 'N'}">
														<td class="py-1 align-middle">
														<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
														<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 반려</span></td>
													</c:when>
													<c:when test="${fireq.fireqSttus eq 'Y'}">
														<td class="py-1 align-middle">
														<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
														<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 승인완료</span></td>
													</c:when>
													<c:when test="${fireq.fireqSttus eq 'C'}">
														<td class="py-1 align-middle">
														<span class="badge text-secondary bg-secondary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
														<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 발주취소</span></td>
													</c:when>
													<c:otherwise>
														<td class="py-1 align-middle">
														<span class="badge text-warning bg-warning bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
														<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 승인대기</span></td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${empty fireq.fireqRejCn }">
														<td class="align-middle">해당없음</td>
													</c:when>
													<c:otherwise>
														<td class="align-middle">${fireq.fireqRejCn }</td>
													</c:otherwise>
												</c:choose>
												<td class="align-middle">총 ${fireq.fireqAmountComma }원</td>
												<c:choose>
													<c:when test="${fireq.fireqSttus eq 'P'}">
														<td class="py-1 align-middle">
															<form class="updateForm" action="${cPath }/main/franchisee/franInvReqUpdate.do">
																<input type="hidden" name="fireqId" value="${fireq.fireqId }"/>
																<input type="hidden" name="fireqSttus" value="C"/>
																<input type="hidden" name="searchWord" value="${simpleCondition.searchWord}"/>
																<input type="hidden" name="page" value="${page}"/>
															</form>
															<input type="button" class="btn btn-primary btn-sm invReqCancel" value="발주취소" />
														</td>
													</c:when>
													<c:otherwise>
														<td class="py-1 align-middle"></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9">내역 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<!-- END table -->
						<form:form id="searchform" method="get" action="${cPath }/main/franchisee/franInvReqList.do">
							<input type="hidden" name="searchType" value="${simpleCondition.searchType}"/>
							<input type="hidden" name="searchWord" value="${simpleCondition.searchWord}"/>
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

				<div class="modal fade" id="fiOrder_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="max-width: 1000px; width: 100%;" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">발주내역서</h5>
							</div>
							<div>
								<table class="table table-hover ">
									<thead>
										<tr>
											<th class="text-center align-middle">발주신청상세ID</th>
											<th class="text-center align-middle">상품이미지</th>
											<th class="text-center align-middle">상품이름</th>
											<th class="text-center align-middle">발주수량</th>
											<th class="text-center align-middle">발주단가</th>
										</tr>
									</thead>
									<tbody id="list-body">

									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" type="button" data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>


	<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
		<!-- END btn-scroll-top -->
		<%-- detailModal.js--%>
		<script src="${cPath }/resources/js/app/franchise/invReqDetail.js"></script>
		<%-- update.js--%>
		<script src="${cPath }/resources/js/app/franchise/invReqUpdate.js"></script>


