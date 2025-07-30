<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
tr, td{
	text-align: center;
}
</style>

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/staffList" var="staffListurl" />
			<li class="breadcrumb-item"><a href="${staffListurl }">직원관리</a></li>
			<li class="breadcrumb-item active">직원목록</li>
		</ul>
		<h1 class="page-header mb-0">직원목록</h1>
	</div>
		<div class="ms-auto">
			<a href="${pageContext.request.contextPath }/main/franchisee/employeeinsertUI" class="btn btn-theme fw-semibold fs-13px"><i
				class="fa fa-plus fa-fw me-1"></i>직원등록</a>
		</div>
</div>

<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="pt-0 pb-2">직원번호</th>
							<th class="pt-0 pb-2">직원명</th>
							<th class="pt-0 pb-2">직원주소</th>
							<th class="pt-0 pb-2">직원월급</th>
							<th class="pt-0 pb-2">직원전화번호</th>
							<th class="pt-0 pb-2">직원퇴사여부</th>
							<th class="pt-0 pb-2">직원미용자격구분</th>
							<th class="pt-0 pb-2">직원이력서</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${staffList }" var="staff">
							<c:url value="/main/franchisee/${staff.empNo}/detail" var="staffUrl"/>
							<tr>
								<td class="align-middle">${staff.empNo }</td>
								<td class="align-middle">
									<a href="${staffUrl}">${staff.empNm}</a>
								</td>
								<td class="align-middle text-start">(${staff.empZip}) ${staff.empAdres1} ${staff.empAdres2}</td>
								<td class="align-middle text-end"><fmt:formatNumber value="${staff.empSalary}"/>원</td>
								<td class="align-middle">${staff.empTelno}</td>
								<c:choose>
									<c:when test="${staff.empLeaveAt eq '퇴사'}">
										<td class="align-middle" style="color: red;">${staff.empLeaveAt}</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle" style="color: green;">${staff.empLeaveAt}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${staff.empLicenseAt eq '자격X'}">
										<td class="align-middle" style="color: red;">${staff.empLicenseAt}</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle" style="color: green;">${staff.empLicenseAt}</td>
									</c:otherwise>
								</c:choose>
								<td class="align-middle">${staff.empResume}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

