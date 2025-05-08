<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/staffList" var="staffList" />
			<li class="breadcrumb-item"><a href="${staffList }">직원관리</a></li>
			<li class="breadcrumb-item active">직원등록</li>
		</ul>
		<h1 class="page-header mb-0">직원등록</h1>
	</div>
</div>


<div class="card" style="width: 70%">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="table-responsive">
				<security:authentication property="principal" var="principal"/>
				<form method="post" action="${cPath }/main/franchisee/${principal.username}/employeeinsert">
					<table class="table text-nowrap">
						<tr>
							<th class="pt-0 pb-2">직원아이디</th>
							<td class="align-middle"><input type="text" class="form-control" id="empId" name="empId" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원이름</th>
							<td class="align-middle"><input type="text" class="form-control" id="empNm" name="empNm" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원월급</th>
							<td class="align-middle"><input type="number" class="form-control" id="emp Salary" name="empSalary" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원우편번호</th>
							<td class="align-middle"><input type="text" class="form-control" id="empZip" name="empZip" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원주소</th>
							<td class="align-middle"><input type="text" class="form-control" id="empAdres1" name="empAdres1" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원상세주소</th>
							<td class="align-middle"><input type="text" class="form-control" id="empAdres2" name="empAdres2" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원이메일</th>
							<td class="align-middle"><input type="text" class="form-control" id="empEmail" name="empEmail" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원전화번호</th>
							<td class="align-middle"><input type="text" class="form-control" id="empTelno" name="empTelno" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원생일</th>
							<td class="align-middle"><input type="datetime" class="form-control" id="empBir" name="empBir" style="width: 70%"></td>
						</tr>
						<tr>
							<th class="pt-0 pb-2">직원입사일</th>
							<td class="align-middle"><input type="datetime" class="form-control" id="empDe" name="empDe" style="width: 70%"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button class="btn btn-theme fw-semibold fs-13px" type="submit">등록하기</button>
<!-- 								<button class="btn btn-theme fw-semibold fs-13px" type="button" id="delBtn">등록취소</button> -->
							</td>
						</tr>
					</table>
					<input type="hidden" id="empPassword" name="empPassword" value="java">
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	var delBtn = document.querySelector("#delBtn");

	delBtn.addEventListener("click", function(){
		location.href = "${cPath }/main/franchisee/staffList";
	})
</script>
