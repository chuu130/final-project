<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="${cPath}/main/master/franchiseeList">매장관리</a></li>
			<li class="breadcrumb-item active">가맹점폐업관리</li>
		</ul>
		<h1 class="page-header mb-0">가맹점폐업관리</h1>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="table-responsive">
					<table class="table table-hover text-nowrap text-center">
						<thead>
							<tr>
								<th>가맹점번호</th>
								<th>가맹점명</th>
								<th>가맹점주소</th>
								<th>가맹점주명</th>
								<th>가맹점주연락처</th>
								<th>가맹점 폐업</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${franchiseList }" var="close">
								<tr class="text-center">
									<td class="align-middle">${close.franchiseId}</td>
									<td class="align-middle">${close.franchiseNm}</td>
									<td class="align-middle text-start">(${close.franchiseZip})
										${close.franchiseAdd1} ${close.franchiseAdd2}</td>
									<td class="align-middle">${close.employee.empNm}</td>
									<td class="align-middle">${close.employee.empTelno}</td>
									<td class="align-middle">
										<button type="button" class="btn btn-theme fw-semibold fs-13px closeBtn" data-franchise-id="${close.franchiseId}">폐업 처리</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</div>
	</div>
</div>

<script src="${cPath}/resources/js/app/master/franchiseClose.js"></script>