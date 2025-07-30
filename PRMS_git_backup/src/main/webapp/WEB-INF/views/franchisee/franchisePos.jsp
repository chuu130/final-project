<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- 폰트 -->
<!-- <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- jQuery & payment -->
<script src="${cPath }/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- ================== BEGIN core-css ================== -->
	<link href="${cPath }/resources/Franchise/template_html/dist/assets/css/vendor.min.css" rel="stylesheet">
	<link href="${cPath }/resources/Franchise/template_html/dist/assets/css/app.min.css" rel="stylesheet">
	<link href="${cPath }/resources/css/franstyle/fran.css" rel="stylesheet">
	<!-- 폰트설정 포함 -->
	<link rel="stylesheet" href="${cPath }/resources/css/franstyle/cssmodify.css" />
	<!-- ================== END core-css ================== -->

	<!-- ================== BEGIN page-css ================== -->
	<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet">
	<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	<!-- ================== END page-css ================== -->


	<!-- ================== BEGIN page-js ================== -->
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/jvectormap-next/jquery-jvectormap.min.js"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/jvectormap-content/world-mill.js"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/apexcharts/dist/apexcharts.min.js"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/moment/min/moment.min.js"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/Franchise/template_html/dist/assets/js/demo/dashboard.demo.js"></script> --%>
<!-- ================== END page-js ================== -->

<!-- BEGIN 알림창 Swal -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- END 알림창 Swal -->

<!-- BEGIN summernote 에디터 -->
<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.min.js"></script>
<!-- END summernote 에디터 -->

<!-- BEGIN select-picker -->
<link href="${cPath }/resources/Franchise/template_html_startup/dist/assets/plugins/select-picker/dist/picker.min.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html_startup/dist/assets/plugins/select-picker/dist/picker.min.js"></script>
<!-- END select-picker -->


<!-- 켈린더 -->
	<!-- ================== BEGIN page-js ================== -->
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/moment/moment.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/@fullcalendar/core/index.global.min.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/@fullcalendar/daygrid/index.global.min.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/@fullcalendar/timegrid/index.global.min.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/@fullcalendar/list/index.global.min.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/@fullcalendar/bootstrap/index.global.min.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/plugins/@fullcalendar/interaction/index.global.min.js"></script>
	<script src="${cPath}/resources/Franchise/template_html/dist/assets/js/demo/calendar.demo2.js"></script>
	<!-- ================== END page-js ================== -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body data-context-path="${cPath}">


<c:set var="franProd" value="${franProdList }" />
<div id="content" class="app-content p-0" style="margin-left: 11rem;">

	<div class="pos pos-with-menu pos-with-sidebar" id="pos">
		<div class="pos-container">

			<div class="pos-menu">

				<div class="logo">
					<a href="index.html">
						<div class="logo-img">
							<i class="fa fa-cash-register"></i>
						</div>
						<div class="logo-text">포스기</div>
					</a>
				</div>


				<div class="nav-container">
					<div class="h-100 ps" data-scrollbar="true" data-skip-mobile="true"
						data-init="true">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active shadow" style="border:none;" href="#"
								data-filter="all"> <i class="fa fa-fw fa-bars"></i> 전체
							</a></li>
							<li class="nav-item"><a class="nav-link shadow" style="border:none;"  href="#"
								data-filter="사료"> <i class="fa fa-fw fa-cookie-bite"></i>
									사료 / 간식
							</a></li>
							<li class="nav-item"><a class="nav-link shadow" style="border:none;"  href="#"
								data-filter="옷"> <i class="fa fa-fw fa-shirt"></i>
									옷
							</a></li>
							<li class="nav-item"><a class="nav-link shadow" style="border:none;"  href="#"
								data-filter="하네스"> <i class="fa fa-fw fa-dog"></i>
									하네스 / 목줄
							</a></li>
							<li class="nav-item"><a class="nav-link shadow" style="border:none;"  href="#"
								data-filter="샴푸"> <i class="fa fa-fw fa-pump-soap"></i>
									샴푸
							</a></li>
							<li class="nav-item"><a class="nav-link shadow" style="border:none;"  href="#"
								data-filter="장난감" >  <i class="fa fa-fw fa-bone"></i>
								
									장난감 / 운동
							</a></li>
							<li class="nav-item"><a class="nav-link shadow" style="border:none;"  href="#"
								data-filter="케이지"> <i class="fa fa-fw fa-suitcase-rolling"></i>
									캐리어/ 케이지
							</a></li>
						</ul>
						<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
							<div class="ps__thumb-x" tabindex="0"
								style="left: 0px; width: 0px;"></div>
						</div>
						<div class="ps__rail-y" style="top: 0px; right: 0px;">
							<div class="ps__thumb-y" tabindex="0"
								style="top: 0px; height: 0px;"></div>
						</div>
					</div>
				</div>

			</div>


			<div class="pos-content">
				<div class="pos-content-container h-100">
					<div class="row gx-4">

						<c:forEach items="${franProdList }" var="franProd">
							<div class="col-xxl-3 col-xl-4 col-lg-6 col-md-4 col-sm-6 pb-4" id="cmmn"
								data-type="${franProd.cmmncode.cmmnCodeNm }">
								<a href="#" class="pos-product shadow" style="border:none;" data-id="${franProd.franprodId }"  onclick="return false">
									<div class="img"
										style="background-image: url(${franProd.franprodImage}); "></div>
									<div class="info">
										<div class="title">${franProd.franprodNm }</div>
										<div class="desc">${franProd.franprodDc }</div>
										<fmt:formatNumber value="${franProd.franprodPc  }" pattern="#,###" var="franprodPc" />
										<div class="price">${franprodPc }원</div>
									</div>
								</a>
							</div>

						</c:forEach>

					</div>
				</div>
			</div>


			<div class="pos-sidebar" id="pos-sidebar" style="border: none;">
				<div class="h-100 d-flex flex-column p-0 shadow">

					<div class="pos-sidebar-header">
						<div class="back-btn">
							<button type="button"
								data-toggle-class="pos-mobile-sidebar-toggled"
								data-toggle-target="#pos" class="btn">
								<i class="fa fa-chevron-left"></i>
							</button>
						</div>
						<div class="icon">
							<i class="fa fa-plate-wheat"></i>
						</div>
						<div class="title">상품주문</div>
					</div>


					<div class="pos-sidebar-nav small">
						<div class="h6 mb-1" style="border-bottom: 1px solid #dee2e6; padding-bottom: 10px; text-align: center;"> 주문 목록</div>
					</div>


					<div class="pos-sidebar-body tab-content ps ps--active-y"
						data-scrollbar="true" data-height="100%" data-init="true"
						style="height: 100%;">

						<div class="tab-pane fade h-100 show active" id="newOrderTab"
							role="tabpanel">





						</div>


						<div class="tab-pane fade h-100" id="orderHistoryTab"
							role="tabpanel">
							<div
								class="h-100 d-flex align-items-center justify-content-center text-center p-20">
								<div>
									<div class="mb-3 mt-n5">
										<svg width="6em" height="6em" viewBox="0 0 16 16"
											class="text-gray-300" fill="currentColor"
											xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd"
												d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z"></path>
