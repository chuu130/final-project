<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">Products</li>
		</ul>
		<h1 class="page-header mb-0">배송관리</h1>
	</div>
	<div class="ms-auto">
		<a href="#" class="btn btn-theme fw-semibold fs-13px"><i
			class="fa fa-plus fa-fw me-1"></i> 상품추가</a>
	</div>
</div>


<div class="card">
	<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
		<li class="nav-item me-2" role="presentation"><a href="#allTab"
			class="nav-link active px-2" data-bs-toggle="tab" id="all-tab"
			aria-controls="a1" aria-selected="true" role="tab">전체</a></li>
		<li class="nav-item me-2" role="presentation"><a href="#deliveryTab"
			class="nav-link px-2" data-bs-toggle="tab" id="delivery-tab"
			aria-controls="a1" aria-selected="true" role="tab">배송중</a></li>
		<li class="nav-item me-2" role="presentation"><a href="#completeTab"
			class="nav-link px-2" data-bs-toggle="tab" id="complete-tab"
			aria-controls="a1" aria-selected="true" role="tab">배송완료</a></li>
	</ul>
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="input-group flex-nowrap mb-4">
			
				<div class="flex-fill">
					<div class="input-group">
						<div
							class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
							<i class="fa fa-search opacity-5"></i>
						</div>
						<div>
						<input type="text" class="form-control ps-35px"
							placeholder="상품 검색">
						
						</div>
					</div>
				</div>
			</div>	


			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="pt-0 pb-2">배송ID</th>
							<th class="pt-0 pb-2">배송시작일자</th>
							<th class="pt-0 pb-2">배송완료예정일자</th>
							<th class="pt-0 pb-2">배송완료일자</th>
							<th class="pt-0 pb-2">주문인</th>
							<th class="pt-0 pb-2">배송지점</th>
							<th class="pt-0 pb-2">배송물건가격</th>
							<th class="pt-0 pb-2">배송현황</th>
							<th class="pt-0 pb-2">배송물건수</th>
						</tr>
					</thead>
					<tbody id="list-body">
						
						<c:forEach items="${deliveryList }" var="delivery">
							<c:url value="/main/master/prodDetail.do?prodId=${prod.prodId }" var="InvUrl" />
							<tr>
								<!-- 									<td class="w-10px align-middle"> -->
								<!-- 										<div class="form-check"> -->
								<!-- 											<input type="checkbox" class="form-check-input" -->
								<%-- 												id=${inv.prodId }> <label class="form-check-label" --%>
								<%-- 												for=${inv.prodId }></label> --%>
								<!-- 										</div> -->
								<!-- 									</td> -->
								<td class="align-middle">${delivery.orderDtlsId }
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<img alt="" -->
<!-- 											class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" -->
<%-- 											width="60" height="40" src="${delivery.orderDtlsId }"> --%>
<!-- 										<div class="ms-3"> -->
<!-- 											<a href="" -->
<!-- 												class="text-body text-decoration-none"></a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ delivery.dlvyBeginDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ delivery.dlvyPrearngeDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime2" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime2 }" />
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ delivery.dlvyEndDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime3" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime3 }" />
								</td>
								<td class="align-middle">${delivery.member.memNm }</td>
								<td class="align-middle">${delivery.dlvyAdres1 }</td>
								<td class="align-middle">${delivery.orderdt.orderProdAmount}</td>
								<td class="align-middle">${delivery.dlvySttus }</td>
								<td class="align-middle">${delivery.orderdt.cntProd }</td>
							</tr>
						</c:forEach>

					</tbody>




				</table>
				
				<div class="paging-area">${pagingHTML }</div>
				<form:form id="searchform" method="get" modelAttribute="condition">
					<form:input type="hidden" path="name" />
