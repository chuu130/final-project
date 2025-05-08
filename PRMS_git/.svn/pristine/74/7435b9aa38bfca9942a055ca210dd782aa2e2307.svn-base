<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="ms-breadcrumb m-b-30">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row ms_breadcrumb_inner">
					<div class="col-md-6 col-sm-12">
						<h2 class="ms-breadcrumb-title">애견미용예약</h2>
					</div>
					<div class="col-md-6 col-sm-12">
<!-- 						ms-breadcrumb-list start -->
						<ul class="ms-breadcrumb-list">
							<li class="ms-breadcrumb-item"><a
								href="${cPath }/market/marketpage.do">Home</a></li>
							<li class="ms-breadcrumb-item active">애견미용예약</li>
						</ul>
<!-- 						ms-breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<section class="ms-single-product padding-b-30">
	<div class="container">
		<div class="row">
			<div class="ms-pro-rightside ms-common-rightside col-md-12">

				<!-- Single product content Start -->
				<div class="single-pro-block">
					<div class="single-pro-inner">

						<div class="row">
									<button onclick="history.back()" id="backbtn"><i class="bi bi-chevron-left"></i>뒤로가기</button>
<%-- 									<span class="smtitle">${franchise.franchiseNm }</span> --%>
									<div class="row mt-4" id="rowstyle">
									<h5 class="ms-single-title single-pro-desc" id="titlefont">애견미용예약</h5>
									<div class="ms-single-rating-wrap single-pro-desc p-0" id="reviewstyle">
<!-- 										<div class="ms-single-rating" style="padding-right: 15px;"> -->
<!-- 											<i class="msicon msi-star fill"></i> <i -->
<!-- 												class="msicon msi-star fill"></i> <i -->
<!-- 												class="msicon msi-star fill"></i> <i -->
<!-- 												class="msicon msi-star fill"></i> <i -->
<!-- 												class="msicon msi-star-o"></i> -->
<!-- 										</div> -->
<!-- 										<span class="ms-read-review" id="reviewstyle2"> |&nbsp;&nbsp;<a -->
<!-- 											href="#ms-spt-nav-review">10개의 리뷰</a> -->
<!-- 										</span> -->
										<span style="color:#3e9172;">${franchise.franchiseNm }</span>
									</div>
									</div>
<!-- 									<span class="bordercss"></span> -->


					<div class="row">
							<!--======== 날짜 시간 선택 ========-->
							<div class="single-pro-desc single-pro-desc-no-sidebar shadow p-3 mb-5 rounded col-sm-12 col-lg-4" id="datestyle">
								<div class="single-pro-content">

									<!-- default html -->
<!-- 									<input type="text" class="form-control" id="datepicker" placeholder="dd/mm/yyyy"> -->

 							<h3 class="ms-checkout-title" id="datetitle">날짜 및 시간 선택</h3>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>예약날짜</span>
											<div class="ms-pro-variation-content" style="width:40%">
												<div class="input-group">
												  <input type="hidden" id="franchiseId" value="${franchise.franchiseId}">
												  <input type="text" class="form-control" id="datepicker" placeholder="날짜를 선택하세요">
												  <label class="input-group-text" for="datepicker" style="height:35px;">
												    <i class="fa fa-calendar" id="fastyle"></i>
												  </label>
												</div>
											</div>
										</div>
									</div>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>예약시간</span>
											<div class="ms-pro-variation-content">
    											<ul id="optionsize">
												    <li class="time-slot"><span>9:00</span></li>
												    <li class="time-slot"><span>10:00</span></li>
												    <li class="time-slot"><span>11:00</span></li>
												    <li class="time-slot"><span>13:00</span></li>
												    <li class="time-slot"><span>14:00</span></li>
												    <li class="time-slot"><span>15:00</span></li>
												    <li class="time-slot"><span>16:00</span></li>
												    <li class="time-slot"><span>17:00</span></li>
												    <li class="time-slot"><span>18:00</span></li>
												</ul>
											</div>
										</div>
									</div>
									<h3 class="ms-checkout-title" id="optiontitle">옵션 선택</h3>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>미용옵션</span>
											<div class="ms-pro-variation-content">
												<ul id="optionsize">
												<c:forEach items="${beautyOption }" var="beauty">
													<li class="option-slot" data-value="${beauty.cmmnCodeNm }" data-price="${beauty.cmmnRemark2}"><span>${beauty.cmmnCodeNm }</span></li>
												</c:forEach>
