<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
th, td {
    text-align: center;
}
</style>
<div class="d-flex mb-3">
	<div>
	    <ul class="breadcrumb">
	        <c:url value="/main/master/blackList.do" var="blackListUrl" />
	        <li class="breadcrumb-item"><a href="${memberListUrl }">회원관리</a></li>
	        <li class="breadcrumb-item active">블랙리스트회원</li>
	    </ul>
	    <h1 class="page-header mb-0">블랙리스트회원</h1>
	</div>
</div>
<div class="card p-3 mb-5">
<div class="tab-content p-4">
<div class="table-responsive">
<h4>블랙리스트 목록</h4>
	<table class="table table-hover text-nowrap">
		<thead class="boardlist-head">
			<tr>
				<th class="order-border">블랙리스트ID</th>
				<th class="order-border">회원NO</th>
				<th class="order-border">블랙리스트 사유</th>
				<th class="order-border">블랙리스트 등록날짜</th>
				<th class="order-border-top">블랙리트스 종료날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${BlackList}" var="black">
				<tr>
					<td class="align-middle order-border">${black.blacklistId}</td>
					<td class="align-middle order-border">${black.memNo}</td>
					<td class="align-middle order-border">${black.blacklistResn}</td>
					<td class="align-middle order-border">${black.blacklistIn}</td>
					<td class="align-middle">${black.blacklistDe}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>
</div>