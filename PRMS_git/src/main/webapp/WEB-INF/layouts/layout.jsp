<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cPath" value="${pageContext.request.contextPath }"
	scope="application" />
	<c:set value="${franNm }" var="franNm" scope="session" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>㈜펫코노미 관리시스템</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${cPath}/resources/startbootstrap-agency-gh-pages/assets/petconomyicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<tiles:insertAttribute name="preScript" />


</head>

<body data-context-path="${cPath}">
	<c:choose>
		<c:when test="${not empty franProdList }">
			<div id="app" class="app app-sidebar-collapsed">
				<!-- ======= Header ======= -->
				<div id="header" class="app-header">
					<tiles:insertAttribute name="header" />
				</div>
				<!-- End Headr -->

				<!-- ======= Sidebar ======= -->
<!-- 				<aside id="sidebar" class="app-sidebar"> -->
<%-- 					<tiles:insertAttribute name="sidebar" /> --%>
<!-- 				</aside> -->
				<!-- End Sidebar-->

				<!-- ======= Main ======= -->
				<main id="main" class="main">
					<div id="content" class="app-content">
						<tiles:insertAttribute name="contentPage" />
					</div>

				</main>
				<!-- End #main -->

				<!-- ======= Footer ======= -->
				<!--   <footer id="footer" class="ms-footer m-t-30"> -->

				<%--     <tiles:insertAttribute name="footer" /> --%>

				<!--   </footer>-->
				<!--End Footer -->
				</div>
		</c:when>
		<c:otherwise>
			<div id="app" class="app">
				<!-- ======= Header ======= -->
				<div id="header" class="app-header">
					<tiles:insertAttribute name="header" />
				</div>
				<!-- End Headr -->

				<!-- ======= Sidebar ======= -->
				<aside id="sidebar" class="app-sidebar">
					<tiles:insertAttribute name="sidebar" />
				</aside>
				<!-- End Sidebar-->

				<!-- ======= Main ======= -->
				<main id="main" class="main">
					<div id="content" class="app-content">
						<tiles:insertAttribute name="contentPage" />
					</div>

				</main>
				<!-- End #main -->

				<!-- ======= Footer ======= -->
				<!--   <footer id="footer" class="ms-footer m-t-30"> -->

				<%--     <tiles:insertAttribute name="footer" /> --%>

				<!--   </footer>-->
				<!--End Footer -->
		</div>
		</c:otherwise>
	</c:choose>

	<tiles:insertAttribute name="postScript" />

</body>
</html>


