<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
<link href="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet">
<link href="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-fixedcolumns-bs5/css/fixedColumns.bootstrap5.min.css" rel="stylesheet">
<link href="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet">

<div class="d-flex align-items-center mb-3">
	<div>
		<h1 class="page-header mb-0">재고관리</h1>
	</div>
</div>
<div class="data-management" data-id="table">
	<div id="datatable_wrapper" class="dt-container dt-bootstrap5">
		<div id="" class="row mb-2">
			<div id="" class="col-7 col-md-6 d-flex justify-content-start">
				<div class="dt-search">
					<label for="dt-search-0">Search:</label><input type="search"
						class="form-control form-control-sm" id="dt-search-0"
						placeholder="" aria-controls="datatable">
				</div>
			</div>
			<div id="" class="col-5 col-md-6 text-end">
				<div class="dt-buttons btn-group flex-wrap">
					<button
						class="btn btn-secondary buttons-excel buttons-html5 btn-default fs-13px fw-semibold py-5px pe-3"
						tabindex="0" aria-controls="datatable" type="button">
						<span><i class="fa fa-download fa-fw me-1 text-theme"></i>
							Export Excel</span>
					</button>
				</div>
			</div>
		</div>
		<div id="" class="row">
			<div id="" class="col-sm-12">
				<div class="dt-scroll">
					<div class="dt-scroll-head"
						style="overflow: hidden; position: relative; border: 0px; width: 100%;">
						<div class="dt-scroll-headInner"
							style="box-sizing: content-box; width: 1500px; padding-right: 17px;">
							<table id="datatableDefault"
								class="table table-bordered table-xs w-100 text-nowrap mb-3 bg-component dataTable dtfc-scrolling-start dtfc-scrolling-left"
								style="margin-left: 0px; width: 1500px;">
								<thead style="">
									<tr role="row">
										<th
											class="no-sort dt-type-numeric dt-orderable-none dtfc-fixed-start dtfc-fixed-left"
											data-dt-column="0" rowspan="1" colspan="1" aria-label=""
											style="position: sticky; left: 0px;"><span
											class="dt-column-title"></span><span class="dt-column-order"></span></th>
										<th data-dt-column="1" rowspan="1" colspan="1"
											class="dt-type-numeric dt-orderable-asc dt-orderable-desc dt-ordering-asc dtfc-fixed-start dtfc-fixed-left"
											aria-sort="ascending"
											aria-label="No.: Activate to invert sorting" tabindex="0"
											style="position: sticky; left: 0px;"><span
											class="dt-column-title" role="button">No.</span><span
											class="dt-column-order"></span></th>
										<th data-dt-column="2" rowspan="1" colspan="1"
											class="dt-orderable-asc dt-orderable-desc dtfc-fixed-start dtfc-fixed-left"
											aria-label="Category: Activate to sort" tabindex="0"
											style="position: sticky; left: 0px;"><span
											class="dt-column-title" role="button">분류</span><span
											class="dt-column-order"></span></th>
										<th data-dt-column="3" rowspan="1" colspan="1"
											class="dt-orderable-asc dt-orderable-desc"
											aria-label="Item Name: Activate to sort" tabindex="0"><span
											class="dt-column-title" role="button">상품</span><span
											class="dt-column-order"></span></th>
										<th data-dt-column="4" rowspan="1" colspan="1"
											class="dt-type-numeric dt-orderable-asc dt-orderable-desc"
											aria-label="Status: Activate to sort" tabindex="0"><span
											class="dt-column-title" role="button">재고수량</span><span
											class="dt-column-order"></span></th>
										<th data-dt-column="5" rowspan="1" colspan="1"
											class="dt-type-numeric dt-orderable-asc dt-orderable-desc"
											aria-label="Stock: Activate to sort" tabindex="0"><span
											class="dt-column-title" role="button">입고단가</span><span
											class="dt-column-order"></span></th>
										<th data-dt-column="6" rowspan="1" colspan="1"
											class="dt-orderable-asc dt-orderable-desc"
											aria-label="Price: Activate to sort" tabindex="0"><span
											class="dt-column-title" role="button">협력업체</span><span
											class="dt-column-order"></span></th>

									</tr>
								</thead>
