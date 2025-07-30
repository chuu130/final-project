<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set value="${prodTop5List }" var="prodTop" />
<div class="d-flex mb-3">
    <div>
        <ul class="breadcrumb">
            <c:url value="/main/master/salesProd" var="salesProd" />
            <li class="breadcrumb-item"><a href="${salesProd }">매출관리</a></li>
            <li class="breadcrumb-item active">상품별매출</li>
        </ul>
        <h1 class="page-header mb-0">상품별 판매매출</h1>
    </div>
</div>

<div class="card p-3 mb-5" style="display: flex;flex-direction: row;">

	<div class="col-xl-6 col-lg-12" style="border-right: solid 1.5px #ebebeb;">
		<div class="card-body" >
			<h4 style="font-weight: 500;margin-bottom: 30px;">Top 5 상품</h4>
			<div>
			<div class="d-flex align-items-center" style="margin-bottom: 20px;">
				<i class="fas fa-circle" style="color: rgba(255, 99, 132, 0.2);font-size: x-large;"></i>
				<div class="flex-1 px-3">
					<h6 class="mb-0 fw-semibold d-flex align-items-center">${prodTop[0].prodNm }</h6>
				</div>
				<fmt:formatNumber value="${prodTop[0].prodTotal  }" pattern="#,###" var="prodTotal0" />
				<div><span>${prodTotal0 }원</span></div>
			</div>
			<div class="d-flex align-items-center" style="margin-bottom: 20px;">
				<i class="fas fa-circle" style="color: rgba(54, 162, 235, 0.2);font-size: x-large;"></i>
				<div class="flex-1 px-3">
					<h6 class="mb-0 fw-semibold d-flex align-items-center">${prodTop[1].prodNm }</h6>
				</div>
				<fmt:formatNumber value="${prodTop[1].prodTotal  }" pattern="#,###" var="prodTotal1" />
				<div><span>${prodTotal1 }원</span></div>
			</div>
			<div class="d-flex align-items-center" style="margin-bottom: 20px;">
				<i class="fas fa-circle" style="color: rgba(75, 192, 192, 0.2);font-size: x-large;"></i>
				<div class="flex-1 px-3">
					<h6 class="mb-0 fw-semibold d-flex align-items-center">${prodTop[2].prodNm }</h6>
				</div>
				<fmt:formatNumber value="${prodTop[2].prodTotal  }" pattern="#,###" var="prodTotal2" />
				<div><span>${prodTotal2 }원</span></div>
			</div>
			<div class="d-flex align-items-center" style="margin-bottom: 20px;">
				<i class="fas fa-circle" style="color: rgba(153, 102, 255, 0.2);font-size: x-large;"></i>
				<div class="flex-1 px-3">
					<h6 class="mb-0 fw-semibold d-flex align-items-center">${prodTop[3].prodNm }</h6>
				</div>
				<fmt:formatNumber value="${prodTop[3].prodTotal  }" pattern="#,###" var="prodTotal3" />
				<div><span>${prodTotal3 }원</span></div>
			</div>
			<div class="d-flex align-items-center" style="margin-bottom: 20px;">
				<i class="fas fa-circle" style="color: rgba(255, 204, 182, 0.2); font-size: x-large;"></i>
				<div class="flex-1 px-3">
					<h6 class="mb-0 fw-semibold d-flex align-items-center">${prodTop[4].prodNm }</h6>
				</div>
				<fmt:formatNumber value="${prodTop[4].prodTotal  }" pattern="#,###" var="prodTotal4" />
				<div><span>${prodTotal4 }원</span></div>
			</div>
			</div>
		</div>
	</div>
    <div class="col-xl-6 col-lg-12">
            <div class="card-body" style="padding-left: 30px;">
            	<h4 style="font-weight: 500;">상품별 매출 차트</h4>
                <div class="d-flex" style="height:300px;">
<%--                     <canvas id="barChart" style="width: 100%;height:100%;"></canvas> --%>
					<canvas id="doughnutChart" style="max-height: 250px;"></canvas>
                </div>
            </div>
    </div>
