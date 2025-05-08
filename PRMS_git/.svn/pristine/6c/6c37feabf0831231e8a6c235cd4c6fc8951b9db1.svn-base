<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- BEGIN #content -->
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">Review</li>
		</ul>
		<h1 class="page-header mb-0">QNA</h1>
	</div>
</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap"></div>

<div class="card">

	<!-- END input-group -->

	<!-- BEGIN table -->
	<div class="tab-content p-4">
		<div class="table-responsive">
			<table class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th class="board-header-container">
							<div class="board-header-title">${center.ctrBbsNm}</div>
							<div class="board-header-date">${center.ctrBbsDe}</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="board-content-row">
						<td class="board-content">${center.ctrBbsCn}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- END table -->
		<!-- BEGIN table -->
		<div class="container">
			<form name="commentInsertForm" method="post"
				enctype="multipart/form-data">
<%-- 		<p>${qnaviewList }</p> --%>
				<c:if test="${not empty qnaviewList}">
					<c:forEach items="${qnaviewList}" var="qnaview">
						<div class="container mt-5">
							<div class="comment-list">
								<div class="comment border p-3 mb-3 rounded">
									<div class="comment-body">
										<h3 class="fw-bold">댓글</h3>
										<div class="comment-author fw-bold">${qnaview.empId}</div>
										<div class="comment-date text-muted small">${qnaview.qnaAnswerDe}</div>
										<div class="comment-content mt-2">${qnaview.qnaAnswerCn}</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</form>
		</div>
		<!-- END table -->


		<div class="noticeBtn-group">
			<div class="d-lg-flex align-items-center">
				<div class="ms-auto">
					<a href="${cPath }/main/master/centerMasterList"
						class="btn btn-primary">목록조회</a>
				</div>
				<div class="ms-auto">
					<a href="${cPath }/main/master/centerMasterInsert/${ctrBbsNo}"
						class="btn btn-primary">답변등록</a>
				</div>
				<div class="ms-auto">
					<a href="${cPath }/main/master/centerMasterUpdate/${ctrBbsNo}"
						class="btn btn-primary">수정하기</a>
				</div>
				<div class="ms-auto">
					<a href="${cPath }/main/master/centerMasterDelete/${ctrBbsNo}"
						class="btn btn-primary">삭제하기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- END table -->


<!-- END #content -->


