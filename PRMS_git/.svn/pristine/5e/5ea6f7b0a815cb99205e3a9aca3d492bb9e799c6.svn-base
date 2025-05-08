<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
tr, td {
	text-align: center;
}

td {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 150px;
}

</style>
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/counselATList#counselATList" var="counselATListUrl" />
			<li class="breadcrumb-item"><a href="${counselATListUrl }">창업상담관리</a></li>
			<li class="breadcrumb-item active">창업상담승인</li>
		</ul>
		<h1 class="page-header mb-0">창업상담승인</h1>
	</div>
</div>
<div class="card">
	<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
		<li class="nav-item me-2 sub-me-title" role="presentation"><a href="#allTab"
			class="nav-link active px-2" data-bs-toggle="tab"
			aria-selected="true" role="tab">상담목록</a></li>
	</ul>
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">


			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead class="boardlist-head">
						<tr>
							<th>상담사이름</th>
							<th>면담자이름</th>
							<th>창업상담내용</th>
							<th>상담통과여부</th>
							<th>창업상담통과처리</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty foundList }">
							<c:forEach items="${foundList }" var="found">
								<tr>
									<td class="align-middle">${found.employee.empNm }</td>
									<td class="align-middle">${found.foundNm }</td>
									<td class="align-middle" style="text-align: left;">${found.foundCn }</td>
									<c:choose>
									    <c:when test="${found.foundSideSe eq '상담통과'}">
									        <td class="py-1 align-middle">
											<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
											<i class="fa fa-circle fs-9px fa-fw me-5px"></i>${found.foundSideSe}</span></td>
									        <td class="align-middle" style="color: green;">창업상담통과</td>
									    </c:when>
									    <c:otherwise>
									    	<td class="py-1 align-middle">
											<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
											<i class="fa fa-circle fs-9px fa-fw me-5px"></i>${found.foundSideSe}</span></td>
									        <td class="align-middle">
									            <button type="button" class="btn btn-theme fw-semibold fs-13px counselBtn" data-found-no="${found.foundNo}">상담통과</button>
									        </td>
									    </c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty foundList }">
							<tr>
								<td class="align-middle" colspan="5">창업상담승인내역이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>

				</table>
			</div>

<!-- 모달 상세 창 -->
<!-- <div class="modal fade" id="modalDetail"> -->
<!-- 	<div class="modal-dialog" style="max-width: 600px"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<h5 class="modal-title">출고 상품 상세</h5> -->
<!-- 				<button class="btn-close" data-bs-dismiss="modal"></button> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body" id="modalBody"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


		</div>
	</div>
</div>
<script src="${cPath}/resources/js/app/master/counselAt.js"></script>