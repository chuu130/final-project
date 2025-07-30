<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/beautyRes" var="beautyResList" />
			<li class="breadcrumb-item"><a href="${beautyResList }">미용예약관리</a></li>
			<li class="breadcrumb-item active">미용예약현황</li>
		</ul>
		<h1 class="page-header mb-0">미용예약현황</h1>
	</div>
</div>

<div class="card">
	<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#allTab" class="nav-link active px-2" data-bs-toggle="tab"
			aria-selected="true" role="tab">전체</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#emp" class="nav-link px-2" data-bs-toggle="tab"
			aria-selected="false" tabindex="-1" role="tab">나의 예약</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#completed" class="nav-link px-2" data-bs-toggle="tab"
			aria-selected="false" tabindex="-1" role="tab">예약완료</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#used" class="nav-link px-2" data-bs-toggle="tab"
			aria-selected="false" tabindex="-1" role="tab">이용완료</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#canceled" class="nav-link px-2" data-bs-toggle="tab"
			aria-selected="false" tabindex="-1" role="tab">예약취소</a></li>
	</ul>
	<div class="tab-content p-4">
        <div class="tab-pane fade show active" id="allTab" role="tabpanel">
		</div>
		<div class="tab-pane fade" id="completed" role="tabpanel">
		</div>
		<div class="tab-pane fade" id="used" role="tabpanel">
		</div>
		<div class="tab-pane fade" id="canceled" role="tabpanel">
		</div>
		<div class="tab-pane fade" id="emp" role="tabpanel">
		</div>
    </div>
</div>


<!-- 상세 모달 -->
<div class="modal fade" id="modalLg">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
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
	<c:remove var="message" scope="session" />
</c:if>

<script src="${cPath }/resources/js/app/franchise/beautyResList.js"></script>