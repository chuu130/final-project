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
			<li class="breadcrumb-item active">본사재고관리</li>
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/main/master/partprodList.do">상품입고</a></li>
		</ul>
		<h1 class="page-header mb-0">상품입고목록</h1>
	</div>
	<div class="ms-auto">
		<a
			href="${pageContext.request.contextPath }/main/master/adminInvList.do"
			class="btn btn-theme fw-semibold fs-13px">재고현황</a>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">



			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>상품이미지</th>
							<th style="text-align: left;">상품이름</th>
							<th>상품분류명</th>
							<th>상품입고단가</th>
							<th>상품입고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${PartProdList }" var="prod">
							<tr>
								<td class="align-middle"><img alt=""
									class="mw-100 mh-100 object-fit-cover rounded-1 my-n1"
									width="60" height="40" src="${prod.partprodImage }"></td>
								<td class="align-middle" style="text-align: left;">${prod.partprodNm }</td>
								<td class="align-middle">${prod.partprodSe }</td>
								<td class="align-middle text-end">
									<fmt:formatNumber value="${prod.partprodPc}" pattern="#,###"/>원
								</td>
								<td class="align-middle">
									<button type="button" style="text-align: left;"
										data-bs-toggle="modal" data-bs-target="#modalDetail"
										class="btn btn-theme fw-semibold fs-13px Detail"
										data-prod-id="${prod.prodId}">상품 입고</button>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<form id="searchform" method="get"
				action="${cPath }/main/master/partprodList.do">
				<input type="hidden" name="page" />
			</form>
			<div class="d-lg-flex align-items-center">
				<div
					class="me-lg-auto text-md-left text-center mt-2 mt-lg-0 mb-2 mb-lg-0">
				</div>
				<ul
					class="pagination mb-0 justify-content-center flex-wrap paging-area">
					${pagingHTML }
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 모달 상세 창 -->
<div class="modal fade" id="modalDetail">
	<div class="modal-dialog" style="max-width: 600px">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">입고 상품 상세</h5>
				<button class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body" id="modalBody">

			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-default fs-13px fw-semibold w-100px" id="ingoBtn">입고</button>
				<a href="#" data-bs-dismiss="modal"
					class="btn btn-default fs-13px fw-semibold w-100px">취소</a>
			</div>
		</div>
	</div>
</div>

<script src="${cPath}/resources/js/app/master/warehousingDetail.js"></script>
<script src="${cPath}/resources/js/app/utils/paging.js"></script>