<!-- 													<li class="active"><span>위생목욕</span></li> -->
												</ul>
											</div>
										</div>
									</div>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>반려동물몸무게</span>
											<div class="ms-pro-variation-content">
												<ul id="optionsize">
												<c:forEach items="${weightOption }" var="weight">
													<li class="weight-slot" data-value="${weight.cmmnCodeId}" data-price="${weight.cmmnRemark3 }"><span>${weight.cmmnRemark2 }</span></li>
												</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!--======== 반려동물 정보 입력 ========-->

							<div class="single-pro-desc single-pro-desc-no-sidebar m-t-991 shadow p-3 mb-5 rounded col-sm-12 col-lg-4"
								style="width: 40%; min-width: 500px;" >
															<div class="single-pro-content">
							<div class="ms-checkout-section">
							<div class="ms-checkout-content">
							<div class="ms-checkout-inner">
							<div class="ms-checkout-wrap m-b-30 padding-bottom-3" style="border: none;">
                                <div class="ms-checkout-block ms-check-bill">
                                    <h3 class="ms-checkout-title">반려동물 정보 입력</h3>
                                    <div class="ms-bl-block-content">
                                        <div class="ms-check-bill-form">
                                            <form:form action="${cPath }/market/member/beautyRes" id="petForm" method="post" modelAttribute="pet">
                                                <span class="ms-bill-wrap ms-bill-half" style="margin-top: 20px;">
                                                    <label>회원 이름</label>
                                                    <c:set value="${pageContext.request.userPrincipal}" var="authentication"/>
                                                    <c:set value="${authentication.principal }" var="principal"/>
                                                    <input id="inputstyle" type="text" value="${principal.realUser.memNm }" readonly />
                                                    <form:hidden id="memNo" path="memNo" value="${principal.realUser.memNo}"/>
                                                </span>
                                                <span class="ms-bill-wrap ms-bill-half" style="margin-top: 23px;">
                                                    <label>반려동물 이름 *</label>
                                                    <form:input id="inputstyle" path="petNm" type="text" required="true" />
                                                    <span class="invalid-feedback">이름을 입력하세요</span>
                                                </span>
                                                <span class="ms-bill-wrap ms-bill-half" style="margin-top: 23px;">
                                                    <label>반려동물 몸무게 *</label>
                                                    <form:input id="inputstyle" path="petWeight" type="number" required="true" class="kgstyle" />
                                                    <span>kg</span>
                                                    <span class="invalid-feedback">숫자를 입력하세요</span>
                                                    <!-- 대중소 구분 -->
                                                    <form:input type="hidden" id="petSe" path="petSe" />
                                                </span>
                                                <span class="ms-bill-wrap" style="margin-top: 23px;">
                                                    <label>반려동물 종 *</label>
                                                    <span class="ms-bl-select-inner" id="selectstyle">
                                                        <form:select path="petKnd" name="petKnd" class="ms-bill-select" required="true">
                                                            <option value>선택</option>
															<c:forEach items="${petOption }" var="pOption">
																<option label="${pOption.cmmnCodeNm}" value="${pOption.cmmnCodeId }"
																	${pOption.cmmnCodeNm eq pet.petKnd ? "selected" : "" }
																/>
															</c:forEach>
                                                        </form:select>
                                                    </span>
                                                </span>
                                            </form:form>
                                            <!-- 예약 정보 입력 폼 -->
											<form:form action="${cPath }/market/member/beautyRes" id="resForm" method="post" modelAttribute="res">
											    <form:hidden path="franchiseId" value="${franchise.franchiseId}" />
											    <form:hidden path="resBeautyDe" id="resBeautyDe" required="true" />
											    <form:hidden path="resBeautyTime" id="resBeautyTime" required="true" />
											    <form:hidden path="resBeautyPrice" id="resBeautyPrice" required="true" />
											    <form:hidden path="empNo" id="empNo" required="true" />
												<form:hidden path="resOption" id="resOption" required="true"/>
												<form:hidden path="resOptionPrice" id="resOptionPrice" required="true" />
											</form:form>
                                        </div>

                                    </div>
                                </div>
                               		<div id="pricestyle" class="ms-single-price-stoke">
										<div class="ms-single-price">
											<div class="final-price" style="font-size: 20px;">
													0원
											</div>
										</div>
									</div>
