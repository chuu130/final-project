<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="/prms/resources/js/jquery-3.7.1.min.js"></script>
<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.min.js"></script>

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/hotelroom" var="hotelroom" />
			<li class="breadcrumb-item"><a href="${hotelroom }">호텔관리</a></li>
			<li class="breadcrumb-item active">호텔방 정보수정</li>
		</ul>
		<h1 class="page-header mb-0">호텔방 정보수정</h1>
	</div>
</div>

<div class="card p-3 mb-5">
<div class="card-body pb-2">
<form:form id="updateForm" method="post" modelAttribute="room">
		<form:input type="hidden" path="hotelId"/>
		<div class="row">
		<div class="col-xl-6">
		<div class="form-group mb-3">
			<label class="form-label label-text">호텔방타입</label>
			<select path="hotelNm" name="hotelNm" class="form-select" id="ex-basic" required>
				<option value>선택</option>
				<c:forEach items="${hotelType }" var="type">
					<option label="${type.cmmnCodeNm}" value="${type.cmmnCodeNm }"
						${type.cmmnCodeNm eq room.hotelNm ? "selected" : "" }
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
		<input type="button" value="저장" class="btn btn-primary mb-1" id="updateBtn" />
	    <input type="button" value="방삭제" class="btn btn-danger mb-1" id="delBtn"/>

</form:form>
</div>
</div>
<form action="${cPath }/main/franchisee/hotelroom/${room.hotelId}/delete" method="post" id="deleteForm">
	<input type="hidden" name="hotelId" value="${room.hotelId}" required />
</form>
<c:if test="${not empty message }">
<script>
	Swal.fire({
	  icon: "error",
	  title: "실패",
	  text: "${message}",
	});
</script>
<c:remove var="message" scope="session"/>
</c:if>
<script>
$(".summernote").summernote({
    height: 300
});
document.getElementById("updateBtn").addEventListener("click", ()=>{
	Swal.fire({
		   title: '수정하시겠습니까?',
		   text: '호텔방 정보가 수정됩니다.',
		   icon: 'warning',

		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
		   confirmButtonText: '수정', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   updateForm.requestSubmit();
		   }
		});
});
document.getElementById("delBtn").addEventListener("click", ()=>{
	Swal.fire({
		   title: '삭제하시겠습니까?',
		   text: '한 번 삭제하면 되돌릴 수 없습니다.',
		   icon: 'warning',

		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
		   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소' // cancel 버튼 텍스트 지정

		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			  deleteForm.requestSubmit();
		   }
		});
});
</script>