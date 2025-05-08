<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="d-flex align-items-center mb-3">
<div>
<ul class="breadcrumb">
<c:url value="/main/master/franchise" var="franList" />
<li class="breadcrumb-item"><a href="${franList }">가맹점목록</a></li>
<li class="breadcrumb-item active">가맹점상세정보</li>
</ul>
<h1 class="page-header mb-0">가맹점 상세정보</h1>
</div>
<div class="ms-auto">
	<a href="<c:url value='/main/master/franchise/${franchise.franchiseId }/update' />" class="btn btn-theme fs-13px fw-semibold"><i class="far fa-lg fa-fw me-2 fa-edit"></i>정보 수정</a>
</div>
</div>
<div class="card shadow p-3 mb-5 rounded" id="card-border">
<div class="tab-content p-4">
<div class="table-responsive">
<table class="table">

		<tr>
			<th>가맹점번호</th>
			<td>${franchise.franchiseId }</td>
		</tr>
		<tr>
			<th>가맹점지역</th>
			<td>${franchise.cmmnCodeNm }</td>
		</tr>
		<tr>
			<th>가맹점이름</th>
			<td>${franchise.franchiseNm }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${franchise.franchiseTel }</td>
		</tr>
		<tr>
			<th>점주명</th>
			<td>${franchise.empNm }</td>
		</tr>
		<tr>
			<th>점주이메일</th>
			<td>${franchise.franchiseEmail }</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${franchise.franchiseZip }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${franchise.franchiseAdd1 }</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${franchise.franchiseAdd2 }</td>
		</tr>
		<tr>
			<th>호텔방개수</th>
			<td>${franchise.franchiseHotelCo }</td>
		</tr>

</table>
</div>
</div>
</div>
<c:if test="${not empty message }">
	<script>
	 	Swal.fire('${message}', '', 'success');
	</script>
	<c:remove var="message" scope="session"/>
</c:if>