<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

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

<!-- <link href="https://cdn.datatables.net/buttons/3.1.1/css/buttons.bootstrap5.css" rel="stylesheet"> -->
<!-- <link href="https://cdn.datatables.net/2.1.4/css/dataTables.bootstrap5.css" rel="stylesheet"> -->
<!-- <link href="https://cdn.datatables.net/responsive/2.2.3/css/dataTables.responsive.css" rel="stylesheet"> -->
<link href="${cPath }/resources/Franchise/template_html_startup/dist/assets/plugins/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="${cPath }/resources/Franchise/template_html_startup/dist/assets/plugins/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet">
<link href="${cPath }/resources/Franchise/template_html_startup/dist/assets/plugins/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet">
<!-- chart -->
<script
	src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/chart.js/dist/chart.umd.js" /></script>
<script
	src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/apexcharts/dist/apexcharts.min.js" /></script>
