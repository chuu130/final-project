<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
tr, td {
	text-align: center;
}
</style>
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/releaseList.do" var="releaseListUrl" />
			<li class="breadcrumb-item"><a href="${releaseListUrl }">본사재고관리</a></li>
			<li class="breadcrumb-item active">상품출고</li>
		</ul>
		<h1 class="page-header mb-0">상품출고목록</h1>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">


			<div class="table-responsive">
			<h5>상품출고목록</h5>
				<table class="table table-hover text-nowrap">
					<thead class="boardlist-head">
						<tr>
							<th class="order-border">상품이미지</th>
							<th class="order-border">상품이름</th>
							<th class="order-border">출고수량</th>
							<th class="order-border">발주신청날짜</th>
							<th class="order-border">출고단가</th>
							<th class="order-border">출고여부</th>
							<th class="order-border-top">출고처리</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty ReleaseList}">
						<c:forEach items="${ReleaseList }" var="rel">
							<tr style="height: 60px;">
								<td class="align-middle order-border-right">
								<img alt="" class="mw-100 mh-100 object-fit-cover rounded-1 my-n1"
											width="60" height="40" src="${rel.prod.partprodImage }"></td>
								<td style="text-align: left;" class="align-middle prodDetail order-border-right" data-bs-toggle="modal" data-bs-target="#modalDetail" data-order-no="${rel.orderdetailNo}">
								    ${rel.prod.partprodNm}
								</td>
								<td class="align-middle order-border-right">${rel.releaseQy }</td>
								<td class="align-middle order-border-right">${rel.releaseDe }</td>
								<td class="align-middle order-border-right">
									<fmt:formatNumber value="${rel.releasePc }" pattern="#,###"/>원
								</td>
								<c:choose>
								    <c:when test="${rel.releaseYn eq '출고완료'}">
								        <td class="py-1 align-middle order-border-right">
										<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
										<i class="fa fa-circle fs-9px fa-fw me-5px"></i>${rel.releaseYn}</span></td>
								        <td class="align-middle" style="color: green;">출고처리완료</td>
								    </c:when>
								    <c:otherwise>
								    	<td class="py-1 align-middle order-border-right">
										<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
										<i class="fa fa-circle fs-9px fa-fw me-5px"></i>${rel.releaseYn}</span></td>
								        <td class="align-middle">
								            <button type="button" class="btn btn-theme fw-semibold fs-13px relBtn" data-order-no="${rel.orderdetailNo}">출고</button>
								        </td>
								    </c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty ReleaseList}">
							<tr>
								<td colspan="7" class="align-middle" style="text-align: center;">발주신청내역이 존재하지않습니다.</td>
							</tr>
						</c:if>

					</tbody>
				</table>
			</div>
			<form id="searchform" method="get" action="${cPath }/main/master/releaseList.do">
				<input type="hidden" name="page" />
			</form>
			<div class="d-lg-flex align-items-center">
				<div
					class="me-lg-auto text-md-left text-center mt-2 mt-lg-0 mb-2 mb-lg-0">
				</div>
				<ul class="pagination mb-0 justify-content-center flex-wrap paging-area">
					${pagingHTML }
				</ul>
			</div>

<!-- 모달 상세 창 -->
<div class="modal fade" id="modalDetail">
	<div class="modal-dialog" style="max-width: 600px">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">출고 상품 상세</h5>
				<button class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body" id="modalBody">

			</div>
		</div>
	</div>
</div>


		</div>
	</div>
</div>

<script src="${cPath}/resources/js/app/utils/paging.js"></script>
<script src="${cPath}/resources/js/app/master/releaseDetail.js"></script>