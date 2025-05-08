<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section class="ms-blog padding-tb-30">
        <div class="container">
            <div class="row">
					<!-- Sidebar Area Start -->
	                <div class="ms-blogs-sidebar ms-blogs-leftside col-lg-3 order-lg-first col-md-12 order-md-last m-t-991">
	                    <div class="ms-blog-sidebar-wrap">
	                        <!-- Sidebar Recent Blog Block -->
	                        <div class="ms-sidebar-block ms-sidebar-recent-blog">
	                            <div class="ms-sb-title">
	                                <h3 class="ms-sidebar-title">마이페이지 메뉴</h3>
	                            </div>
	                            <div class="ms-blog-block-content ms-sidebar-dropdown">
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memId }/mypage" var="memMypage"/>
	                                        <a href="${memMypage }">회원상세</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/orderList" var="memOrder"/>
	                                        <a href="${memOrder }">상품주문내역</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memNo }/beautyResDetail" var="beautyResDetail"/>
	                                        <a href="${beautyResDetail }">미용예약내역</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memNo }/hotelResDetail" var="hotelResDetail"/>
	                                        <a href="${hotelResDetail }">호텔예약내역</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memberVO.memNo }/memcoupon"
		                                    		var="memCouUrl" />
	                                        <a href="${memCouUrl}">보유 쿠폰</a>
	                                    </div>
	                                </div>
	                                <div class="ms-sidebar-block-item">
										<div class="ms-sidebar-block-detial">
											<c:url value="/market/member/${memberVO.memNo }/memreview"
												var="memReviewUrl" />
											<a href="${memReviewUrl}">내가 쓴 리뷰</a>
										</div>
									</div>
	                            </div>
	                        </div>
	                        <!-- Sidebar Recent Blog Block -->
	                    </div>
	                </div>

                    <!-- content Start -->
                   <div class="ms-blogs-rightside col-lg-9 order-lg-last col-md-12 order-md-first">
                    <div class="ms-blogs-content">
                        <div class="ms-blogs-inner">
                            <div class="row">
                            <div class="section-title-2" id="titleresdt">
                            	<h2 class="ms-title">호텔예약내역</h2>
							</div>
								<c:if test="${not empty resList }">
								<c:forEach items="${resList }" var="res">
	                                <div class="col-md-12 col-sm-12 mb-6 ms-blog-block">
	                                    <div class="ms-blog-item">
	                                        <div class="news-info" style="padding: 0 24px 10px 24px;">
	                                            <div class="detail">
	                                                <label id="tmstyle">${res.resHotelRegistDe}</label>
<%-- 	                                                <label id="tmstyle"><fmt:formatDate value="${res.resHotelRegistDe}" pattern="yyyy-MM-dd HH:mm:ss" /></label> --%>
	                                                <h3 class="resinfotitle" style="margin-top: 0;">${res.franchiseNm }</h3>
	                                                <div class="row" style="margin-left:0">
	                                                <p class="text-length col" style="font-size:15px;">예약날짜 : ${res.resHotelInDe } ~ ${res.resHotelOutDe }
	                                                	<br>입실시간 :  ${res.resHotelInTime }
	                                                	<br>예약상태 : ${res.cmmnCodeNm }
	                                                	<br>호텔타입 : ${res.hotelNm }
	                                                	<br>호텔가격 : <fmt:formatNumber value="${res.resHotelPrice }" />원
	                                                		(+ 레이트 체크아웃 <fmt:formatNumber value="${res.resHotelLateout  }" />원)
	                                                <c:if test="${res.cmmnCodeNm eq '예약완료'}">
	                                                <div class="more-info col" id="cancel">
	                                                    <input type="button" value="예약취소" id="allbtn" class="cancelBtn" data-index="${res.resHotelNo}"/>
	                                                </div>
	                                                <form action="${cPath }/market/member/${res.resHotelNo}/hotelCancel" method="post" class="cancelForm" data-index="${res.resHotelNo}">
														<input type="hidden" name="resHotelNo" value="${res.resHotelNo}" required />
													</form>
	                                                </c:if>
<%-- 	                                                <c:if test="${res.cmmnCodeNm eq '이용완료'}"> --%>
<!-- 													<div class="more-info col" id="cancel"> -->
<%-- 	                                                    <input type="button" value="리뷰작성" id="allbtn" class="reviewBtn" data-index="${res.resHotelNo}"/> --%>
<!-- 	                                                </div> -->
<%-- 	                                                <form action="${cPath }/" method="post" class="reviewForm" data-index="${res.resHotelNo}"> --%>
<%-- 														<input type="hidden" name="resHotelNo" value="${res.resHotelNo}" required /> --%>
<%-- 													</form> --%>
<%-- 	                                                </c:if> --%>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                </c:forEach>
	                                </c:if>
                            </div>
                        </div>
						<!-- Pagination Start -->
                        <div class="ms-pro-pagination paging-Area">
                            <ul class="ms-pro-pagination-inner">
                            	${pagingHTML }
                            </ul>
                        </div>
						<form:form id="searchForm" method="get" modelAttribute="condition">
							<form:input type="hidden" path="searchType"/>
							<form:input type="hidden" path="searchWord"/>
							<input type="hidden" name="page" />
						</form:form>
                        <!-- Pagination End -->
	                    </div>
                    <!--Blog content End -->
                </div>
              </div>
              <!-- row End -->
            </div>
        </div>
    </section>

<c:if test="${not empty message }">
<script>
	Swal.fire({
		 title: "${message}",
	    text: '',
	    icon: 'success', // 성공 아이콘
	    confirmButtonColor: '#3e9172'
		});
</script>
<c:remove var="message" scope="session"/>
</c:if>
<script>
document.querySelectorAll(".cancelBtn").forEach((button) => {
    button.addEventListener("click", () => {
    	const index = button.getAttribute('data-index');
        const cancelForm = document.querySelector(`.cancelForm[data-index="\${index}"]`)
        console.log(cancelForm); // cancelForm이 제대로 선택되었는지 확인
        Swal.fire({
            title: '예약을 취소하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3e9172',
            cancelButtonColor: '#cecece',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then(result => {
            if (result.isConfirmed) {
            	cancelForm.submit(); // 폼을 제출
            }
        });
    });
});

</script>