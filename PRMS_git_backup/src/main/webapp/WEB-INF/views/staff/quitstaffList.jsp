<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
tr, td{
	text-align: center;
}
</style>

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/quitstaffList" var="quitstaffList" />
			<li class="breadcrumb-item"><a href="${quitstaffList }">직원관리</a></li>
			<li class="breadcrumb-item active">퇴사한 직원목록</li>
		</ul>
		<h1 class="page-header mb-0">퇴사한 직원목록</h1>
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
						<c:forEach items="${QuitStaffList }" var="qstaff">
							<tr>
								<td class="align-middle">${qstaff.empNo }</td>
								<td class="align-middle">${qstaff.empNm}</td>
								<td class="align-middle text-start" style="padding-left: 1rem;">(${qstaff.empZip}) ${qstaff.empAdres1} ${qstaff.empAdres2}</td>
								<td class="align-middle text-end"><fmt:formatNumber value="${qstaff.empSalary}" />원</td>
								<td class="align-middle">${qstaff.empTelno}</td>
								<c:choose>
									<c:when test="${qstaff.empLeaveAt eq '퇴사'}">
										<td class="align-middle" style="color: red;">${qstaff.empLeaveAt}</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle" style="color: green;">${qstaff.empLeaveAt}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${qstaff.empLicenseAt eq '자격X'}">
										<td class="align-middle" style="color: red;">${qstaff.empLicenseAt}</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle" style="color: green;">${qstaff.empLicenseAt}</td>
									</c:otherwise>
								</c:choose>
								<td class="align-middle">${qstaff.empResume}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

