<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<style>
		.modal-content {
		  min-width: 1024px;
/* 		  min-height: 861px; */
		  max-width: 1024px;
		  max-height: 861px;
		  overflow-y: auto;
		}

		.modal-dialog {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}

	</style>

	<div class="d-flex mb-3">
	    <div>
	        <ul class="breadcrumb">
	            <c:url value="/main/master/marketOrder/form" var="marketOrderForm" />
	            <li class="breadcrumb-item"><a href="${marketOrderForm }">주문거래관리</a></li>
	            <li class="breadcrumb-item active">온라인 주문내역</li>
	        </ul>
	        <h1 class="page-header mb-0">온라인 주문내역</h1>
	    </div>
	</div>

	<!-- 주문상세 모달 -->
	<div class="modal fade" id="orderDtModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="exampleModalLabel">주문서</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<h5 id="orderDt">날짜</h5>
	      	<h6 id="orderNumber">주문번호</h6>
	      	<hr>
	        <h5 id="memNm">회원명</h5>
			<ul>
				<li id="memTelno">전화번호</li>
				<li id="deliveryLi">(우편번호)주소 상세주소</li>
			</ul>
			<hr>
	        <h5>주문상품</h5>
	        <table class="table">
				<thead>
					<tr>
						<th class="text-center">상품이미지</th>
						<th class="text-center">상품명</th>
						<th class="text-center">상품구매수량</th>
						<th class="text-center">구매가격</th>
					</tr>
				</thead>
				<tbody id="orderProdDt">

				</tbody>
	        </table>
			<hr>
	      	<h5>결제 정보</h5>
	        <table class="table table-borderless">
	        		<tbody id="orderPayDt">

	        		</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-theme ms-btn-2" id="sendBtn" style="display:none;">발송</button>
	        <button type="button" class="btn btn-secondary ms-btn-2" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
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
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">입금확인</h6>
								<div class="text-muted" id="waitOrder">0건</div>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:23%;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #dff5d4 !important;">
									<i class="bi bi-calendar-check" style="color: #009300;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">배송중</h6>
								<div class="text-muted" id="delivering">0건</div>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:23%;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #ebebeb !important;">
									<i class="bi bi-calendar-minus" style="color: #484848;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">배송완료</h6>
								<div class="text-muted" id="successDelivery">0건</div>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:23%;">
							<div>
								<div class="w-40px h-40px fs-20px my-n1 rounded-pill d-flex align-items-center justify-content-center bg-theme-subtle text-theme" style="background-color: #ffe4e4 !important;">
									<i class="bi bi-calendar-x" style="color: #ff3c3c;"></i>
								</div>
							</div>
							<div class="flex-1 px-3">
								<h6 class="mb-0 fw-semibold d-flex align-items-center" style="font-size: medium;">취소완료</h6>
								<div class="text-muted" id="cancelOrder">0건</div>
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
<!-- 									placeholder="상품/회원검색"> -->
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
					aria-controls="a1" aria-selected="true" role="tab">입금확인</a>
				</li>
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">배송중</a>
				</li>
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">배송완료</a>
				</li>
				<li class="nav-item me-2" role="presentation">
					<a href="#allTab"
					class="nav-link px-2" data-bs-toggle="tab" id="all-tab"
					aria-controls="a1" aria-selected="true" role="tab">취소완료</a>
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
									placeholder="상품/회원검색">
								</div>
							</div>
						</div>
					</div>
		</div>
		<div class="tab-content p-4">
			<table class="table table-hover">
				<thead>
					<tr class="text-center align-middle">
						<th class="order-border">주문번호</th>
						<th class="order-border">구매상품</th>
						<th class="order-border">결제금액</th>
						<th class="order-border">회원아이디</th>
						<th class="order-border">주문날짜</th>
						<th class="order-border-top">주문상태</th>
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
	<script src="${cPath }/resources/js/app/master/marketOrderList.js"></script>