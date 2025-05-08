<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/marketstyle/marketBoard.css">

<!-- 마켓질문게시판 리스트페이지 -->
<div class="ms-breadcrumb m-b-30">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row ms_breadcrumb_inner">
					<div class="col-md-6 col-sm-12">
						<h2 class="ms-breadcrumb-title">질문게시판</h2>
					</div>
					<div class="col-md-6 col-sm-12">
						<!-- ms-breadcrumb-list start -->
						<ul class="ms-breadcrumb-list">
							<li class="ms-breadcrumb-item"><a
								href="${cPath }/market/marketpage.do">Home</a></li>
							<li class="ms-breadcrumb-item active">Q&A</li>
						</ul>
						<!-- ms-breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Cart section -->
<h2 class="d-none">Cart Page</h2>
<div class="container">
	<div class="row">

		<!-- cart content Start -->
		<div class="ms-cart-content">
			<div class="ms-cart-inner">
				<div class="row" id="noticeMarket">
					<form action="#">
						<div class="table-content cart-table-content">
							<ul class="nav nav-tabs nav-tabs-v2 px-3" style="border-color: #fff;">
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab">전체</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab">회원가입/정보</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab">상품구매/주문</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab">결제/배송</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab">교환/반품</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab">기타</a></li>
							</ul>
							<div class="tab-content p-4">
								<div class="tab-pane fade show active" id="allTab">

									<!-- BEGIN input-group -->
									<div class="market-searchbar">
										<div class="input-group flex-nowrap"
											data-target-form="#ej-form">
											<div class="flex-fill search-align">
												<div>
													<select class="select-bar-box" name="condition.searchType" id="qnaType" value="search">
														<option value="">전체</option>
														<option value="title">제목</option>
														<option value="writer">작성자</option>
													</select>
													<div role="separator" class="dropdown-divider"></div>
												</div>
												<div class="custom-search-bar">
													<input type="text" class="form-control ps-35px"
														placeholder="검색어을 입력하세요" name="searchWord"
														onkeydown="fejDown(this)" style="font-size: 13px;">
													<button class="search_submit search-btn" type="button"
														onclick="clickSearch()">
														<img
															src="${cPath}/resources/Masterkart/masterkart-html/assets/img/icons/search.svg"
															class="svg_img search_svg" alt="검색">
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- END input-group -->
								</div>
							</div>


							<h4>Q&A게시판</h4>
							<table>
								<thead>
									<tr>
										<th>NO</th>
										<th>질문유형</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>답변여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty centerList }">
										<c:forEach items="${centerList }" var="center">
											<tr>
												<td data-label="noticeNo" class="ms-cart-pro-price"><span class="amount">${center.ctrBbsNo}</span></td>
												<td>${center.ctrBbsSn}</td>
												<td data-label="noticeNm" class="ms-cart-pro-name"><a
													href="/prms/market/member/${center.ctrBbsNo}/center"
													style="display: block"> <img
														class="ms-cart-pro-img mr-4"
														src="assets/img/product-images/1_1.jpg" alt="">
														${center.ctrBbsNm}
												</a></td>
												<td data-label="Price" class="ms-cart-pro-price"><span
													class="amount">${center.memNm}</span></td>
												<td data-label="Total" class="ms-cart-pro-subtotal">${center.ctrBbsDe}</td>
											  <!-- 답변 여부 표시 -->
									            <td>
									                <c:set var="hasAnswer" value="false" />
									                <!-- qnaList에서 center.ctrBbsNo에 해당하는 답변이 있는지 확인 -->
									                <c:forEach items="${qnaList }" var="qna">
									                    <c:if test="${qna.ctrBbsNo == center.ctrBbsNo}">
									                        <c:set var="hasAnswer" value="true" />
									                    </c:if>
									                </c:forEach>
									
									                <!-- hasAnswer 값에 따라 상태 표시 -->
									                <c:choose>
									                    <c:when test="${hasAnswer == 'true'}">
									                        <span style="color:green;">답변완료</span>
									                    </c:when>
									                    <c:otherwise>
									                        <span style="color:red;">답변대기</span>
									                    </c:otherwise>
									                </c:choose>
									            </td>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</form>
												<!--                                                <td data-label="Remove" class="ms-cart-pro-remove"> -->
												<!--                                                  <a href="#"><i class="msicon msi-trash-o"></i></a> -->
												<!--                                                </td> -->

					<!-- Pagination Start -->

					<div data-target-form="#ej-form"
						class="ms-pro-pagination paging-area">
						<ul class="ms-pro-pagination-inner">${pagingHTML}
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 	<div class="ms-pro-pagination paging-area"> -->
	<!-- 		<ul class="ms-pro-pagination-inner"> -->
	<!-- 			<li><a class="active" href='javascript:;' data-page='1'>1</a></li> -->

	<!-- 		</ul> -->
	<!-- 	</div> -->
	<!-- Pagination End -->


	<div class="qnaBtn">
		<a href="${cPath}/market/member/centerInsert" class="btn ms-btn-2">등록하기</a>
	</div>
