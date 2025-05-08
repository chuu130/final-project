<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!-- BEGIN #content -->
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">QNA</li>
		</ul>
		<h1 class="page-header mb-0">QNA상세조회</h1>
	</div>

</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap">

	<!-- BEGIN table -->
	<div class="table-responsive">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th class="pt-0 pb-2">${qnaList.noticeBbsNm }</th>
					<th class="pt-0 pb-2">${qnaList.noticeBbsDe }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="pt-0 pb-2">${qnaList.noticeBbsCn }</th>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- END table -->

	<div class="d-lg-flex align-items-center">
			<div class="ms-auto">
				<a href="${cPath }/main/masterNotice/noticeList" class="btn btn-theme fw-semibold fs-13px">목록조회</a>
			</div>
			<form method="get" action="${cPath }/main/masterNotice/${noticeBbsNo}/update">
				<button type="submit" class="btn btn-theme fw-semibold fs-13px">수정하기</button>
			</form>
			<form method="post" action="/prms/main/masterNotice/${qnaList.noticeBbsNo}/delete">
				<button type="submit" onclick="deletebtn()" id="delBtn" class="btn btn-theme fw-semibold fs-13px">삭제하기</button>
			</form>
	</div>
	
	</div>
	<script>
 		function deletebtn(){
			confirm("정말삭제하시겠습니까?");
		}	
	</script>
	

<!-- END #content -->