<!-- 								상단 width -->
								<colgroup>
									<col data-dt-column="0" style="width: 2%">
									<col data-dt-column="1" style="width: 1.97%">
									<col data-dt-column="2" style="width: 5%">
									<col data-dt-column="3" style="width: 30%">
									<col data-dt-column="4" style="width: 10%">
									<col data-dt-column="5" style="width: 10%">
									<col data-dt-column="6" style="width: 20%">

								</colgroup>
							</table>
						</div>
					</div>
					<div class="dt-scroll-body"
						style="position: relative; overflow: auto; width: 100%; max-height: 689px; height: 689px;">
						<table
							class="table table-bordered table-xs w-100 text-nowrap mb-3 bg-component dataTable dtfc-has-start dtfc-has-left dtfc-scrolling-start dtfc-scrolling-left"
							id="datatable" aria-describedby="datatable_info"
							style="width: 1500px;">
<!-- 							칼럼 width -->
							<colgroup>
								<col data-dt-column="0" style="width: 2%">
								<col data-dt-column="1" style="width: 2%">
								<col data-dt-column="2" style="width: 5%">
								<col data-dt-column="3" style="width: 30%">
								<col data-dt-column="4" style="width: 10%">
								<col data-dt-column="5" style="width: 10%">
								<col data-dt-column="6" style="width: 20%">

							</colgroup>

							<thead style="">
								<tr role="row">
									<th
										class="no-sort dt-type-numeric dt-orderable-none dtfc-fixed-start dtfc-fixed-left"
										data-dt-column="0" rowspan="1" colspan="1" aria-label=""
										style="position: sticky; left: 0px;"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title"></span><span
												class="dt-column-order"></span>
										</div></th>
									<th data-dt-column="1" rowspan="1" colspan="1"
										class="dt-type-numeric dt-orderable-asc dt-orderable-desc dt-ordering-asc dtfc-fixed-start dtfc-fixed-left"
										aria-sort="ascending"
										aria-label="No.: Activate to invert sorting"
										style="position: sticky; left: 0px;"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title" role="button">No.</span><span
												class="dt-column-order"></span>
										</div></th>
									<th data-dt-column="2" rowspan="1" colspan="1"
										class="dt-orderable-asc dt-orderable-desc dtfc-fixed-start dtfc-fixed-left"
										aria-label="Category: Activate to sort"
										style="position: sticky; left: 0px;"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title" role="button">분류</span><span
												class="dt-column-order"></span>
										</div></th>
									<th data-dt-column="3" rowspan="1" colspan="1"
										class="dt-orderable-asc dt-orderable-desc"
										aria-label="Item Name: Activate to sort"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title" role="button">상품</span><span
												class="dt-column-order"></span>
										</div></th>
									<th data-dt-column="4" rowspan="1" colspan="1"
										class="dt-type-numeric dt-orderable-asc dt-orderable-desc"
										aria-label="Status: Activate to sort"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title" role="button">재고수량</span><span
												class="dt-column-order"></span>
										</div></th>
									<th data-dt-column="5" rowspan="1" colspan="1"
										class="dt-type-numeric dt-orderable-asc dt-orderable-desc"
										aria-label="Stock: Activate to sort"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title" role="button">입고단가</span><span
												class="dt-column-order"></span>
										</div></th>
									<th data-dt-column="6" rowspan="1" colspan="1"
										class="dt-type-numeric dt-orderable-asc dt-orderable-desc"
										aria-label="Price: Activate to sort"><div
											class="dt-scroll-sizing">
											<span class="dt-column-title" role="button">협력업체</span><span
												class="dt-column-order"></span>
										</div></th>

								</tr>
							</thead>

							<tbody class="text-body">
							<c:forEach items="${adminInvProdList }" var="inv">
								<tr>
									<td class="dt-type-numeric dtfc-fixed-start dtfc-fixed-left"
										style="position: sticky; left: 0px;"><a
										data-bs-toggle="modal" data-bs-target="#modalDetail" data-id="${inv.prodId }"><i
											class="fa fa-search fa-fw"></i></a></td>
									<td
										class="dt-type-numeric dtfc-fixed-start dtfc-fixed-left sorting_1"
										style="position: sticky; left: 0px;">${inv.rnum}</td>
									<td class="dtfc-fixed-start dtfc-fixed-left"
										style="position: sticky; left: 0px;">${inv.cmmncode.cmmnCodeNm}</td>
									<td>${inv.admininvNm }</td>
									<td class="dt-type-numeric">${inv.admininvQy }</td>
									<td class="dt-type-numeric">${inv.partprod.partprodPc }</td>
									<td class="dtfc-fixed-left">${inv.partners.partnersCornm}</td>
								</tr>
						</c:forEach>

							</tbody>

						</table>
					</div>
					<div class="dtfc-top-blocker"
						style="top: 0px; right: 0px; height: 30.375px; width: 18px; display: block;"></div>
					<div class="dtfc-bottom-blocker"
						style="bottom: 0px; right: 0px; height: 30.375px; width: 18px; display: block;"></div>
				</div>
			</div>
		</div>
		<div id="" class="row">
			<div id="" class="col-sm-12 col-md-5 fs-12px">
				<div class="dt-info" aria-live="polite" id="datatable_info"
					role="status">Showing 1 to 30 of 30 entries</div>
			</div>
			<div id="" class="col-sm-12 col-md-7 fs-12px"></div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalDetail">
	<div class="modal-dialog" style="max-width: 600px">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상품 정보</h5>
				<button class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row gx-4 align-items-center">
					<div class="col-sm-5 mb-3 mb-sm-0">
						<div class="card bg-body">
							<div class="card-body p-3">
								<img alt="" src="assets/img/product/product-1.png"
									class="mw-100 d-block">
							</div>
						</div>
					</div>
					<div class="col-sm-7 py-1 fs-13px">
						<div class="row mb-10px">
							<div class="col-4 fw-bold">상품코드:</div>
							<div class="col-8 text-body">iPhone 14 Pro Max</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">상품이름:</div>
							<div class="col-8 text-body">Space Black</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">카테고리:</div>
							<div class="col-8 text-body">
								<span
									class="badge text-bg-theme py-6px px-2 fs-10px my-n1 fw-bold">PHONE</span>
							</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">입고단가:</div>
							<div class="col-8 text-body">$1,999</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">Cost:</div>
							<div class="col-8 text-body">$1,899</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">Profit:</div>
							<div class="col-8 text-success">$200</div>
						</div>
						<div class="row">
							<div class="col-4 fw-bold">Stock:</div>
							<div class="col-8 text-body">
								<input type="text" class="form-control form-control-sm w-100px" name="stock"
									value="20">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-bs-dismiss="modal"
					class="btn btn-default fs-13px fw-semibold w-100px">Cancel</a>
				<button id="save" type="submit" class="btn btn-theme fs-13px fw-semibold">Save
					&amp; Publish</button>
			</div>
		</div>
	</div>