</div>
<%-- <c:set var="sell" value="${selling }"/> --%>
<%-- <c:set var="exp" value="${expense }"/> --%>
<div class="card p-3 mb-5">
    <div class="tab-content p-4">
	<h3 style="font-weight: 500;">상품별 매출 자료</h3>
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="myTable">
                <thead>
                    <tr>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>판매수량</th>
                        <th>매출액</th>
                        <th>매출원가</th>
                        <th>순이익</th>
                    </tr>
                </thead>
                <tbody id="text-middle">
                	<c:forEach items="${prodSalesList }" var="prodSale">
	                    <tr>
	<%--                         <td><fmt:formatNumber value="${sell[i].selngAmount }"/>원</td> --%>
	                        <td>${prodSale.prodNm }</td>
	                        <td>${prodSale.cmmnCodeNm }</td>
	                        <td>${prodSale.prodCnt }개</td>
	                        <fmt:formatNumber value="${prodSale.prodTotal }" pattern="#,###" var="prodTotal" />
	                        <td>${prodTotal }원</td>
	                        <fmt:formatNumber value="${prodSale.storeTotalPc }" pattern="#,###" var="storeTotalPc" />
	                        <td>${storeTotalPc }원</td>
	                        <fmt:formatNumber value="${prodSale.prodTotal - prodSale.storeTotalPc  }" pattern="#,###" var="income" />
	                        <td>${income }원</td>
	                    </tr>
                	
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:if test="${not empty message }">
    <script>
        Swal.fire('<c:out value="${message}" escapeXml="true"/>', '', 'success');
    </script>
    <c:remove var="message" scope="session" />
</c:if>

<script>
$(document).ready(function() {
	var prodTop5ListArr = new Array();
	<c:forEach items="${prodTop5List}" var="prodTop" >
		prodTop5ListArr.push({
			prodNm : "${prodTop.prodNm}"
			,prodTotal : "${prodTop.prodTotal}"
		});
	</c:forEach>
	var ctx1 = document.getElementById('doughnutChart')
		.getContext('2d');
	var doughnutChart = new Chart(ctx1, {
		type : 'doughnut',
		data : {
// 			labels : [ '상품', '미용예약', '호텔예약' ],
			datasets : [ {
				data : [ prodTop5ListArr[0].prodTotal, prodTop5ListArr[1].prodTotal, prodTop5ListArr[2].prodTotal, prodTop5ListArr[3].prodTotal, prodTop5ListArr[4].prodTotal ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 204, 182, 0.2)'],
				borderColor : [ 'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 204, 182, 1)'],
				borderWidth : 1
			} ]
		},
		options : {
			responsive : true,
			width : 200, // 캔버스 너비 설정
			height : 200
		// 캔버스 높이 설정
		}
	});
	$('#myTable').DataTable({
//	 	let table = new DataTable('#myTable')({
//	 		search:{
//	 			return: true
//	 		},
//	 		info : true,
//	 		responsive: true,
			dom: "<'row mb-3'<'col-md-4 mb-3 mb-md-0'l><'col-md-8 text-right'<'d-flex justify-content-end'fB>>>t<'row align-items-center mt-3'<'mr-auto col-md-6 mb-3 mb-md-0'i><'mb-0 col-md-6'p>>",
			paging: false,
		    scrollY: 600,
//	 	    select: true,
//	 		processing: true,
//	 	    serverSide: true,
		    language: { //언어 설정
//	             paginate: {
//	                 previous: "이전",
//	                 next:"다음"
//	             },
	            zeroRecords: "검색 결과가 없습니다.", //검색 결과 레코드가 없을 경우 표시할 텍스트
	            search:"검색:"
	        },
	        buttons: [
	            { extend: 'print', className: 'btn btn-default' },
	            { extend: 'csv', className: 'btn btn-default' }
	          ],

//	 		ajax : {
//	 			'url' : 'dataTables',
//	 			'type' : 'POST',
//	 			'dataSrc' : function(res){
//	 				var data = res

//	 				for(let i=0; i<data.length; i++){
//	 					data[i].listIndex = i+1
//	 				}

//	 				return data;
//	 			},
//	 		},
//	 		columns: [
//	 			{title : '번호', data: 'listIndex'},
//	 			{data: "prodId"},
//	 			{data: "cmmnCodeNm"},
//	 			{data: "admininvNm"},
//	 			{data: "admininvQy"},
//	 			{data: "partprodPc"},
//	 			{data: "partnersCornm"}
//	 		]

		});
});
</script>
