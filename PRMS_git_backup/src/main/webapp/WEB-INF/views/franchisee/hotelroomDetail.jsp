<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- required js / css -->
<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<div class="d-flex align-items-center mb-3">
<div>
<ul class="breadcrumb">
<c:url value="/main/franchisee/hotelroom" var="hotelroom" />
<li class="breadcrumb-item"><a href="${hotelroom }">호텔관리</a></li>
<li class="breadcrumb-item active">호텔방 정보</li>
</ul>
<h1 class="page-header mb-0">호텔방 정보</h1>
</div>
<div class="ms-auto">
	<a href="<c:url value='/main/franchisee/hotelroom/${room.hotelId}/update' />" class="btn btn-theme fs-13px fw-semibold"><i class="far fa-lg fa-fw me-2 fa-edit"></i> 정보 수정</a>
</div>
</div>

<div class="card p-3 mb-5">
<div class="tab-content p-4">
<div class="table-responsive">
<table class="table" id="tabledetail">

		<tr>
			<th style="padding-right: 140px;">호텔방이름</th>
			<td>${room.hotelNm }</td>
		</tr>
		<tr>
			<th>호텔방사진</th>
			<td>
				<img alt=""
					class="mw-100 mh-100 object-fit-cover rounded-1 my-n1"
					width="180" height="140"
					src="${room.hotelImage }">
			</td>
		</tr>
		<tr>
			<th>호텔방타입</th>
			<td>${room.hotelType }</td>
		</tr>
		<tr>
			<th>현재사용여부</th>
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
		</tr>
		<tr>
			<th>호텔방정보</th>
			<td>${room.hotelInfo }</td>
		</tr>
		<tr>
			<th>호텔방가격</th>
			<td><fmt:formatNumber value="${room.hotelPrice }" />원</td>
		</tr>
		<tr>
			<th>호텔방상세</th>
			<td>${room.hotelDetail }</td>
		</tr>

<!-- <div class="input-group"> -->
<!--   <input type="text" class="form-control" id="datepicker" placeholder="with input group addon"> -->
<!--   <label class="input-group-text" for="datepicker"> -->
<!--     <i class="fa fa-calendar"></i> -->
<!--   </label> -->
<!-- </div> -->
</table>
</div>
</div>
</div>
<c:if test="${not empty message }">
	<script>
		Swal.fire({
			title: "${message}",
		    text: '',
		    icon: 'success', // 성공 아이콘
		    confirmButtonColor: '#3085D6'
			});
	</script>
	<c:remove var="message" scope="session"/>
</c:if>
<script>
  $('#datepicker').datepicker({
    autoclose: true
  });
</script>