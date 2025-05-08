<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/staffList" var="staffList" />
			<li class="breadcrumb-item"><a href="${staffList }">직원관리</a></li>
			<li class="breadcrumb-item active">직원상세</li>
		</ul>
		<h1 class="page-header mb-0">직원상세</h1>
	</div>
</div>

<!-- Sample section Start -->
<section class="ms-register padding-tb-30">
	<div class="container">
		<div class="card">
			<div class="tab-content p-4">
				<div class="tab-pane fade show active" id="allTab" role="tabpanel">
					<div class="table-responsive">
						<form method="post"
							action="${pageContext.request.contextPath }/main/franchisee/staffUpdate">
							<table class="table text-nowrap">
								<tr>
									<th class="align-middle">직원번호</th>
									<td><input type="text" id="empNo" name="empNo" class="form-control"
										value="${empVO.empNo}" readonly></td>
								</tr>
								<tr>
									<th class="align-middle">직원명</th>
									<td><input type="text" id="empNm" name="empNm" class="form-control"
										value="${empVO.empNm}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원월급</th>
									<td><input type="number" id="empSalary" name="empSalary" class="form-control"
										value="${empVO.empSalary}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원우편번호</th>
									<td><input type="text" id="empZip" name="empZip" class="form-control"
										value="${empVO.empZip}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원주소</th>
									<td><input type="text" id="empAdres1" name="empAdres1" class="form-control"
										value="${empVO.empAdres1}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원상세주소</th>
									<td><input type="text" id="empAdres2" name="empAdres2" class="form-control"
										value="${empVO.empAdres2}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원전화번호</th>
									<td><input type="text" id="empTelno" name="empTelno" class="form-control"
										value="${empVO.empTelno}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원이메일</th>
									<td><input type="text" id="empEmail" name="empEmail" class="form-control"
										value="${empVO.empEmail}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원생년월일</th>
									<td><input type="datetime" id="empBir" name="empBir" class="form-control"
										value="${empVO.empBir}"></td>
								</tr>
								<tr>
									<th class="align-middle">직원입사일</th>
									<td><input type="datetime" id="empDe" name="empDe" class="form-control"
										value="${empVO.empDe}"></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<button class="btn btn-theme fw-semibold fs-13px" type="submit">정보 수정</button>
										<button class="btn btn-danger fw-semibold fs-13px" type="button" id="delBtn">퇴사 처리</button>
									</td>
								</tr>
							</table>
							<input type="hidden" id="empId" name="empId"
								value="${empVO.empId}" /> <input type="hidden" id="empPassword"
								name="empPassword" value="${empVO.empPassword}" /> <input
								type="hidden" id="empCl" name="empCl" value="${empVO.empCl}" />
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Sample section End -->



<script type="text/javascript" defer="defer">
	document.addEventListener("DOMContentLoaded", ()=>{
		let delBtn = document.getElementById("delBtn");
		console.log("DOMContentLoaded delBtn : ", delBtn);

		let empNo = document.getElementById("empNo");
		console.log("DOMContentLoaded memNo : ", empNo);

		delBtn.addEventListener("click", function(){
			$.ajax({
				type:"POST",
				url:`${cPath}/main/franchisee/staffDelete`,
				data: {
					"empNo" : empNo.value
				},
				success : function(res){
	            	alert("직원 퇴사 처리 성공", res);
	            	location.href = `${cPath}/main/franchisee/staffList`;
	           },
	           error : function(error){
	            	alert("직원 퇴사 처리 실패");
	           }
			});
		});
	});
</script>

