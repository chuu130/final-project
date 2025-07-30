<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/hotelroom" var="hotelroom" />
			<li class="breadcrumb-item"><a href="${hotelroom }">호텔관리</a></li>
			<li class="breadcrumb-item active">호텔방 목록</li>
		</ul>
		<h1 class="page-header mb-0">호텔방 목록</h1>
	</div>
	<div class="ms-auto">
		<c:url value="/main/franchisee/hotelroom/insert#hotelroom" var="createHotelroom" />
		<a href="${createHotelroom }" class="btn btn-theme fs-13px fw-semibold"><i class="fa fa-plus fa-fw me-1"></i> 호텔방 추가</a>
	</div>
</div>

<div class="card p-3 mb-5">
<div class="tab-content p-4">
<div class="table-responsive">
<table class="table table-hover" id="text-center">
	<thead>
		<tr class="table-primary">
			<th>호텔방번호</th>
			<th>호텔방사진</th>
			<th>호텔방이름</th>
			<th>호텔방타입</th>
			<th>현재사용여부</th>
			<th>호텔방가격</th>
		</tr>
	</thead>
	<tbody id="text-middle">
		<c:if test="${not empty hotelroomList }">
			<c:forEach items="${hotelroomList }" var="room">
			<tr class="tr-cursor" onclick="location.href='<c:url value='/main/franchisee/hotelroom/${room.hotelId }'/>'">
				<td>${room.hotelId }</td>
				<td>
					<img alt=""
						class="mw-100 mh-100 object-fit-cover rounded-1 my-n1"
						width="100" height="60"
						src="${room.hotelImage }">
				</td>
				<td>${room.hotelNm }</td>
				<td>${room.hotelType }</td>
				<td>
					<c:choose>
						<c:when test="${room.hotelUseAt == 'Y'}">
							사용중
						</c:when>
						<c:otherwise>
							사용가능
						</c:otherwise>
					</c:choose>
				</td>
				<td><fmt:formatNumber value="${room.hotelPrice }" />원</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty hotelroomList }">
			<tr>
				<td colspan="6">호텔방이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>

</table>
</div>

	<div class="paging-area">
		${pagingHTML }
	</div>
<form:form id="searchform" method="get" modelAttribute="condition">
	<form:input type="hidden" path="searchType"/>
	<form:input type="hidden" path="searchWord"/>
	<input type="hidden" name="page" />
</form:form>
</div>
</div>
<c:if test="${not empty message }">
	<script>
	 	Swal.fire({
			title: '${message}',
			text:'',
			icon:'success',
			confirmButtonColor: '#3085d6'
		});
	</script>
	<c:remove var="message" scope="session"/>
</c:if>
