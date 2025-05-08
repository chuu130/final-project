<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">애견미용예약</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="${cPath }/market/marketpage.do">Home</a></li>
                                <li class="ms-breadcrumb-item active">애견미용예약</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- 검색 -->
<!-- <div class="align-self-center ms-header-search"> -->
<!-- 	<div id="body-search" class="header-search"> id searchUI -->
<%-- 		<form class="ms-search-group-form"> --%>
<!-- 				<input class="form-control ms-search-bar" placeholder="검색어를 입력하세요" type="text" id="searchWord" name="searchWord" /> -->
<!-- 				<input type="hidden" id="searchType" name="searchType" value="search"> -->
<!-- 				<button id="searchBtn" class="search_submit" type="button"> -->
<%-- 					<img src="${cPath }/resources/Masterkart/masterkart-html/assets/img/icons/search.svg" class="svg_img search_svg" alt=""> --%>
<!-- 				</button> -->
<%-- 		</form> --%>
<!-- 	</div> -->
<!-- </div> -->

<section class="ms-blog padding-tb-30">
        <div class="container">
            <div class="row">
                <div class="ms-blogs-rightside col-md-12">

                    <!-- Blog content Start -->
                    <div class="ms-blogs-content">
                        <div class="ms-blogs-inner">
                            <div class="row">
                            <c:if test="${not empty franchiseList }">
							<c:forEach items="${franchiseList }" var="fran">
                                <div class="col-lg-3 col-md-6 col-sm-12 mb-6 ms-blog-block">
                                    <div class="ms-blog-item">
                                        <div class="news-info">
                                            <figure class="news-img"><a href="${cPath }/market/member/beautyRes/${fran.franchiseId }"><img src="${cPath}/resources/images/7959556.jpg" alt="news imag"></a>
                                            </figure>
<!--                                             <figure class="news-img"><a href="#"><img src="https://www.qplace.kr/content/images/2021/08/8-19.jpg" alt="news imag"></a> -->
<!--                                             </figure> -->
                                            <div class="detail">
<!--                                                 <label>June 30,2022 - <a href="#">Organic</a></label> -->
                                                <h3><a href="#">${fran.franchiseNm }</a></h3>
                                                <p class="text-length" style="height: 40px;">${fran.franchiseZip }&nbsp;${fran.franchiseAdd1 }&nbsp;${fran.franchiseAdd2 }</p>
                                                <div class="more-info" id="resbtn">
                                                    <a href="${cPath }/market/member/beautyRes/${fran.franchiseId }">예약하기<span></span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </c:forEach>
                             </c:if>
                             <c:if test="${empty franchiseList }">
								미용 가능한 가맹점이 없습니다.
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
        </div>
    </section>

<c:if test="${not empty message }">
<script>
Swal.fire({
	  title: "${message}",
	  text: "로그인 후 이용해주세요 :)",
	  icon: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#3e9172",
	  cancelButtonColor: "#cecece",
	  confirmButtonText: "로그인"
	}).then((result) => {
	  if (result.isConfirmed) {
		  window.location.href = "${cPath }/market/login";
	  }
	});
</script>
<c:remove var="message" scope="session"/>
</c:if>
