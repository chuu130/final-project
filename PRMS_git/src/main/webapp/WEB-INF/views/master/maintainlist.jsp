<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
		<div class="d-flex align-items-center mb-3">
			<div>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Pages</a></li>
					<li class="breadcrumb-item active">관리비</li>
				</ul>
				<h1 class="page-header mb-0">관리비 미납여부</h1>
			</div>
		</div>
		<div class="card">
			<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
				<li class="nav-item me-2" role="presentation"><a href="#allTab"
					class="nav-link active px-2" data-bs-toggle="tab"
					aria-selected="true" role="tab">전체</a></li>
			</ul>
			<div class="tab-content p-4">
				<div class="tab-pane fade show active" id="allTab" role="tabpanel">


					<div class="table-responsive">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>관리번호</th>
									<th>가맹점명</th>
									<th>관리비 납부여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${maintainlist}" var="main">
								<c:forEach items="${main.franchiselist}" var="fran">

									<tr>
										<td class="align-middle">${main.maintNo }</td>
										<td class="align-middle">${fran.franchiseNm }</td>
										<c:choose>
											<c:when test="${main.maintAt eq '관리비 납부 완료'}">
												<td class="align-middle" style="color: green;">${main.maintAt }</td>
											</c:when>
											<c:otherwise>
												<td class="align-middle" style="color: red;">
													<c:url value="/main/master/${fran.franchiseId}/memoinsertpage" var="mainUrl" />
													<a href="${mainUrl}">${main.maintAt }</a>
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
</body>
