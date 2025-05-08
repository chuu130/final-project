<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- BEGIN #content -->
<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/noticeList" var="noticeListUrl" />
			<li class="breadcrumb-item"><a href="${noticeListUrl }">고객센터관리</a></li>
			<li class="breadcrumb-item active">공지사항 목록</li>
		</ul>
		<h1 class="page-header mb-0">공지사항 목록</h1>
	</div>
	<div class="ms-auto">
		<c:url value="/main/master/noticeInsertUI" var="noticeInsertUI" />
		<a href="${noticeInsertUI }" class="btn btn-theme fs-13px fw-semibold"><i class="fa fa-plus fa-fw me-1"></i> 게시글 등록</a>
	</div>
</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap"></div>

<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">
			<!-- BEGIN input-group -->
			<div class="input-group flex-nowrap mb-4" id="searchUI">
				<div>
				    <select class="noticelistselect" name="condition.searchType" id="ejType">
				    	<option value="">전체</option>
				    	<option value="title">제목</option>
				    	<option value="writer">작성자</option>
				    </select>
					<div role="separator" class="dropdown-divider"></div>
				</div>
				<div class="flex-fill">
					<div class="input-group">
						<div
							class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
							<i class="fa fa-search opacity-5"></i>
						</div>
						<input type="text" class="form-control ps-35px"
							placeholder="검색조건을 입력하세요"  onkeydown="fejDown(this)">
					</div>
				</div>
			</div>
			<!-- END input-group -->

			<!-- BEGIN table -->
			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="pt-0 pb-2">공지사항번호</th>
							<th class="pt-0 pb-2">공지사항제목</th>
							<th class="pt-0 pb-2">작성자</th>
							<th class="pt-0 pb-2">작성일</th>
							<th class="pt-0 pb-2">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty noticeList}">
							<c:forEach items="${noticeList}" var="notice">
								<tr>
									<td class="align-middle">${notice.noticeBbsNo}</td>
									<td class="align-middle"><a
										href="<c:url value='/main/master/notice/${notice.noticeBbsNo}'/>">
											${notice.noticeBbsNm} </a></td>
									<td class="align-middle">${notice.empId}</td>
									<td class="align-middle">${notice.noticeBbsDe}</td>
									<td class="align-middle">${notice.noticeBbsHit}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty noticeList }">
							<tr>
								<td colspan="5">글 없음.</td>
							</tr>
						</c:if>
					</tbody>
					<tfoot>
						<!-- 페이징 -->
					</tfoot>
				</table>

				<div class="pagination mb-0 justify-content-center flex-wrap paging-area">
						${pagingHTML}
				</div>
			</div>
			<!-- END table -->



			<!-- 검색 폼 -->
			<form id="searchform" method="get" action="/prms/main/master/noticeList#noticeList" modelAttribute="condition">
				<input type="hidden" name="searchType" value="${condition.searchType}"/>
				<input type="hidden" name="searchWord" value="${condition.searchWord}"/>
				<input type="hidden"name="page" value="${page}" />
			</form>

		</div>
	</div>
</div>
<script>
    const ejForm = document.querySelector("#search-form");
	const ejType = document.querySelector("#ejType");
	function fejDown(pThis){
		if(event.keyCode == 13){ //Enter 키 코드값 13 / 엔터누르면 실행된다
			ejForm.searchType.value = ejType.value;
			ejForm.searchWord.value = pThis.value;
			ejForm.submit();  
		}
	}
	
	// 돋보기 아이콘 클릭
	function clickSearch() {
		ejForm.searchType.value = searchType.value;
		ejForm.searchWord.value = document.querySelector('.custom-search-bar input').value;
		ejForm.submit();
	}
</script>

<!-- END #content -->
<script src="${cPath}/resources/js/app/utils/paging.js"></script>