<!-- 									<div id="pricestyle" class="ms-single-price-stoke"> -->
<!-- 										<span id="submitMsg"></span> -->
<!-- 									</div> -->
									<div id="pricestyle" class="ms-single-price-stoke">
										<div class="ms-single-price">
											<button type="button" id="submitBtn" class="btn ms-btn-2" style="font-size: 16px;">예약하기</button>
										</div>
									</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
					</div>

						</div>
					<!-- end row -->

					</div>
				</div>
				</div>


				<!-- Single product tab start -->
				<div class="ms-single-pro-tab">
					<div class="ms-single-pro-tab-wrapper">
						<div class="ms-single-pro-tab-nav">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation"><a
									class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#ms-spt-nav-details" role="tab"
									aria-selected="true">미용메뉴</a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" data-bs-toggle="tab"
									data-bs-target="#ms-spt-nav-info" role="tab"
									aria-selected="false" tabindex="-1">주의사항</a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" data-bs-toggle="tab"
									data-bs-target="#ms-spt-nav-vendor" role="tab"
									aria-selected="false" tabindex="-1">매장정보</a></li>
<!-- 								<li class="nav-item" role="presentation"><a -->
<!-- 									class="nav-link" data-bs-toggle="tab" -->
<!-- 									data-bs-target="#ms-spt-nav-review" role="tab" -->
<!-- 									aria-selected="false" tabindex="-1">리뷰</a></li> -->
							</ul>
						</div>
						<div class="tab-content  ms-single-pro-tab-content">
							<!-- ================== 미용메뉴 ===================== -->
							<div id="ms-spt-nav-details" class="tab-pane fade active show"
								role="tabpanel">
								<div class="ms-single-pro-tab-moreinfo">
									<h6 style="font-weight: 600;">* 5kg미만 제외 몸무게별 추가요금 있습니다.</h6>
									<p>&nbsp;&nbsp;15kg미만 +20,000원 / 25kg미만 +50,000원 / 40kg미만 +100,000원</p>
									<ul>

										<c:forEach items="${beautyOption }" var="beauty">
													<li><span>${beauty.cmmnCodeNm }</span> <fmt:formatNumber value="${beauty.cmmnRemark2}" type="number" groupingUsed="true"/>원</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- ================== 주의사항 ===================== -->
							<div id="ms-spt-nav-info" class="tab-pane fade" role="tabpanel">
								<div class="ms-single-pro-tab-desc">
									<h6>필독! 예약 전 주의사항 꼭 읽어주세요.</h6>
									<br>
									<ul>
										<li>1타임에 1마리의 반려동물만을 위한 미용을 원칙으로 합니다.</li>
										<li>미용 중간 쉬는 시간을 가지며, 아이의 성향과 컨디션에 맞추어 미용 시간은 단축되거나 연장될 수 있습니다.</li>
										<li>미용 중에는 반려견의 안전을 위해 연락이 어려울 수 있는 점 양해 부탁드립니다.</li>
										<li>예약 시간으로부터 20분 이상 지각하실 경우 다음 타임 고객님께 피해가 가지 않도록 받으실 수 있는 서비스가 변경될 수 있습니다.</li>
										<li>예약 시간으로부터 30분 이상 지각하실 경우 노쇼로 간주되며 예약금 환불 없이 자동으로 예약 취소가 됩니다.</li>
										<li>당일 예약 취소 시 환불이 불가합니다. 신중한 예약 부탁드립니다.</li>
									</ul>
									<p style="color:red;">※주의사항 미숙지 후 발생한 피해는 책임지지 않습니다.</p>
								</div>
							</div>
							<!-- ================== 매장정보 ===================== -->
							<div id="ms-spt-nav-vendor" class="tab-pane fade" role="tabpanel">
								<div class="ms-single-pro-tab-moreinfo">
									<div class="ms-product-vendor">
										<div class="ms-vendor-info">
											<span>
											<img src="${cPath }/resources/images/7959556.jpg" alt="vendor">
											</span>
											<div>
												<h5 style="font-size: 18px;">${franchise.franchiseNm }</h5>
												<p>점주 ${franchise.empNm }</p>
											</div>
										</div>
										<div class="ms-detail">
											<ul>
												<li><span>전화번호 :</span> ${franchise.franchiseTel }</li>
												<li><span>이메일 :</span> ${franchise.franchiseEmail }</li>
												<li><span>우편번호 :</span> ${franchise.franchiseZip }</li>
												<li><span>주소 :</span> ${franchise.franchiseAdd1 }&nbsp;${franchise.franchiseAdd2 }</li>
											</ul>
											<p></p>
										</div>
									</div>
								</div>
							</div>

							<!-- ================== 리뷰 ===================== -->
