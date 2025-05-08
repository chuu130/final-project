<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<!-- BEGIN mobile-sidebar-backdrop -->
		<button class="app-sidebar-mobile-backdrop" data-toggle-target=".app" data-toggle-class="app-sidebar-mobile-toggled"></button>
		<!-- END mobile-sidebar-backdrop -->
		<!-- 달력.js, css -->
		<link href="${cPath}/resources/Franchise/template_html/dist/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
		<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<style>
    /* 비활성화된 날짜에 대한 스타일 */
    .datepicker .datepicker-days table tbody tr td.disabled {
        color: #bdbdbd; /* 회색 글자 */
        cursor: not-allowed; /* 마우스 커서 불가능*/
    }
</style>
			<div class="d-flex align-items-center mb-3">
				<div>
					<ul class="breadcrumb">
						<c:url value="/main/master/foundApproveList.do#foundApproveList" var="foundApproveListUrl" />
						<li class="breadcrumb-item"><a href="${foundApproveListUrl }">창업상담관리</a></li>
						<li class="breadcrumb-item active">창업상담일자배정</li>
					</ul>
					<h1 class="page-header mb-0">창업상담일자배정</h1>
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
							<h5>창업상담목록</h5>
								<thead class="boardlist-head">
									<tr>
										<th>창업상담관리ID</th>
										<th>창업상담자명</th>
										<th>연락처</th>
										<th>이메일</th>
										<th>주소</th>
										<th>창업희망장소</th>
										<th>상담일</th>
										<th>상담직원</th>
										<th>상담일배정</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty faList }">
										<c:forEach items="${faList }" var="found">
											<tr>
												<td class="align-middle">${found.foundNo }</td>
												<td class="align-middle">${found.foundNm }</td>
												<td class="align-middle">${found.foundTelno }</td>
												<td class="align-middle">${found.foundEmail }</td>
												<td class="align-middle">(${found.foundZip }) ${found.foundAdres1 } ${found.foundAdres2 }</td>
												<td class="align-middle">${found.foundPlace }</td>
												<c:choose>
													<c:when test="${not empty found.foundDe }">
														<td class="align-middle">${found.foundDe }</td>
													</c:when>
													<c:otherwise>
														<td class="align-middle">일정없음</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${not empty found.empNo }">
														<td class="align-middle">${found.empNm }</td>
													</c:when>
													<c:otherwise>
														<td class="align-middle">일정없음</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${empty found.foundDe }">
														<td class="align-middle"><button class="btn btn-primary btn-sm insertDe" data-bs-toggle="modal" data-bs-target="#foundAp_modal" data-no="${found.foundNo }">배정하기</button></td>
													</c:when>
													<c:otherwise>
														<td class="align-middle">배정완료</td>
													</c:otherwise>
												</c:choose>
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
						<form:form id="searchform" method="get" action="${cPath }/main/master/foundApproveList.do#foundApproveList">
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
				<div class="modal fade" id="foundAp_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">창업상담배정</h5>
							</div>
							<div id="list-body">
							<form class="faUpdateForm" method="get" action="${cPath}/main/master/foundApproveUpdate.do#foundApproveList">
								<table style="margin: 50px auto;">
									<tr>
										<td style="text-align: right; ">
											<input type="hidden" id="foundNo" name="foundNo" value="" required/>
											<div class="input-group">
												<input type="text" class="form-control" id="datepicker" name="foundDe"
													placeholder="날짜를 선택하세요." >
												<label
													class="input-group-text" for="datepicker">
													<i class="fa fa-calendar"></i>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<select class="form-select" name="empNo" required>
												<option value>직원을 선택하세요.</option>
												<c:forEach items="${emList }" var="em">	
												<option value=${em.empNo }>${em.empNm }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
								</table>
							</form>
							</div>
							<div class="modal-footer">
				    			<button type="button" class="btn btn-primary faSuccess">배정</button>
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
		<script>
			//달력
			$('#datepicker').datepicker({
		    	autoclose: true,
		    	startDate: new Date(),
		    	dateFormat: 'yy-mm-dd',
		    	beforeShowDay: function(date) {
		            var today = new Date();
		            if (date < today) {
		                return { classes: 'disabled', tooltip: '날짜 선택 불가능' }; // 회색으로 표시
		            } else {
		                return; // 기본 동작
		            }
		        }
		  	});
		</script>


	<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
		<!-- END btn-scroll-top -->

		<%-- approveModal.js--%>
		<script src="${cPath }/resources/js/app/master/foundApproveUpdate.js"></script>

