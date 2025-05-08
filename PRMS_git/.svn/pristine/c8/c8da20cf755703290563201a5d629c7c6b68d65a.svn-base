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
					<h1 class="page-header mb-0">QNA게시판</h1>
				</div>
			</div>
			<div class="mb-sm-3 mb-2 d-flex flex-wrap">
			</div>
			 <div class="card">
			 
				<div class="tab-content p-4">
					<div class="tab-pane fade show active" id="allTab">
					<!-- BEGIN input-group -->
				<div class="input-group flex-nowrap mb-4" id="searchUI">
					<div>
					    <select class="noticelistselect" style="height:34px" name="condition.searchType" id="ejType">
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
                                <th class="pt-0 pb-2">문의번호</th>
                                <th class="pt-0 pb-2">문의제목</th>
                                <th class="pt-0 pb-2">문의내용</th>
                                <th class="pt-0 pb-2">작성자</th>
                                <th class="pt-0 pb-2">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty centerList}">
                                <c:forEach items="${centerList}" var="center">
                                    <tr>
                                        <td class="align-middle">${center.ctrBbsNo}</td>
                                        <td class="align-middle">
                                            <a href="<c:url value='/main/master/${center.ctrBbsNo}/quest'/>">
                                                ${center.ctrBbsNm}</a>
                                        </td>
<%--                                         <td class="align-middle">${center.ctrBbsCn}</td> --%>
                                        <td class="align-middle">${center.ctrBbsCn}</td>
                                        <td class="align-middle">${center.memNm}</td>
                                        <td class="align-middle">${center.ctrBbsDe}</td>
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
				<form id="searchform" method="get" action="/prms/main/master/centerMasterList#centerMasterList" modelAttribute="condition">
					<input type="hidden" name="searchType" value="${condition.searchType}"/>
					<input type="hidden" name="searchWord" value="${condition.searchWord}"/>
					<input type="hidden"name="page" value="${page}" />
				</form>
				
					</div>
				</div>
			</div>
		<!-- END #content -->

<script>
    const ejForm = document.querySelector("#searchform");
	const ejType = document.querySelector("#ejType");
	function fejDown(pThis){
		if(event.keyCode == 13){
			ejForm.searchType.value = ejType.value;
			ejForm.searchWord.value = pThis.value; 
			ejForm.submit(); 
		}
	}
</script>
		
		
<script>
// document.addEventListener('DOMContentLoaded', () => {
    // 서버에서 데이터를 가져오기
//     fetch('${cPath}/main/master/centerMasterList',{
//     	headers: {
//     		accept: "application/json"  //  헤더설정 / accept에 값들어왔는지 확인할것
//     	}
    	
//     })
//         .then(response => response.json()) // JSON으로 변환
//         .then(centerList => {
            // Q&A 목록을 표시할 div
//             const qnaListDiv = document.getElementById('qna-list');
//             qnaListDiv.innerHTML = ''; // 기존 내용을 초기화합니다.

//             const centerQnaList = data.centerQnaList; // 질문 리스트
//             const answerList = data.answerList;       // 답변 리스트

            // 질문 리스트를 화면에 표시
//             if (centerList.length > 0) {
//             	centerList.forEach(item => {
//                     const formattedDate = item.ctrBbsDe.join('-'); // 날짜 포맷팅
//                     qnaListDiv.innerHTML += `
//                     	<div style="display: flex;">
//                             <strong>\${item.parentNo?"답변:":"질문"}</strong>
//                             <p>\${item.ctrBbsNo}</p>
//                             <a href="${cPath}/\${item.parentNo ? 'main/master/answerDetail/' + item.parentNo : 'main/master/questDetail/' + item.ctrBbsNo}">
//                             \${item.ctrBbsNm}
//                         	</a>
//                             <p>\${item.memNo}</p>
//                             <p>\${formattedDate}</p>
//                         </div>
//                         <hr>`;
//                 });
//             } else {
//                 qnaListDiv.innerHTML += '<p>문의글이 없습니다.</p>';
//             }
//         })
//         .catch(error => {
//             console.error('Error fetching data:', error);
//             document.getElementById('qna-list').innerHTML = '<p>데이터를 불러오는 데 실패했습니다.</p>';
//         });
// 	});
		
		</script>
<!--                             <p>\${item.ctrBbsCn}</p> -->