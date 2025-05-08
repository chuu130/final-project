<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="/prms/resources/js/jquery-3.7.1.min.js"></script>
<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.min.js"></script>
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css"> -->

<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script> -->


<div class="d-flex align-items-center mb-3">
<div>
<ul class="breadcrumb">
<c:url value="/main/franchisee/hotelroom" var="hotelroom" />
<li class="breadcrumb-item"><a href="${hotelroom }">호텔관리</a></li>
<li class="breadcrumb-item active">호텔방 추가</li>
</ul>
<h1 class="page-header mb-0">호텔방 추가</h1>
</div>
</div>

<div class="card shadow p-3 mb-5 rounded" id="card-border">
<div class="card-body pb-2">
<form:form id="insertForm" method="post" modelAttribute="newHotelroom">
		<div class="row">
		<div class="col-xl-6">
		<div class="form-group mb-3">
			<label class="form-label label-text">호텔방타입</label>
<!-- 			<select class="my-select selectpicker"> -->
<!-- 			  <option>Mustard</option> -->
<!-- 			  <option>Ketchup</option> -->
<!-- 			  <option>Relish</option> -->
<!-- 			</select> -->
			<select name="hotelNm" class="form-select" id="ex-basic" required>
				<option value>선택</option>
				<c:forEach items="${hotelType }" var="type">
					<option label="${type.cmmnCodeNm}" value="${type.cmmnCodeNm }"
					/>
				</c:forEach>
			</select>
		</div>
		</div>
		</div>
		<div class="col-xl-12">
		<div class="form-group mb-3">
			<label class="form-label label-text">호텔상세정보</label>
				<form:textarea class="summernote" path="hotelDetail"/>
				<form:errors path="hotelDetail" cssClass="text-danger" />
		</div>
		</div>
		<div class="col-xl-12">
		<div class="form-group mb-3">
			<label class="form-label label-text">호텔정보</label>
				<form:textarea class="form-control" rows="3" path="hotelInfo"/>
				<form:errors path="hotelInfo" cssClass="text-danger" />
		</div>
		</div>
		<input type="submit" value="저장" class="btn btn-primary mb-1" />

</form:form>
</div>
</div>

<script>
$(".summernote").summernote({
    height: 300
});
$('.my-select').selectpicker(); // select피커 작동
</script>