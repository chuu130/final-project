<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
 .truncate {
        max-width: 150px;
        overflow: hidden;
        text-overflow: ellipsis; 
        white-space: nowrap; 
        padding: 5px; 
        box-sizing: border-box; 
    }
.image-container {
    width: 150px; /* 원하는 너비로 설정 */
    height: 200px; /* 원하는 높이로 설정 */
    overflow: hidden; /* 내용이 넘치지 않도록 설정 */
    position: relative; /* 자식 요소의 위치를 제어하기 위함 */
    background-color: #f0f0f0; /* 배경색 추가 (선택 사항) */
}

.image-container img {
    width: 100%; /* 컨테이너의 너비에 맞게 조정 */
    height: 100%; /* 컨테이너의 높이에 맞게 조정 */
    object-fit: contain; /* 이미지가 잘리지 않도록 설정 */
}
        .card-text {
            position: absolute;
            bottom: 10px;
            left: 10px;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 10px;
            border-radius: 5px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        .card-body {
            padding: 15px;
        }
        .card-title {
            margin: 0;
            font-size: 18px;
        }
  </style>  

<!-- BEGIN #content -->
			<div class="d-flex align-items-center mb-3">
				<div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Pages</a></li>
						<li class="breadcrumb-item active">Review</li>
					</ul>
					<h1 class="page-header mb-0">리뷰전체리스트</h1>
				</div>
				
<!-- 				<div class="ms-auto"> -->
<!-- 					<a href="#" class="btn btn-theme fw-semibold fs-13px"><i class="fa fa-plus fa-fw me-1"></i> Add Product</a> -->
<!-- 				</div> -->
			</div>
			
			<div class="mb-sm-3 mb-2 d-flex flex-wrap">
<!-- 				<div class="me-4 mb-2 mb-sm-0"><a href="#" class="text-body text-decoration-none d-flex align-items-center"><i class="bi bi-download fs-5 me-2 my-n2 text-body text-opacity-50"></i> Export</a></div> -->
<!-- 				<div class="me-4 mb-2 mb-sm-0"><a href="#" class="text-body text-decoration-none d-flex align-items-center"><i class="bi bi-upload fs-5 me-2 my-n2 text-body text-opacity-50"></i> Import</a></div> -->
<!-- 				<div class="me-4 mb-2 mb-sm-0 dropdown-toggle z-2"> -->
<!-- 					<a href="#" data-bs-toggle="dropdown" class="text-body text-decoration-none">More Actions</a> -->
<!-- 					<div class="dropdown-menu z-1"> -->
<!-- 						<a class="dropdown-item" href="#">Action</a> -->
<!-- 						<a class="dropdown-item" href="#">Another action</a> -->
<!-- 						<a class="dropdown-item" href="#">Something else here</a> -->
<!-- 						<div role="separator" class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">Separated link</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			
			<div class="card">
				<ul class="nav nav-tabs nav-tabs-v2 px-3">
					<li class="nav-item me-2"><a href="#allTab" class="nav-link active px-2" data-bs-toggle="tab">리뷰리스트조회</a></li>
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
											class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1">
											<i class="fa fa-search opacity-5"></i>
										</div>
										<input type="text" class="form-control ps-35px"
											placeholder="검색조건을 입력하세요"  onkeydown="fejDown(this)">
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
							            <th class="pt-0 pb-2">삭제여부</th>
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
												<img alt="" class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" width="60" height="40" src="/prms/files/${review.atchfile.fileDetails[0].streFileNm}_${review.atchfile.fileDetails[0].orignlFileNm}">
										</td>
										<td class="align-middle truncate">${review.prodSleNm }</td>
										<td class="align-middle truncate">		
												<div class="ms-3">
													<a href="${cPath }/main/master/${review.reviewNo}/reviewdetail" class="text-body text-decoration-none">${review.reviewSj }</a>
												</div>
										</td>		
										<td class="align-middle truncate">${review.reviewCn }</td>
										<td class="align-middle">${review.memNm }</td>
										<td class="align-middle">${review.reviewDe }</td>
										<td class="align-middle">${review.reviewDelAt }</td>
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
	const reviewForm = document.querySelector("#searchform");
	const reviewType = document.querySelector("#reviewType");
	function fejDown(pThis){
		if(event.keyCode == 13){
			reviewForm.searchType.value = reviewType.value;
			reviewForm.searchWord.value = pThis.value; 
			reviewForm.submit(); 
		}
	}
</script>
		
<script src="${cPath}/resources/js/app/utils/paging.js"></script>		



<!-- 			<div class="review-rank"> -->
<!-- 				<div class="col-md-6 col-sm-6 col-xs-6 mb-1" style="display: flex;"><i class="fas fa-lg fa-fw me-2 fa-trophy" style="color: #ffdf65;font-size: 40px;"></i><h3>BEST4</h3></div> -->
<!-- 								<div class="card-body"> -->
<!-- 											<div class="row row-cols-1 row-cols-md-2 g-3"> -->
<!-- 												<div class="col"> -->
<!-- 													<div class="card h-100"> -->
<!-- 														<div class="card-body"> -->
<!-- 															<h5 class="card-title">강아지사료</h5> -->
<!-- 															<td> -->
<!-- 															<div class="image-container"> -->
<!-- 																<img alt="" width="300px" height="200px" class="mw-100 mh-100 object-fit-cover rounded-1 my-n1" src="data:image/jpeg;base64,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"> -->
<!-- 														 	</div> -->
<!-- 														 	</td> -->
<!-- 															<p class="card-text">이 사료는 30%의 단백질과 20%의 지방을 함유하고 있어서, 저희 강아지에게 필요한 에너지를 충분히 공급해주더군요. 특히, 비타민 A, D, E와 오메가-3 지방산이 포함되어 있어 건강에도 도움이 되는 것 같습니다.</p> -->
<!-- 															<br><small class="text-muted">3일전</small> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="col"> -->
<!-- 													<div class="card h-100"> -->
<!-- 														<div class="card-body"> -->
<!-- 															<h5 class="card-title">고양이사료</h5> -->
<!-- 															<p class="card-text">이 사료는 30%의 단백질과 20%의 지방을 함유하고 있어서, 저희 강아지에게 필요한 에너지를 충분히 공급해주더군요. 특히, 비타민 A, D, E와 오메가-3 지방산이 포함되어 있어 건강에도 도움이 되는 것 같습니다.</p> -->
<!-- 															<small class="text-muted">3일전</small> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="col"> -->
<!-- 													<div class="card h-100"> -->
<!-- 														<div class="card-body"> -->
<!-- 															<h5 class="card-title">강아지사료</h5> -->
<!-- 															<p class="card-text">이 사료는 30%의 단백질과 20%의 지방을 함유하고 있어서, 저희 강아지에게 필요한 에너지를 충분히 공급해주더군요. 특히, 비타민 A, D, E와 오메가-3 지방산이 포함되어 있어 건강에도 도움이 되는 것 같습니다.</p> -->
<!-- 															<small class="text-muted">3일전</small> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="col"> -->
<!-- 													<div class="card h-100"> -->
<!-- 														<div class="card-body"> -->
<!-- 															<h5 class="card-title">고양이사료</h5> -->
<!-- 															<p class="card-text">이 사료는 30%의 단백질과 20%의 지방을 함유하고 있어서, 저희 강아지에게 필요한 에너지를 충분히 공급해주더군요. 특히, 비타민 A, D, E와 오메가-3 지방산이 포함되어 있어 건강에도 도움이 되는 것 같습니다.</p> -->
<!-- 															<small class="text-muted">3일전</small> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<h6>멍냥몰 best4 랭킹상품</h6> -->
<!-- 			</div> -->
		