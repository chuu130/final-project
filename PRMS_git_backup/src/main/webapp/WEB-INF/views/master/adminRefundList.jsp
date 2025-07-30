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
						<li class="breadcrumb-item active">Check</li>
					</ul>
					<h1 class="page-header mb-0">환불신청관리</h1>
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
										<th class="border-top-0 pt-0 pb-2">환불신청ID</th>
										<th class="border-top-0 pt-0 pb-2">환불신청고객명</th>
										<th class="border-top-0 pt-0 pb-2">연락처</th>
										<th class="border-top-0 pt-0 pb-2">환불사유</th>
										<th class="border-top-0 pt-0 pb-2">환불신청일시</th>
										<th class="border-top-0 pt-0 pb-2">환불처리일시</th>
										<th class="border-top-0 pt-0 pb-2">환불검토</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${not empty refundList }">
										<c:forEach items="${refundList }" var="refund">
											<tr>
												<td class="align-middle"><a href="javascript:;" class="fLink" data-bs-toggle="modal" data-bs-target="#foundCn_modal" data-no="${refund.exchngRtngudId }">${refund.exchngRtngudId }</a></td>
												<td class="align-middle">${refund.member.memNm }</td>
												<td class="align-middle">${refund.member.memTelno }</td>
												<td class="align-middle">${refund.exchngRtngudResn	 }</td>
												<td class="align-middle">${refund.exchngRtngudDe }</td>
												<td class="align-middle">${refund.exchngDe
												 }</td>
												<td class="align-middle" style="display: flex; gap: 5px">
												<form class="updateForm" action="${cPath }/main/master/foundCheckUpdate.do">
													<input type="hidden" name="foundNo" value="${refund.exchngRtngudId }"/>
													<input type="hidden" class="confmat" name="foundConfmAt" value="Y"/>
												</form>
													<input type="button" class="btn btn-success foundSuccess" name="found" value="승인" />
													<input type="button" class="btn btn-danger foundFail" name="foundFail" value="반려" />
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9"> 이력 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>
						<!-- END table -->
						<form:form id="searchform" method="get" action="${cPath }/main/master/foundCheckList.do">
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

				<div class="modal fade" id="foundCn_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">창업상담 내용</h5>
							</div>
							<div id="list-body">

							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" type="button" data-bs-dismiss="modal">Cancel</button>
							</div>
						</div>
					</div>
				</div>

	<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
		<!-- END btn-scroll-top -->
		<%-- update.js --%>
		<script src="${cPath }/resources/js/app/master/foundUpdate.js"></script>
		<%-- detailModal.js--%>
		<script src="${cPath }/resources/js/app/master/foundDetail.js"></script>
