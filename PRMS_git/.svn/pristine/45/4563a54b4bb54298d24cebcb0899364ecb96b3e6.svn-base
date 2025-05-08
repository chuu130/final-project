<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>


<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">Products</li>
		</ul>
		<h1 class="page-header mb-0">상품조회</h1>
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
	</ul>
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="input-group flex-nowrap mb-4 drop">
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
					<a class="dropdown-item" href="adminProdList.do" data-value="">전체</a>
					<a class="dropdown-item" href="#" data-value="사료">사료</a> 
					<a class="dropdown-item" href="#" data-value="간식">간식</a> 
					<a class="dropdown-item" href="#" data-value="장난감">장난감</a> 
					<a class="dropdown-item" href="#" data-value="하네스">하네스</a> 
					<a class="dropdown-item" href="#" data-value="배변패드">배변패드</a> 
					<a class="dropdown-item" href="#" data-value="케이지">케이지</a>
				</div>
				<div class="flex-fill">
					<div class="input-group">
						<div
							class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
							<i class="fa fa-search opacity-5"></i>
						</div>
						<div id="searchUI">
							<form>
								<input type="text" class="form-control ps-35px" placeholder="상품 검색" id="searchWord" name="searchWord">
								<input type="hidden" id="searchType" name="searchType" value="search">
								<input type="hidden" id="name" class="name" value="${name }"  />
							</form>
						
						</div>
					</div>
				</div>
			</div>


			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="pt-0 pb-2">상품</th>
							<th class="pt-0 pb-2">상품가격</th>
							<th class="pt-0 pb-2">종류</th>
							<th class="pt-0 pb-2">   </th>
						</tr>
					</thead>
					<tbody id="list-body">
						<c:forEach items="${adminProdList }" var="prod">
							<c:url value="/main/master/prodDetail.do?prodId=${prod.prodId }" var="InvUrl" />
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<img alt=""
											class="mw-100 mh-100 object-fit-cover rounded-1 my-n1"
											width="60" height="40" src="${prod.prodImage }">
										<div class="ms-3">
											<a href="${InvUrl }"
												class="text-body text-decoration-none">${prod.prodSleNm }</a>
										</div>
									</div>
								</td>
								<td class="align-middle">${prod.prodSlePc}</td>
								<td class="align-middle">${prod.cmmncode.cmmnCodeNm}</td>
							</tr>
						</c:forEach>

					</tbody>




				</table>
				
				<div class="paging-area">${pagingHTML }</div>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${empty menu }"> --%>
<%-- 						<form:form id="searchform" method="get" modelAttribute="condition"> --%>
<%-- 							<form:input type="hidden" path="name" class="name" value=""  /> --%>
		<%-- 					<form:input type="hidden" path="searchWord" /> --%>
<!-- 							<input type="hidden" name="page" /> -->
<%-- 						</form:form> --%>
					
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
						<form:form id="searchform" method="get" action="${cPath }/main/master/adminProdList.do" modelAttribute="condition"> 
							<form:input type="hidden" path="name" class="name" value="${name }"  />
							<form:input type="hidden" path="searchWord" value="${simpleCondition.searchWord}"/>
							<input type="hidden" name="page" />
						</form:form>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
			</div>
		</div>
	</div>
</div>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath }/resources/js/app/master/adminInv.js"></script> --%>
<%-- <script src="${cPath }/resources/js/paging.js"></script> --%>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/vendor.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/app.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/js/app/master/adminProdList.js"></script>
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
