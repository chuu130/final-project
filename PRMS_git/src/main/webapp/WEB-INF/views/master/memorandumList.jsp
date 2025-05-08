<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
tr, td{
	text-align: center;
}
</style>
		<div class="d-flex align-items-center mb-3">
			<div>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Pages</a></li>
					<li class="breadcrumb-item active">공문발송</li>
				</ul>
				<h1 class="page-header mb-0">공문발송관리</h1>
			</div>
			<div class="ms-auto">
				<a href="${pageContext.request.contextPath }/main/master/memoinsertpage.do" class="btn btn-theme fw-semibold fs-13px"><i
					class="fa fa-plus fa-fw me-1"></i>공문등록</a>
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
									<th>공문번호</th>
									<th>공문제목</th>
									<th>가맹점명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memorandumList }" var="memo">
									<c:forEach items="${memo.franchiseList}" var="fran">
										<c:url value="/main/master/memo/${memo.memoranNo }" var="memoUrl" />
										<tr>
											<td class="w-10px align-middle" style="text-align: center;">
												<a href="${memoUrl}">${memo.memoranNo }</a>
											</td>
											<td class="align-middle">${memo.memoranNm }</td>
											<td class="align-middle">${fran.franchiseNm }</td>
										</tr>
									</c:forEach>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