</div>
<!--cart content End -->

<!-- 검색 폼 -->
<form id="ej-form" method="get"
	action="/prms/market/member/centerMarketList"
	modelAttribute="condition">
	<input type="hidden" name="searchType" value="${condition.searchType}" />
	<input type="hidden" name="searchWord" value="${condition.searchWord}" />
	<input type="hidden" name="page" value="${page}" />
</form>

<script>
	const qnaForm = document.querySelector("#ej-form");
	const qnaType = document.querySelector("#qnaType");
	function fejDown(pThis) {
		if (event.keyCode == 13) { //Enter 키 코드값 13 / 엔터누르면 실행된다
			qnaForm.searchType.value = qnaType.value;
			qnaForm.searchWord.value = pThis.value;
// 			qnaForm.submit();  
		}

	}

	// 돋보기 아이콘 클릭
	function clickSearch() {
		qnaForm.searchType.value = searchType.value;
		qnaForm.searchWord.value = document.querySelector('.custom-search-bar input').value;
		qnaForm.submit();
	}
</script>




<!-- 나중에 비동기로 질문답변 리스트 한번에 뽑아오는방법 -->
<%-- 

document.addEventListener('DOMContentLoaded', () => {
    서버에서 데이터를 가져옵니다.
    fetch('${cPath}/market/member/centerMarketList',{
    	headers: {
    		accept: "application/json"  //  헤더설정 / accept에 값들어왔는지 확인할것
    	}
    	
    })
        .then(response => response.json()) // JSON으로 변환
        .then(centerList => {
            Q&A 목록을 표시할 div를 가져옵니다.
            const qnaListDiv = document.getElementById('qna-list');
            qnaListDiv.innerHTML = ''; // 기존 내용을 초기화

            const centerQnaList = data.centerQnaList; // 질문 리스트
            const answerList = data.answerList;       // 답변 리스트

            질문 리스트를 화면에 표시
           if (centerList.length > 0) {
            	centerList.forEach(item => {
                    const formattedDate = item.ctrBbsDe.join('-'); // 날짜 포맷팅
                    const QStyle = item.parentNo ? 'margin-left: 100px;' : 'margin-left: 0%;'; 
                    const QNumber = item.parentNo ? "" : item.ctrBbsNo;
                    
                    qnaListDiv.innerHTML += `
                    	 <div class="qna-item ${indentClass}">
                            <div>\${QNumber}\${item.parentNo?"↪" : ""}</div>
                            <a href="${cPath}/\${item.parentNo ? 'market/member/centeranswerDetail/' + item.parentNo : 'market/member/centerMarketDetail/' + item.ctrBbsNo}"\${QStyle}>
                            \${item.ctrBbsNm}
                        	</a>
                            <div>\${item.memNo}</div>
                            <div>\${formattedDate}</div>
                        </div>
                        <hr>`;
                });
            } else {
                qnaListDiv.innerHTML += '<p>문의글이 없습니다.</p>';
            }
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            document.getElementById('qna-list').innerHTML = '<p>데이터를 불러오는 데 실패했습니다.</p>';
        });
    
    
});
 --%>
