<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketBoard.css">
	

<!-- 마켓공지사항 리스트페이지 -->
<div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">공지사항</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="${cPath }/market/marketpage.do">Home</a></li>
                                <li class="ms-breadcrumb-item active">공지사항</li>
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
		<!-- 	일단 나중이 이속성 테이블 정렬할때 확인할것 써먹기 -->
		<!-- 		<div class="ms-cart-leftside col-lg-8 col-md-12 "> -->

		<!-- cart content Start -->
		<div class="ms-cart-content">
			<div class="ms-cart-inner">
				<div class="row" id="noticeMarket">
					<form action="#">
						<div class="table-content cart-table-content">

							<!-- BEGIN input-group -->
							<div class="market-searchbar">
							    <div class="input-group flex-nowrap" data-target-form="#ej-form">
							        <div class="flex-fill search-align" >
							        <div>
							            <select class="select-bar-box" name="searchType" value="search">
							                <option value="">전체</option>
							                <option value="title">제목</option>
							                <option value="writer">작성자</option>
							            </select>
							            <div role="separator" class="dropdown-divider"></div>
							        </div>
							            <div class="custom-search-bar">
							                <input type="text" class="form-control ps-35px" placeholder="검색어을 입력하세요" name="searchWord" onkeydown="fejDown(this)" style="font-size: 13px;">
							                <button class="search_submit search-btn" type="button">
							                    <img src="${cPath}/resources/Masterkart/masterkart-html/assets/img/icons/search.svg" 
							                         class="svg_img search_svg" alt="검색">
							                </button>
							            </div>
							        </div>
							    </div>
							</div>
							<!-- END input-group -->
							

							<h4>공지사항</h4>
							<table>
								<thead>
									<tr>
										<th>NO</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty noticeList }">
										<c:forEach items="${noticeList }" var="notice">
											<tr>
												<td data-label="noticeNo" class="ms-cart-pro-price"><span
													class="amount">${notice.noticeBbsNo}</span></td>
												<td data-label="noticeNm" class="ms-cart-pro-name"><a
													href="/prms/market/member/${notice.noticeBbsNo}/notice"
													style="display: block"> <img
														class="ms-cart-pro-img mr-4"
														src="assets/img/product-images/1_1.jpg" alt="">
														${notice.noticeBbsNm}
												</a></td>
												<td data-label="Price" class="ms-cart-pro-price"><span
													class="amount">${notice.empId}</span></td>
												<td data-label="Total" class="ms-cart-pro-subtotal">${notice.noticeBbsDe}</td>
												<td data-label="Total" class="ms-cart-pro-subtotal">${notice.noticeBbsHit}</td>

												<!--                                                <td data-label="Remove" class="ms-cart-pro-remove"> -->
												<!--                                                  <a href="#"><i class="msicon msi-trash-o"></i></a> -->
												<!--                                                </td> -->
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</form>

					<!--cart content End -->
					<div data-target-form="#ej-form"
						class="ms-pro-pagination paging-area">
						<ul class="ms-pro-pagination-inner">${pagingHTML}
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>



	<!-- 검색 폼 -->
	<form id="ej-form" method="get" action="/prms/market/member/noticeList"
		modelAttribute="condition">
		<input type="hidden" name="searchType" value="${condition.searchType}" />
		<input type="hidden" name="searchWord" value="${condition.searchWord}" />
		<input type="hidden" name="page" value="${page}" />
	</form>

</div>

<script>
	const ejForm = document.querySelector("#ej-form");
	const searchType = document.querySelector("#searchType");
	function fejDown(pThis) {
		if (event.keyCode == 13) {   //Enter 키 코드값 13 / 엔터누르면 실행된다
			ejForm.searchType.value = ejType.value;
			ejForm.searchWord.value = pThis.value;
			// 			ejForm.submit();  
		}

	}
</script>
<!-- 마켓페이지 페이징 헤더설정 -->
<%-- <script src="${cPath}/resources/js/app/utils/paging.js"></script> --%>
