<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- BEGIN #content -->
			<div class="d-flex align-items-center mb-3">
				<div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Pages</a></li>
						<li class="breadcrumb-item active">Review</li>
					</ul>
					<h1 class="page-header mb-0">관리자 리뷰리스트</h1>
				</div>
			</div>
			
			
			<div class="card">
				<ul class="nav nav-tabs nav-tabs-v2 px-3">
					<li class="nav-item me-2"><a href="#allTab" class="nav-link active px-2" data-bs-toggle="tab">관리자리뷰리스트</a></li>
				</ul>
				<div class="tab-content p-4">
					<div class="tab-pane fade show active" id="allTab">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4" id="searchUI">
								<div>
								    <select  class="noticelistselect" style="height:34px" name="condition.searchType" id="reviewType">
								    	<option value="">전체</option>
								    	<option value="title">제목</option>
								    	<option value="writer">작성자</option>
								    </select>
									<div role="separator" class="dropdown-divider"></div>
								</div>
								<div class="flex-fill">
									<div class="input-group">
										<div
											class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1" onclick="clickSearch()">
											<i class="fa fa-search opacity-5"></i>
										</div>
										<input type="text" id="inputContent" class="form-control ps-35px"
											placeholder="검색조건을 입력하세요"  onkeydown="keyDown(this,event)">
									</div>
								</div>
						</div>
						<!-- END input-group -->
										<td class="align-middle">${product}</td>

						
						<!-- BEGIN table -->
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
							    <thead>
							        <tr>
							            <th class="pt-0 pb-2"></th>
							            <th class="pt-0 pb-2 retable-title" >상품이름</th> 
							            <th class="pt-0 pb-2 retable-title" >리뷰제목</th> 
							            <th class="pt-0 pb-2" >리뷰내용</th>
							            <th class="pt-0 pb-2">작성자</th>
							            <th class="pt-0 pb-2">작성일</th>
							            <th class="pt-0 pb-2">블라인드여부</th>
							        </tr>
							    </thead>
								<tbody>
								<c:if test="${not empty reviewProdList }">
									<c:forEach items="${reviewProdList }" var="review">
									<tr>
<!-- 										<td class="w-10px align-middle"> -->
<!-- 											<div class="form-check"> -->
<!-- 												<input type="checkbox" class="form-check-input" id="product1"> -->
<!-- 												<label class="form-check-label" for="product1"></label> -->
<!-- 											</div> -->
<!-- 										</td> -->
										<td>
												<img alt="" class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" width="60" height="40" 
												src="/prms/main/atch/${review.atchfile.atchFileId}/${review.atchfile.fileDetails[0].fileSn}">
										</td>
										<td class="align-middle truncate">${review.prodSleNm }</td>
										<td class="align-middle truncate">		
													<a href="${cPath }/main/master/${review.reviewNo}/reviewdetail" class="text-body text-decoration-none">${review.reviewSj }</a>
										</td>		
										<td class="align-middle truncate">${review.reviewCn }</td>
										<td class="align-middle">${review.memNm }</td>
										<td class="align-middle">${review.reviewDe }</td>
										<td class="align-middle">${review.reviewBlindAt }</td>
									</tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
							
							<div class="pagination mb-0 justify-content-center flex-wrap paging-area">
								${pagingHTML}
							</div>
							
						</div>
						<!-- END table -->
						
							<!-- 검색 폼 -->
					<form id="searchform" method="get" action="/prms/main/master/reviewmasterList#reviewmasterList" modelAttribute="condition">
						<input type="hidden" name="searchType" value="${condition.searchType}"/>
						<input type="hidden" name="searchWord" value="${condition.searchWord}"/>
						<input type="hidden"name="page" value="${page}" />
					</form>
	
						
					</div>
				</div>
			</div>
		<!-- END #content -->

<script>
	//검색창 엔터이벤트
	const reviewForm = document.querySelector("#searchform");
	const reviewType = document.querySelector("#reviewType");
	function keyDown(el,e){
		if(e.key == "Enter"){
		console.log("event발생el",el)
		console.log("event발생e",e)
		reviewForm.searchType.value = reviewType.value;
		reviewForm.searchWord.value = el.value; 
		reviewForm.submit(); 
		}
	}
	
	// 돋보기 아이콘 클릭 이벤트
	function clickSearch() {
		const el = document.getElementById("inputContent");
		console.log("클릭이벤트발생")
		console.log("event발생el",el)
		searchform.searchWord.value = el.value;
	    console.log("el.value",el.value)
	 	searchform.submit();
	}
	
	
</script>
		
<script src="${cPath}/resources/js/app/utils/paging.js"></script>		

		