</div>
<script src="${cPath}/resources/js/app/master/adminInv.js"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net/js/dataTables.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-bs5/js/dataTables.bootstrap5.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-buttons/js/dataTables.buttons.min.js"
	type="text/javascript"></script>
<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/jszip/dist/jszip.min.js"
	type="text/javascript"></script>
<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/pdfmake/build/pdfmake.min.js"
	type="text/javascript"></script>
<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/pdfmake/build/vfs_fonts.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-buttons/js/buttons.colVis.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-buttons/js/buttons.html5.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-buttons/js/buttons.print.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-fixedcolumns/js/dataTables.fixedColumns.min.js"
	type="text/javascript"></script>
<script
	src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/datatables.net-fixedcolumns-bs5/js/fixedColumns.bootstrap5.min.js"
	type="text/javascript"></script>
<script src="${cPath}/resources/Franchise/template_html/dist/assets/js/demo/page-data-management.demo.js"
	type="text/javascript"></script>
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-Y3Q0VGQKY3"
	type="text/javascript"></script>
<script type="text/javascript">
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-Y3Q0VGQKY3');
</script>
<script defer=""
	src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015"
	integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ=="
	data-cf-beacon="{&quot;rayId&quot;:&quot;8b25b952b8e8966e&quot;,&quot;version&quot;:&quot;2024.7.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;4db8c6ef997743fda032d4f73cfeff63&quot;,&quot;serverTiming&quot;:{&quot;name&quot;:{&quot;cfL4&quot;:true}}}"
	crossorigin="anonymous"></script>