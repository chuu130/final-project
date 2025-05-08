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
						<c:url value="/main/master/foundCheckList.do#foundCheckList" var="foundCheckListUrl" />
						<li class="breadcrumb-item"><a href="${foundCheckListUrl }">창업상담관리</a></li>
						<li class="breadcrumb-item active">창업자격승인검토</li>
					</ul>
					<h1 class="page-header mb-0">창업자격승인검토</h1>
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
						<h5>창업승인검토</h5>
							<table class="table table-hover text-nowrap">
								<thead class="boardlist-head">
									<tr>
										<th class="">창업상담관리ID</th>
										<th class="txtlign">창업상담자명</th>
										<th class="txtlign">연락처</th>
										<th class="txtlign">이메일</th>
										<th class="txtlign">주소</th>
										<th class="txtlign">창업희망장소</th>
										<th class="txtlign">겸업여부</th>
										<th class="txtlign">자격증파일</th>
										<th class="txtlign">승인검토</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${not empty fList }">
										<c:forEach items="${fList }" var="found">
											<tr>
												<td class="align-middle"><a href="javascript:;" class="fLink" data-bs-toggle="modal" data-bs-target="#foundCn_modal" data-no="${found.foundNo }">${found.foundNo }</a></td>
												<td class="align-middle">${found.foundNm }</td>
												<td class="align-middle">${found.foundTelno }</td>
												<td class="align-middle">${found.foundEmail }</td>
												<td class="align-middle">(${found.foundZip }) ${found.foundAdres1 } ${found.foundAdres2 }</td>
												<td class="align-middle txtlign">${found.foundPlace }</td>
												<c:choose>
													<c:when test="${found.foundLicenseAt == 'N' }">
														<td class="align-middle txtlign"><span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">X</span></td>
													</c:when>
													<c:otherwise>
														<td class="align-middle txtlign"><span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">O</span></td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${not empty found.foundAtch }">
														<td class="align-middle" style="text-align: center;">
															<a href="${cPath }/resources/images/반려동물관리사.png" download>
																<img src="${cPath }/resources/images/파일첨부.png">
															</a>
														</td>
													</c:when>
													<c:otherwise>
														<td class="align-middle">첨부파일 없음</td>
													</c:otherwise>
												</c:choose>
												<td class="align-middle">
												<form class="updateForm" action="${cPath }/main/master/foundCheckUpdate.do#foundCheckList">
													<input type="hidden" name="foundNo" value="${found.foundNo }"/>
													<input type="hidden" class="confmat" name="foundConfmAt" value="Y"/>
												</form>
													<div style="display: flex; gap: 5px">
														<input type="button" class="btn btn-success btn-sm foundSuccess" value="승인" />
														<input type="button" class="btn btn-danger btn-sm foundFail" value="반려"
														data-bs-toggle="modal" data-bs-target="#foundRetrun_modal" data-email="${found.foundEmail }"/>
													</div>
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
								<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>
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
