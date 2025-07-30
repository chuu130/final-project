<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketBoard.css">

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
<h2 class="d-none">QNA Page</h2>
<div class="container">
	<div class="row">

		<!-- cart content Start -->
		<div class="ms-cart-content">
			<div class="ms-cart-inner">
				<div class="row" id="noticeMarket">
					<form action="#">
						<div class="table-content cart-table-content">
							<ul class="nav nav-tabs nav-tabs-v2 px-3" style="border-color: #fff;" id="questionTabs">
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab" data-type="">전체</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab" data-type="signup">회원가입/정보</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab" data-type="orderBuy">상품구매/주문</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab" data-type="payment">결제/배송</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab" data-type="return">교환/반품</a></li>
								<li class="nav-item me-2"><a href="#allTab"
									class="nav-link active px-2" data-bs-toggle="tab" data-type="etc">기타</a></li>
							</ul>
							<div class="tab-content p-4">
								<div class="tab-pane fade show active" id="allTab">

									<!-- BEGIN input-group -->
									<div class="market-searchbar">
										<div class="input-group flex-nowrap" data-target-form="centersearchform">
											<div class="flex-fill search-align">
												<div>
													<select class="select-bar-box" id="searchSelectType" name="searchType" value="search">
														<option value="">전체</option>
														<option value="title">제목</option>
														<option value="writer">작성자</option>
													</select>
													<div role="separator" class="dropdown-divider"></div>
												</div>
												<div class="custom-search-bar">
													<input type="text" id="inputContent" name="searchWord" class="form-control ps-35px"
														placeholder="검색어을 입력하세요" onkeydown="keyDown(this,event)" style="font-size: 13px;">
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
													style="display: block"> 
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
									<div id="questionTabList">
									  <!--비동기 질문유형별 리스트 출력 -->
									</div>

<!-- 									페이지 조각 활용해 jsp 페이지 끼워 넣을수 있음 -->
<%-- 									<jsp:include page="centerMarketListFragment.jsp"/> --%>
				
					<!-- Pagination Start -->
					<div data-target-form="#centersearchform"
						class="ms-pro-pagination paging-area">
						<ul class="ms-pro-pagination-inner">
						 <c:out value="${pagingHTML}" escapeXml="false" />
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	<div class="ms-pro-pagination paging-area"> -->
	<!-- 		<ul class="ms-pro-pagination-inner"> -->
	<!-- 			<li><a class="active" href='javascript:;' data-page='1'>1</a></li> -->
					<!-- <li><a  href='javascript:;' data-page='2'>2</a></li> -->
					<!-- <li><a  href='javascript:;' data-page='3'>3</a></li> -->
	<!-- 		</ul> -->
	<!-- 	</div> -->
	<!-- Pagination End --


	<div class="qnaBtn">
		<a href="${cPath}/market/member/centerInsert" class="btn ms-btn-2">등록하기</a>
	</div>
</div>
<!--cart content End -->

<!-- 검색 폼 -->
<form:form id="centersearchform" method="get" action="${cPath}/market/member/centerMarketList" modelAttribute="condition">
	<input type="hidden" name="searchType" value="${condition.searchType}" />
	<input type="hidden" name="searchWord" value="${condition.searchWord}" />
	<input type="hidden" name="page" value="${page}" />
</form:form>


<%-- <script src="${cPath}/resources/js/app/utils/paging.js"></script> --%>
<script src="${cPath}/resources/js/app/market/board/marketQna.js"></script>	