<path
												d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z"></path>
</svg>
									</div>
									<h5>No order history found</h5>
								</div>
							</div>
						</div>

<!-- 						<div class="ps__rail-x" style="left: 0px; bottom: -193px;"> -->
<!-- 							<div class="ps__thumb-x" tabindex="0" -->
<!-- 								style="left: 0px; width: 0px;"></div> -->
<!-- 						</div> -->
<!-- 						<div class="ps__rail-y" -->
<!-- 							style="top: 193px; height: 594px; right: 0px;"> -->
<!-- 							<div class="ps__thumb-y" tabindex="0" -->
<!-- 								style="top: 146px; height: 448px;"></div> -->
<!-- 						</div> -->
					</div>


					<div class="pos-sidebar-footer">
<!-- 						<div class="d-flex align-items-center mb-2"> -->
<!-- 							<div>Subtotal</div> -->
<!-- 							<div class="flex-1 text-end h6 mb-0">$30.98</div> -->
<!-- 						</div> -->
<!-- 						<div class="d-flex align-items-center"> -->
<!-- 							<div>Taxes (6%)</div> -->
<!-- 							<div class="flex-1 text-end h6 mb-0">$2.12</div> -->
<!-- 						</div> -->
						<div class="d-flex align-items-center mb-2">
							<div>Total</div>
							<div class="flex-1 text-end h4 mb-0 total" >0원</div>
							<input type="hidden" id="total" value="" />
						</div>
						<div class="mt-3">
							<div class="d-flex">
								<a href="#"
									class="btn btn-theme flex-fill d-flex align-items-center justify-content-center payment">
									<span> <i
										class="fa fa-cash-register fa-lg my-10px d-block"></i> <span
										class="small fw-semibold">결제하기</span>
								</span>
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>


	<a href="#" class="pos-mobile-sidebar-toggler"
		data-toggle-class="pos-mobile-sidebar-toggled"
		data-toggle-target="#pos"> <i class="fa fa-shopping-bag"></i> <span
		class="badge">3</span>
	</a>

</div>

<div class="modal modal-pos fade" id="modalPosItem" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content border-0 modal-body tab-content ps ps--active-y" data-scrollbar="true" data-height="100%" data-init="true"
						style="height: 100%;">
			<a href="#" data-bs-dismiss="modal"
				class="btn-close position-absolute top-0 end-0 m-4"></a>
			<div class="modal-pos-product">
				<div class="modal-pos-product-info">
					<div class="fs-4 fw-semibold"><c:out value="${franProd}" />   </div>
					<div class="text-body text-opacity-50 mb-2"><c:out value="${franProd }" /> </div>
					<div class="fs-3 fw-bold mb-3">$10.99</div>
					<hr class="opacity-1">


				</div>
			</div>
			<div class="row">
				<div class="col-4">
					<a href="#" class="btn btn-default fw-semibold mb-0 d-block py-3"
							data-bs-dismiss="modal">취소</a>
					</div>
					<div class="col-4">

						<a href="#"
							class="btn btn-theme fw-semibold d-flex justify-content-center align-items-center py-3 m-0">결제하기<i class="fa fa-plus ms-2 my-n3"></i>
						</a>
					</div>
			</div>

		</div>
	</div>
</div>
<!-- ================== BEGIN core-js ================== -->
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/vendor.min.js"></script>
<script src="${cPath }/resources/Franchise/template_html/dist/assets/js/app.min.js"></script>
<!-- ================== END core-js ================== -->

<!-- BEGIN paging -->
<script src="${cPath }/resources/js/app/utils/paging.js"></script>
<!-- END paging -->
<script src="${cPath }/resources/js/app/franchise/franPos.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>
</body>
</html>