<!-- 						<div id="ms-spt-nav-review" class="tab-pane fade" role="tabpanel"> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="ms-t-review-wrapper"> -->
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${not empty beautyList}"> --%>
<%-- 											<c:forEach items="${beautyList}" var="beauty"> --%>
<!-- 														<div class="ms-t-review-item"> -->
<!-- 															<div> -->
<!-- 															데이터베이스에서 가져온 경로 -->
<%-- 															<c:set var="filePath" value="${beauty.franreviewImage}" /> --%>
<!-- 															경로 변환 이미지 DB에 직접넣을때 설정 -->
<%-- 															<c:set var="webPath" value="${filePath.replace('D:\\\\saveFiles\\\\', '/files/')}" /> --%>
<!-- 															이미지 출력 -->
<%-- 															<img src="${cPath }${webPath}" alt="미용 이미지" style="width: 180px; height: 150px; margin-right: 20px;"/> --%>
<!-- 															</div> -->
<!-- 															<div class="ms-t-review-content"> -->
<!-- 																<div class="ms-t-review-top"> -->
<!-- 																	<div class="ms-t-review-name"> -->
<%-- 																		<span class="fs-6">${beauty.franreviewSj }</span><br> --%>
<%-- 																		<small class="fs-6"> 욥션 ${beauty.resOption }</small><br> --%>
<%-- 																		<small class="ms-6">${beauty.resBeautyDe }/${beauty.resBeautyTime }</small> --%>
<!-- 																	</div> -->
<%-- 																	<small class="ms-6">${beauty.memNm }</small> --%>
<!-- 																	<div> -->
<%-- 																		<c:forEach begin="0" end="4" varStatus="loopStatus"> --%>
<%-- 																			<c:if --%>
<%-- 																				test="${loopStatus.index + 1 <= beauty.franreviewScore}"> --%>
<!-- 																				<i class="msicon msi-star fill"></i> -->
<%-- 																			</c:if> --%>
<%-- 																			<c:if --%>
<%-- 																				test="${loopStatus.index + 1 > beauty.franreviewScore}"> --%>
<!-- 																				<i class="msicon msi-star-o"></i> -->
<%-- 																			</c:if> --%>
<%-- 																		</c:forEach> --%>
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<div class="ms-t-review-bottom"> -->
<%-- 																	<p style="width: 90%;">${beauty.franreviewCn }</p> --%>
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<%-- 													</c:forEach> --%>
<%-- 												</c:when> --%>
<%-- 												<c:otherwise> --%>
<!-- 													<p>해당 상품은 리뷰가 존재하지 않습니다.</p> -->
<%-- 												</c:otherwise> --%>
<%-- 									</c:choose> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
							<!-- ================== 리뷰 ===================== -->

				<!-- product details description area end -->

</section>
<script>
    const memNo = "${principal.realUser.memNo}";
</script>
<script src="${cPath }/resources/js/app/market/payment/marketbeautyPayment.js"></script>
