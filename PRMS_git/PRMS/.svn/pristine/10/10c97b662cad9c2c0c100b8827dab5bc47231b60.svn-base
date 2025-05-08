<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



	<!-- ================== BEGIN core-css ================== -->
	<link href="${pageContext.request.contextPath }/resources/Franchise/template_html/dist/assets/css/vendor.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/Franchise/template_html/dist/assets/css/app.min.css" rel="stylesheet">
	<!-- ================== END core-css ================== -->

	<!-- BEGIN 알림창 Swal -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<!-- END 알림창 Swal -->
	
	<!-- 로그인창 css -->
	<link href="${pageContext.request.contextPath }/resources/css/indexstyle/mainlogin.css" rel="stylesheet">

</head>
<body class='pace-top'>

	<!-- 아이디 찾기 모달 -->
	<div class="modal fade" id="idFind_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	       <form action="${pageContext.request.contextPath }/mainEmpFinding/id" method="POST" id="idSearchForm">
	      	<div class="modal-body">
	          <div class="mb-3">
	            <label for="empNm" class="col-form-label">이름</label>
	            <input type="text" class="form-control" id="empNm" name="empNm" required>
	          </div>
	          <div class="mb-3">
	            <label for="empTelno" class="col-form-label">전화번호</label>
	            <input type="text" class="form-control" id="empTelno" name="empTelno" placeholder="010-xxxx-xxxx" required>
	          </div>
		    </div>
	      	<div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="idFind_modal_idFind_btn">찾기</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="idFind_modal_idFind_closeBtn">닫기</button>
	      	</div>
	       </form>
	    </div>
	  </div>
	</div>

	<!-- 비밀번호 찾기 모달 -->
	<div class="modal fade" id="pwFind_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	       <form action="${pageContext.request.contextPath }/mainEmpFinding/pw" method="POST" id="pwSearchForm">
	      	<div class="modal-body">
	          <div class="mb-3">
	            <label for="empId" class="col-form-label">아이디</label>
	            <input type="text" class="form-control" id="empId" name="empId" required>
	          </div>
	          <div class="mb-3">
	            <label for="empEmail" class="col-form-label">이메일</label>
	            <input type="email" class="form-control" id="empEmail" name="empEmail" required>
	          </div>
		    </div>
	      	<div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="pwFind_modal_pwFind_btn">찾기</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="pwFind_modal_pwFind_closeBtn">닫기</button>
	      	</div>
	       </form>
	    </div>
	  </div>
	</div>


	<!-- BEGIN #app -->
	<div id="app" class="app app-full-height app-without-header">
		<!-- BEGIN login -->
		<div class="login" style="background: #fff4d52b;">
			<!-- BEGIN login-content -->
			<div class="login-content">
				<div class="main-log">
				<form action="" method="POST">
					<h1 class="text-center">로그인</h1>
					<div class="text-body text-opacity-50 text-center mb-4">
<!-- 						(주)펫코노미 관리시스템 -->
					</div>
					<div class="mb-3">
						<label class="form-label">아이디 <span class="text-danger">*</span></label>
						<input type="text" class="form-control form-control-lg fs-body" value="" name="empId" placeholder="">
					</div>
					<div class="mb-3">
						<div class="d-flex">
							<label class="form-label">비밀번호 <span class="text-danger">*</span></label>
						</div>
						<input type="password" class="form-control form-control-lg" name="empPassword" value="" placeholder="">
					</div>
					<button type="submit" class="btn btn-theme btn-lg d-block w-100 fw-semibold mb-3" id="loginBtn">로그인</button>
				</form>
				<div class="text-end text-body text-opacity-50">
					<label><button type="button" class="ms-auto text-body text-decoration-none text-opacity-80" style="border:none;background: transparent;" id="idBtn" data-bs-toggle="modal" data-bs-target="#idFind_modal" data-bs-whatever="@mdo">아이디 찾기</button></label>
					<label><button type="button" class="ms-auto text-body text-decoration-none text-opacity-80" style="border:none;background: transparent;" id="pwBtn" data-bs-toggle="modal" data-bs-target="#pwFind_modal" data-bs-whatever="@mdo">비밀번호 찾기</button></label>
				</div>
				<div class="text-end text-body text-opacity-50 mt-3">
					<button type="button" class="btn btn-outline-pink" id="autoFranLoginBtn">가맹점주로그인</button>
					<button type="button" class="btn btn-outline-success" id="autoMasterLoginBtn">총괄관리자로그인</button>
				</div>
			</div>
			<!-- END login-content -->
			</div>
		</div>
		<!-- END login -->
	</div>
	<!-- END #app -->



	<!-- ================== BEGIN core-js ================== -->
	<script src="${pageContext.request.contextPath }/resources/Franchise/template_html/dist/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/Franchise/template_html/dist/assets/js/app.min.js"></script>
	<!-- ================== END core-js ================== -->


	<!-- 빠른 로그인 처리를위한 스크립트코드  -->
	<script>
		let empIdTag = document.querySelectorAll("input[name=empId]")[1];
		let empPasswordTag = document.querySelector("input[name=empPassword]");
		let loginBtn = document.querySelector("#loginBtn");

		document.querySelector("#autoFranLoginBtn").addEventListener('click', (e) => {
			empIdTag.value = "fran1";
			empPasswordTag.value ="java";
			loginBtn.click();
		});

		document.querySelector("#autoMasterLoginBtn").addEventListener('click', (e) => {
			empIdTag.value = "admin";
			empPasswordTag.value ="java";
			loginBtn.click();
		});
	</script>


	<script src="${pageContext.request.contextPath }/resources/js/app/main/empInfoFinding.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/app/utils/fetchUtils.js"></script>
</body>
</html>
