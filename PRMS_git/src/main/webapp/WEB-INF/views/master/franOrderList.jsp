<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
		.modal-content {
		  min-width: 900px;
		  max-width: 900px;
		  max-height: 861px;
		  overflow-y: auto;
		}

		.modal-dialog {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
	</style>

	<!-- 발주상세 모달 -->
	<div class="modal fade" id="orderDtModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="exampleModalLabel">발주서</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="d-flex justify-content-between">
		      	<div>
		      		<h5 id="orderDt">발주일</h5>
		      		<h6 id="orderNumber">발주번호</h6>
		      	</div>
	      	</div>
	      	<hr>
	        <h5 id="franchiseNm">가맹점명</h5>
	        <span style="display:none" id="franEmpId"></span>
			<ul>
				<li id="franchiseTel">전화번호</li>
				<li id="franchiseAddr">(우편번호)주소 상세주소</li>
				<li id="franchiseEmail">이메일</li>
			</ul>
			<hr>
	        <h5>발주상품</h5>
	        <table class="table">
				<thead>
					<tr>
						<th class="text-center">상품이미지</th>
						<th class="text-center">상품명</th>
						<th class="text-center">발주수량</th>
						<th class="text-center">발주단가</th>
						<th class="text-center">발주가격</th>
					</tr>
				</thead>
				<tbody id="orderProdDt">

				</tbody>
	        </table>
	        <h4>발주총액 : <span id="totalAmount"></span></h4>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-danger" id="rejectBtn" style="display:none;">반려</button>
	        <button type="button" class="btn ms-btn-2 btn-theme" id="sendBtn" style="display:none;">발송</button>
	        <button type="button" class="btn ms-btn-2 btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>


	<div class="d-flex mb-3">
		<div>
			<ul class="breadcrumb">
				<c:url value="/main/master/franOrder/form" var="franOrderUrl" />
				<li class="breadcrumb-item"><a href="${franOrderUrl }">주문거래관리</a></li>
				<li class="breadcrumb-item active">가맹점발주내역</li>
			</ul>
			<h1 class="page-header mb-0">가맹점발주내역</h1>
		</div>
	</div>

	<div class="col-xl-12 pb-3">
			<div class="card mb-3">
				<div class="card-body">
					<div style="display: flex;margin: 1rem;">
						<div class="d-flex align-items-center" style="width:23%;margin-left: 1rem;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #e4f1ff !important;">
									<i class="bi bi-calendar" style="color: #4b4bff;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">승인대기</h6>
								<div class="text-muted" id="waitInv">0건</div>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:23%;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #dff5d4 !important;">
									<i class="bi bi-calendar-check" style="color: #009300;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">승인완료</h6>
								<div class="text-muted" id="successInv">0건</div>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:23%;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #ebebeb !important;">
									<i class="bi bi-calendar-minus" style="color: #484848;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">발주취소</h6>
								<div class="text-muted" id="cancelInv">0건</div>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:23%;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #ffe4e4 !important;">
									<i class="bi bi-calendar-x" style="color: #ff3c3c;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">반려</h6>
								<div class="text-muted" id="rejectInv">0건</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>


<!-- 	<div id="" class="row mb-2"> -->
<!-- 		<div id="" class="col-7 col-md-6 d-flex justify-content-start"> -->
<!-- 		</div> -->
<!-- 		<div id="" class="col-5 col-md-6 text-end"> -->
<!-- 			<div class="dt-buttons btn-group flex-wrap"> -->
<!-- 				<div class="dt-search d-flex"> -->
<!-- 					<div class="input-group flex-nowrap mb-4"> -->
<!-- 						<div class="flex-fill"> -->
<!-- 							<div class="input-group"> -->
<!-- 								<div -->
<!-- 									class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1"> -->
<!-- 									<i class="fa fa-search opacity-5"></i> -->
<!-- 								</div> -->
<!-- 								<div> -->
<!-- 								<input type="text" class="form-control ps-35px" id="searchData" -->
<!-- 									placeholder="발주상품/가맹점검색"> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


	<div class="card">
		<div class="d-flex justify-content-between">
			<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link active px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">승인대기</a>
				</li>
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">승인완료</a>
				</li>
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">발주취소</a>
				</li>
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">반려</a>
				</li>
			</ul>
<!-- 			<h4 class="m-3">총건수 : <span id="totalCount" class="text-primary">0</span>개</h4> -->
					<div class="input-group flex-nowrap mb-4" style="width: 20%;margin: 1rem 1rem 0 0 !important;">
						<div class="flex-fill">
							<div class="input-group">
								<div
									class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
									<i class="fa fa-search opacity-5"></i>
								</div>
								<div>
								<input type="text" class="form-control ps-35px" id="searchData"
									placeholder="발주상품/가맹점검색">
								</div>
							</div>
						</div>
					</div>
		</div>
		<div class="tab-content p-4">
			<table class="table table-hover">
				<thead>
					<tr class="text-center align-middle">
						<th class="order-border">발주번호</th>
						<th class="order-border">발주상품</th>
						<th class="order-border">발주총액</th>
						<th class="order-border">가맹점</th>
						<th class="order-border">발주상태</th>
						<th class="order-border-top">발주신청일</th>
					</tr>
				</thead>

				<tbody id="orderList">

				</tbody>
			</table>
		</div>
	</div>


	<ul class="pagination mt-3 justify-content-end flex-wrap Bpaging-area">

	</ul>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="${cPath }/resources/js/app/master/franOrderList.js"></script>




