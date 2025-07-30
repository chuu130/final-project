<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/franchisee/hotelRes" var="franResList" />
			<li class="breadcrumb-item"><a href="${franResList }">호텔관리</a></li>
			<li class="breadcrumb-item active">호텔예약현황</li>
		</ul>
		<h1 class="page-header mb-0">호텔예약현황</h1>
	</div>
</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-xl-6"> -->
<!-- 				<div class="card mb-xl-0 mb-3"> -->
<!-- 					<div class="card-header fw-bold">Card header here</div> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card title</h5> -->
<!-- 						<h6 class="card-subtitle mb-3 text-body text-opacity-50">Card -->
<!-- 							subtitle</h6> -->
<!-- 						<p class="card-text mb-3">Some quick example text to build on -->
<!-- 							the card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="card-link">Card link</a> <a href="#" -->
<!-- 							class="card-link">Another link</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-xl-6"> -->
<!-- 				<div class="card"> -->
<!-- 					<div class="card-header fw-bold">Card with list group</div> -->
<!-- 					<div class="card-header bg-none p-0"> -->
<!-- 						<ul class="list-group list-group-flush"> -->
<!-- 							<li class="list-group-item">Cras justo odio</li> -->
<!-- 							<li class="list-group-item">Dapibus ac facilisis in</li> -->
<!-- 							<li class="list-group-item">Vestibulum at eros</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					<div class="card-body"> -->
<!-- 						<a href="#" class="card-link">Card link</a> <a href="#" -->
<!-- 							class="card-link">Another link</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

<div class="card">
	<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#allTab" class="nav-link active px-2" data-bs-toggle="tab"
			aria-selected="true" role="tab">전체</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#completed" class="nav-link px-2" data-bs-toggle="tab"
			aria-selected="false" tabindex="-1" role="tab">예약완료</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a href="#used"
			class="nav-link px-2" data-bs-toggle="tab" aria-selected="false"
			tabindex="-1" role="tab">이용완료</a></li>
		<li class="nav-item me-sm-2" role="presentation"><a
			href="#canceled" class="nav-link px-2" data-bs-toggle="tab"
			aria-selected="false" tabindex="-1" role="tab">예약취소</a></li>
	</ul>
	<div class="tab-content p-4" id="hotelreslisttb">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
		</div>
		<div class="tab-pane fade" id="completed" role="tabpanel"></div>
		<div class="tab-pane fade" id="used" role="tabpanel"></div>
		<div class="tab-pane fade" id="canceled" role="tabpanel"></div>
	</div>
</div>


<!-- 상세 모달 -->
<div class="modal fade" id="modalLg">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content"></div>
	</div>
</div>

<c:if test="${not empty message }">
	<script>
		Swal.fire('${message}', '', 'success');
	</script>
	<c:remove var="message" scope="session" />
</c:if>

<script src="${cPath }/resources/js/app/franchise/hotelResList.js"></script>