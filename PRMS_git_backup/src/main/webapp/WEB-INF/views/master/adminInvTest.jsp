<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.mouse {
	  cursor : pointer;
	}
	.mouse:hover{
		outline: 2px solid var(--bs-border-color);
   		outline-offset: -2px;
	}
</style>

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
		<c:url value="/main/master/adminInvList.do" var="adminInvListUrl" />
		<li class="breadcrumb-item"><a href="${adminInvListUrl }">본사재고관리</a></li>
		<li class="breadcrumb-item active">재고현황</li>
		</ul>
		<h1 class="page-header mb-0">재고현황</h1>
	</div>
	<div class="ms-auto">
		<c:url value="/main/master/partprodList.do#adminInvList" var="partprodListUrl" />
		<a href="${partprodListUrl }" class="btn btn-theme fs-13px fw-semibold"><i class="fa fa-plus fa-fw me-1"></i> 상품입고</a>
	</div>
</div>

<div class="card p-3 mb-5">
		<div class="table-responsive">
			<c:choose>
				<c:when test="${empty name }">
				<button class="btn btn-outline-default dropdown-toggle" id="dropdownMenuButton1"
					type="button" data-bs-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">상품 구분 &nbsp;</button>
				</c:when>
				<c:otherwise>
				<button class="btn btn-outline-default dropdown-toggle" id="dropdownMenuButton1"
					type="button" data-bs-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">${name } &nbsp;</button>

				</c:otherwise>

			</c:choose>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" >
					<a class="dropdown-item" href="#" data-value="전체">전체</a>
					<a class="dropdown-item" href="#" data-value="사료">사료</a>
					<a class="dropdown-item" href="#" data-value="간식">간식</a>
					<a class="dropdown-item" href="#" data-value="장난감">장난감</a>
					<a class="dropdown-item" href="#" data-value="하네스">하네스</a>
					<a class="dropdown-item" href="#" data-value="배변패드">배변패드</a>
					<a class="dropdown-item" href="#" data-value="케이지">케이지</a>
				</div>
			<table id="myTable" class="table table-striped" style="width:100%">

			        <thead>

			            <tr>
			            <th
										class="no-sort dt-type-numeric dt-orderable-none dtfc-fixed-start dtfc-fixed-left order-border-le"
										data-dt-column="0" rowspan="1" colspan="1" aria-label=""
										style="position: sticky; left: 0px; "><div
											class="dt-scroll-sizing">
											<span class="dt-column-title"></span><span
												class="dt-column-order"></span>
										</div></th>
			                <th class="order-border">상품ID</th>
			                <th class="order-border">분류</th>
			                <th class="order-border">상품</th>
			                <th class="order-border">재고수량</th>
			                <th class="order-border">입고 단가</th>
			                <th class="order-border">판매 단가</th>
			            </tr>
			        </thead>
			        <tbody id="list-body">
			        <c:forEach items="${adminInvProdList }" var="inv">
			       	 	<tr>
			       	 		<td class="dt-type-numeric dtfc-fixed-start dtfc-fixed-left mouse order-border-side"
										style="position: sticky; padding-left: 0px; "><a style="padding : 5px;"
										data-bs-toggle="modal" data-bs-target="#modalDetail" data-id="${inv.prodId }"><i
											class="fa fa-search fa-fw"></i></a></td>
			                <td class="order-border-right">${inv.prodId}</td>
			                <td class="order-border-right">${inv.cmmnCodeNm }</td>
			              	<td class="order-border-right">${inv.admininvNm}</td>
			                <td class="order-border-right">${inv.admininvQy}</td>
			                <fmt:formatNumber value="${inv.partprodPc }" pattern="#,###" var="partprodPc"/>
			                <td class="order-border-right">${partprodPc}</td>
			                <fmt:formatNumber value="${inv.prodSlePc }" pattern="#,###" var="prodSlePc"/>
			                <td class="order-border-right">${prodSlePc}</td>
			            </tr>
			        </c:forEach>
<!-- 			           	<td></td> -->


			        </tbody>
			</table>
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
					class="btn btn-default fs-13px fw-semibold w-100px">취소</a>
				<button id="save" type="submit" class="btn btn-theme fs-13px fw-semibold">저장
					 &amp;  등록</button>
			</div>
		</div>
	</div>
</div>


<!-- <script src="https://code.jquery.com/jquery-3.7.1.js"></script>      -->

<%-- <script src="${cPath }/resources/js/app/master/adminInvData.js"> --%>

<!-- </script>      -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="${cPath}/resources/js/app/master/adminInv.js"></script>
<script type="text/javascript">
$(document).ready(function(){

// 	let table = new DataTable('#myTable');

	$('#myTable').DataTable({
// 	let table = new DataTable('#myTable')({
// 		search:{
// 			return: true
// 		},
// 		info : true,
// 		responsive: true,
		dom: "<'row mb-3'<'col-md-4 mb-3 mb-md-0'l><'col-md-8 text-right'<'d-flex justify-content-end'fB>>>t<'row align-items-center mt-3'<'mr-auto col-md-6 mb-3 mb-md-0'i><'mb-0 col-md-6'p>>",
		paging: false,
	    scrollY: 800,
// 	    select: true,
// 		processing: true,
// 	    serverSide: true,
	    language: { //언어 설정
//             paginate: {
//                 previous: "이전",
//                 next:"다음"
//             },
            zeroRecords: "검색 결과가 없습니다.", //검색 결과 레코드가 없을 경우 표시할 텍스트
            search:"검색:"
        },
        buttons: [
            { extend: 'print', className: 'btn btn-default' },
            { extend: 'csv', className: 'btn btn-default' }
          ],

// 		ajax : {
// 			'url' : 'dataTables',
// 			'type' : 'POST',
// 			'dataSrc' : function(res){
// 				var data = res

// 				for(let i=0; i<data.length; i++){
// 					data[i].listIndex = i+1
// 				}

// 				return data;
// 			},
// 		},
// 		columns: [
// 			{title : '번호', data: 'listIndex'},
// 			{data: "prodId"},
// 			{data: "cmmnCodeNm"},
// 			{data: "admininvNm"},
// 			{data: "admininvQy"},
// 			{data: "partprodPc"},
// 			{data: "partnersCornm"}
// 		]

	});

// 	 $('#myInput').on('keyup', function () {
// 	     table.search(this.value).draw();
// 	 });


});
</script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/vendor.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/app.min.js" type="text/javascript"></script>
