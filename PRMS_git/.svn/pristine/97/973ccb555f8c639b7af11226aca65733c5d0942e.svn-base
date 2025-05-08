<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cPath" value="${pageContext.request.contextPath }"
	scope="application" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

<title>반려동물 1등 쇼핑몰, 멍냥몰</title>
<meta name="keywords"
	content="Bootstrap 5.x, 펫코노미, 멍냥몰, 강아지 사료, 고양이 사료, 반려동물 간식, 반려동물 하우스, 반려동물 유모차, 반려동물 하네스, 반려동물 옷, 반려동물 케이지, 배변패드">
<meta name="description" content="Multipurpose eCommerce HTML Template">
<meta name="author" content="ashishmaraviya">

<tiles:insertAttribute name="preScript" />
<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketModify.css" />
</head>
<c:set var="wishCnt" value="${wishCnt }" scope="session" />
<c:set var="cartList" value="${cartList }" scope="session" />
<c:set var="cartCount" value="${cartCount }" scope="session" />
<body data-context-path="${cPath}">
	<!-- Loader -->
	<div id="ms-overlay">
		<div class="loader"></div>
	</div>

	<!-- ======= Header ======= -->
	<header class="ms-header">
		<tiles:insertAttribute name="header" />
	</header>
	<!-- End Headr -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar">
		<tiles:insertAttribute name="sidebar" />
	</aside>
	<!-- End Sidebar-->

	<!-- ======= Main ======= -->
	<main id="main" class="main">
		<tiles:insertAttribute name="contentPage" />
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer m-t-30">

		<tiles:insertAttribute name="footer" />

	</footer>
	<!--End Footer -->

	<tiles:insertAttribute name="postScript" />

</body>
</html>


