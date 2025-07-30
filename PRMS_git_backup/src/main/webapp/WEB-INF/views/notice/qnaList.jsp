<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
			
			<div class="mb-sm-3 mb-2 d-flex flex-wrap">
			</div>
			
			 <div class="card">
				<div class="tab-content p-4">
					<div class="tab-pane fade show active" id="allTab">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4">
							<button class="btn btn-outline-default dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">조회 &nbsp;</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">Action</a>
								<a class="dropdown-item" href="#">Another action</a>
								<a class="dropdown-item" href="#">Something else here</a>
								<div role="separator" class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Separated link</a>
							</div>
							<div class="flex-fill">
								<div class="input-group">
									<div class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
										<i class="fa fa-search opacity-5"></i>
									</div>
									<input type="text" class="form-control ps-35px" placeholder="Search products">
								</div>
							</div>
						</div>
						<!-- END input-group -->
						
						<!-- BEGIN table -->
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th class="pt-0 pb-2">번호</th>
										<th class="pt-0 pb-2">제목</th>
										<th class="pt-0 pb-2">내용</th>
										<th class="pt-0 pb-2">작성자</th>
										<th class="pt-0 pb-2">작성일</th>
									</tr>
								</thead>
								<tbody>
								    <c:if test="${not empty qnaList }">
									 <c:forEach items="${qnaList }" var="qna">
									<tr>
									    <td class="align-middle">${qna.qnaAnswerId }</td>
								        <td class="align-middle">
                                         <a href="<c:url value='/main/masterNotice/${qna.ctrBbsNo}'/>">
                                             ${qna.qnaAnswerNm}
                                         </a>
                                        </td>
										<td class="align-middle">${qna.qnaAnswerCn}</td>
										<td class="align-middle">${qna.empNo }</td>
										<td class="align-middle">${qna.qnaAnswerDe }</td>
									</tr>
								 </c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
						<!-- END table -->
						
						
						<div class="d-lg-flex align-items-center">
							<ul class="pagination mb-0 justify-content-center flex-wrap">
								<li class="page-item mb-sm-0 mb-1 disabled"><a class="page-link">Previous</a></li>
								<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">1</a></li>
								<li class="page-item mb-sm-0 mb-1 active"><a class="page-link" href="#">2</a></li>
								<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">3</a></li>
								<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">4</a></li>
								<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">5</a></li>
								<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">6</a></li>
								<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">Next</a></li>
							</ul>
							<div class="d-lg-flex align-items-center">
								<ul class="pagination mb-0 justify-content-center flex-wrap">
									<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="<c:url value='/main/masterNotice/noticeInsertUI'/>">게시물등록</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- END #content -->