<%-- 					<form:input type="hidden" path="searchWord" /> --%>
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
		<div class="tab-pane fade" id="deliveryTab" role="tabpanel">
			<div class="input-group flex-nowrap mb-4">
			
				<div class="flex-fill">
					<div class="input-group">
						<div
							class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
							<i class="fa fa-search opacity-5"></i>
						</div>
						<div>
						<input type="text" class="form-control ps-35px"
							placeholder="상품 검색">
						
						</div>
					</div>
				</div>
			</div>	


			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="pt-0 pb-2">배송ID</th>
							<th class="pt-0 pb-2">배송시작일자</th>
							<th class="pt-0 pb-2">배송완료예정일자</th>
							<th class="pt-0 pb-2">배송완료일자</th>
							<th class="pt-0 pb-2">주문인</th>
							<th class="pt-0 pb-2">배송지점</th>
							<th class="pt-0 pb-2">배송물건가격</th>
							<th class="pt-0 pb-2">배송현황</th>
							<th class="pt-0 pb-2">배송물건수</th>
						</tr>
					</thead>
					<tbody id="list-body">
						
						<c:forEach items="${IndeliveryList }" var="inDelivery">
							<c:url value="/main/master/prodDetail.do?prodId=${prod.prodId }" var="InvUrl" />
							<tr>
								<!-- 									<td class="w-10px align-middle"> -->
								<!-- 										<div class="form-check"> -->
								<!-- 											<input type="checkbox" class="form-check-input" -->
								<%-- 												id=${inv.prodId }> <label class="form-check-label" --%>
								<%-- 												for=${inv.prodId }></label> --%>
								<!-- 										</div> -->
								<!-- 									</td> -->
								<td class="align-middle">${inDelivery.orderDtlsId }
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<img alt="" -->
<!-- 											class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" -->
<%-- 											width="60" height="40" src="${delivery.orderDtlsId }"> --%>
<!-- 										<div class="ms-3"> -->
<!-- 											<a href="" -->
<!-- 												class="text-body text-decoration-none"></a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ inDelivery.dlvyBeginDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ inDelivery.dlvyPrearngeDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime2" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime2 }" />
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ inDelivery.dlvyEndDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime3" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime3 }" />
								</td>
								<td class="align-middle">${inDelivery.member.memNm }</td>
								<td class="align-middle">${inDelivery.dlvyAdres1 }</td>
								<td class="align-middle">${inDelivery.orderdt.orderProdAmount}</td>
								<td class="align-middle">${inDelivery.dlvySttus }</td>
								<td class="align-middle">${inDelivery.orderdt.cntProd }</td>
							</tr>
						</c:forEach>

					</tbody>




				</table>
				
				<div class="paging-area">${pagingHTML }</div>
				<form:form id="searchform" method="get" modelAttribute="condition">
					<form:input type="hidden" path="name" />
<%-- 					<form:input type="hidden" path="searchWord" /> --%>
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
		<div class="tab-pane fade" id="completeTab" role="tabpanel">
			<div class="input-group flex-nowrap mb-4">
			
				<div class="flex-fill">
					<div class="input-group">
						<div
							class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
							<i class="fa fa-search opacity-5"></i>
						</div>
						<div>
						<input type="text" class="form-control ps-35px"
							placeholder="상품 검색">
						
						</div>
					</div>
				</div>
			</div>	


			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="pt-0 pb-2">배송ID</th>
							<th class="pt-0 pb-2">배송시작일자</th>
							<th class="pt-0 pb-2">배송완료예정일자</th>
							<th class="pt-0 pb-2">배송완료일자</th>
							<th class="pt-0 pb-2">주문인</th>
							<th class="pt-0 pb-2">배송지점</th>
							<th class="pt-0 pb-2">배송물건가격</th>
							<th class="pt-0 pb-2">배송현황</th>
							<th class="pt-0 pb-2">배송물건수</th>
						</tr>
					</thead>
					<tbody id="list-body">
						
						<c:forEach items="${deliveryCompleteList }" var="deliveryComplete">
							<c:url value="/main/master/prodDetail.do?prodId=${prod.prodId }" var="InvUrl" />
							<tr>
								<!-- 									<td class="w-10px align-middle"> -->
								<!-- 										<div class="form-check"> -->
								<!-- 											<input type="checkbox" class="form-check-input" -->
								<%-- 												id=${inv.prodId }> <label class="form-check-label" --%>
								<%-- 												for=${inv.prodId }></label> --%>
								<!-- 										</div> -->
								<!-- 									</td> -->
								<td class="align-middle">${deliveryComplete.orderDtlsId }
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<img alt="" -->
<!-- 											class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" -->
<%-- 											width="60" height="40" src="${delivery.orderDtlsId }"> --%>
<!-- 										<div class="ms-3"> -->
<!-- 											<a href="" -->
<!-- 												class="text-body text-decoration-none"></a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ deliveryComplete.dlvyBeginDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ deliveryComplete.dlvyPrearngeDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime2" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime2 }" />
								</td>
								<td class="align-middle">
									<fmt:parseDate value="${ deliveryComplete.dlvyEndDe }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime3" type="both" />
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime3 }" />
								</td>
								<td class="align-middle">${deliveryComplete.member.memNm }</td>
								<td class="align-middle">${deliveryComplete.dlvyAdres1 }</td>
								<td class="align-middle">${deliveryComplete.orderdt.orderProdAmount}</td>
								<td class="align-middle">${deliveryComplete.dlvySttus }</td>
								<td class="align-middle">${deliveryComplete.orderdt.cntProd }</td>
							</tr>
						</c:forEach>

					</tbody>




				</table>
				
				<div class="paging-area">${pagingHTML }</div>
				<form:form id="searchform" method="get" modelAttribute="condition">
					<form:input type="hidden" path="name" />
<%-- 					<form:input type="hidden" path="searchWord" /> --%>
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
	</div>




</div>
	
		
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath }/resources/js/app/master/adminInv.js"></script> --%>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/vendor.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/app.min.js" type="text/javascript"></script>
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
	data-cf-beacon="{&quot;rayId&quot;:&quot;8b2597067fe020e3&quot;,&quot;version&quot;:&quot;2024.7.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;4db8c6ef997743fda032d4f73cfeff63&quot;,&quot;serverTiming&quot;:{&quot;name&quot;:{&quot;cfL4&quot;:true}}}"
	crossorigin="anonymous"></script>
<script src="${cPath }/resources/js/app/utils/paging.js"></script>
