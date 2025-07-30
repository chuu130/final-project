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
						<h2 class="ms-breadcrumb-title">애견호텔예약</h2>
					</div>
					<div class="col-md-6 col-sm-12">
<!-- 						ms-breadcrumb-list start -->
						<ul class="ms-breadcrumb-list">
							<li class="ms-breadcrumb-item"><a
								href="${cPath }/market/marketpage.do">Home</a></li>
							<li class="ms-breadcrumb-item active">애견호텔예약</li>
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
									<h5 class="ms-single-title single-pro-desc" id="titlefont">애견호텔예약</h5>
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

 							<h3 class="ms-checkout-title" id="datetitle" style="margin-bottom: 46px;">예약 날짜 및 시간</h3>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>예약날짜</span>
											<div class="ms-pro-variation-content" style="width:40%">
<!-- 												<div class="input-group"> -->
													  ${resInfo.resHotelInDe} ~ ${resInfo.resHotelOutDe}
<%-- 												  <input type="text" class="form-control" id="resHotelInDe" value="${resInfo.resHotelInDe}"> --%>
<%-- 												  <input type="text" class="form-control" id="resHotelOutDe" value="${resInfo.resHotelOutDe}"> --%>
<!-- 												  <input type="text" class="form-control" id="datepicker" placeholder="날짜를 선택하세요"> -->
<!-- 												  <label class="input-group-text" for="datepicker" style="height:35px;"> -->
<!-- 												    <i class="fa fa-calendar" id="fastyle"></i> -->
<!-- 												  </label> -->
<!-- 												</div> -->
											</div>
										</div>
									</div>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>입실시간</span>
											<div class="ms-pro-variation-content">
    											<ul id="optionsize">
												    <li class="time-slot"><span>12:00</span></li>
												    <li class="time-slot"><span>13:00</span></li>
												    <li class="time-slot"><span>14:00</span></li>
												    <li class="time-slot"><span>15:00</span></li>
												    <li class="time-slot"><span>16:00</span></li>
												    <li class="time-slot"><span>17:00</span></li>
												    <li class="time-slot"><span>18:00</span></li>
												    <li class="time-slot"><span>19:00</span></li>
												    <li class="time-slot"><span>20:00</span></li>
												</ul>
											</div>
										</div>
									</div>
									<h3 class="ms-checkout-title" id="optiontitle">호텔방 타입 및 옵션</h3>
									<div class="ms-pro-variation">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>객실타입</span>
											<div class="ms-pro-variation-content">
												<ul id="optionsize">
												<c:forEach items="${roomOption }" var="room">
													<c:choose>
													<c:when test="${room.cmmnCodeNm eq hotelroom.hotelNm}">
														<li class="option-slot active"><span>${room.cmmnRemark2}</span></li>
													</c:when>
													<c:otherwise>
														<li class="option-slot data-disabled" style="pointer-events:none;cursor:default;"><span>${room.cmmnRemark2}</span></li>
													</c:otherwise>
													</c:choose>
												</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<div class="ms-pro-variation" style="margin-bottom: 0;">
										<div class="ms-pro-variation-inner ms-pro-variation-size">
											<span>레이트 체크아웃(1박 금액의 50% 추가)</span>
											<div class="ms-pro-variation-content">
											<ul id="optionsize">
												<li class="latecheckout"><span>선택안함</span></li>
												<li class="latecheckout"><span>추가하기</span></li>
											</ul>
<!-- 												<span class="ms-new-option"> -->
<!--                                                 <span> -->
<!--                                                     <input type="radio" id="account1" name="radio-group" checked=""> -->
<!--                                                     <label for="account1">선택안함</label> -->
<!--                                                 </span> -->
<!--                                                 <span> -->
<!--                                                     <input type="radio" id="account2" name="radio-group"> -->
<!--                                                     <label for="account2">선택</label> -->
<!--                                                 </span> -->
<!--                                             	</span> -->
											</div>
										</div>
									</div>
<!-- 									<div class="ms-pro-variation"> -->
<!-- 										<div class="ms-pro-variation-inner ms-pro-variation-size"> -->
<!-- 											<span>반려동물몸무게</span> -->
<!-- 											<div class="ms-pro-variation-content"> -->
<!-- 												<ul id="optionsize"> -->
<%-- 												<c:forEach items="${weightOption }" var="weight"> --%>
<%-- 													<li class="weight-slot" data-value="${weight.cmmnCodeId}"><span>${weight.cmmnRemark2 }</span></li> --%>
<%-- 												</c:forEach> --%>
<!-- 												</ul> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
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
                                            <form:form action="${cPath }/market/member/hotelRes" id="petForm" method="post" modelAttribute="pet">
                                                <span class="ms-bill-wrap ms-bill-half" style="margin-top: 20px;">
                                                    <label>회원 이름</label>
                                                    <c:set value="${pageContext.request.userPrincipal}" var="authentication"/>
                                                    <c:set value="${authentication.principal }" var="principal"/>
                                                    <input id="inputstyle" type="text" value="${principal.realUser.memNm }" readonly />
                                                    <form:hidden path="memNo" value="${principal.realUser.memNo }"/>
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
											<form:form action="${cPath }/market/member/hotelRes/hotel/${hotelroom.hotelId }" id="resForm" method="post" modelAttribute="res">
											    <form:hidden path="hotelId" value="${hotelroom.hotelId}" />
											    <form:hidden path="resHotelInDe" value="${resInfo.resHotelInDe }" required="true" />
											    <form:hidden path="resHotelOutDe" value="${resInfo.resHotelOutDe }" required="true" />
											    <form:hidden path="resHotelInTime" id="resHotelInTime" required="true" />
												<form:hidden path="resHotelPrice" id="hotelTotalPrice" value="${resInfo.resHotelPrice }" required="true" />
											    <form:hidden path="resHotelLateout" id="resHotelLateout" required="true" />
											</form:form>
                                        </div>

                                    </div>
                                </div>
                               		<div id="pricestyle" class="ms-single-price-stoke">
										<div class="ms-single-price">
											<div class="final-price" style="font-size: 20px;">
													총액 <fmt:formatNumber value="${resInfo.resHotelPrice }"/>원
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
									aria-selected="true">호텔방상세</a></li>
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
							<!-- ================== 호텔상세 ===================== -->
							<div id=ms-spt-nav-details class="tab-pane fade show active" role="tabpanel">
								<div class="ms-single-pro-tab-desc ms-single-pro-tab-moreinfo">
									<div class="row">
									<div class="ms-product-vendor col-sm-12 col-md-4" style="width: fit-content;">
										<div class="ms-vendor-info" style="margin-bottom: 30px;">
											<span><img src="${hotelroom.hotelImage }" alt="image" style="width: 400px;">
											</span>
<!-- 											<div> -->
<%-- 												<h5>${hotelroom.hotelNm }</h5> --%>
<%-- 												<p>호텔타입 : ${hotelroom.hotelType }</p> --%>
<%-- 												<p>1박 가격 : <fmt:formatNumber value="${hotelroom.hotelPrice }"/>원</p> --%>
<!-- 											</div> -->
										</div>
									</div>
									<div class="col-sm-12 col-md-7" id="hotellistyle">
									<ul style="margin-bottom:0">
										<li><span>지점</span>${franchise.franchiseNm}</li>
										<li><span>호텔방</span>${hotelroom.hotelNm }</li>
										<li><span>호텔방타입</span>${hotelroom.hotelType }</li>
										<li id="hotelPrice" data-price="${hotelroom.getHotelPrice()}">
												<span>가격</span><fmt:formatNumber value="${hotelroom.hotelPrice }"/>원
										</li>
									</ul>
									</div>
									</div>
									<p style="margin-bottom: 40px;">* 레이트 체크아웃 금액은 1박 금액의 50%입니다.</p>
									<h6 style="font-weight: 500;">호텔 이용시 기본제공 서비스</h6>
									<p>${hotelroom.hotelInfo }</p>
								</div>
							</div>
							<!-- ================== 주의사항 ===================== -->
							<div id="ms-spt-nav-info" class="tab-pane fade" role="tabpanel">
								<div class="ms-single-pro-tab-desc">
									${hotelroom.hotelDetail }
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
<!-- 							<div id="ms-spt-nav-review" class="tab-pane fade" role="tabpanel"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="ms-t-review-wrapper"> -->
<!-- 										<div class="ms-t-review-item"> -->
<!-- 											<div class="ms-t-review-avtar"> -->
<!-- 												<img src="assets/img/user/1.jpg" alt="user"> -->
<!-- 											</div> -->
<!-- 											<div class="ms-t-review-content"> -->
<!-- 												<div class="ms-t-review-top"> -->
<!-- 													<div class="ms-t-review-name">Mariya Lykra</div> -->
<!-- 													<div class="ms-t-review-rating"> -->
<!-- 														<i class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star-o"></i> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="ms-t-review-bottom"> -->
<!-- 													<p>Lorem Ipsum is simply dummy text of the printing and -->
<!-- 														typesetting industry. Lorem Ipsum has been the industry's -->
<!-- 														standard dummy text ever since the 1500s, when an unknown -->
<!-- 														printer took a galley of type and scrambled it to make a -->
<!-- 														type specimen.</p> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="ms-t-review-item"> -->
<!-- 											<div class="ms-t-review-avtar"> -->
<!-- 												<img src="assets/img/user/2.jpg" alt="user"> -->
<!-- 											</div> -->
<!-- 											<div class="ms-t-review-content"> -->
<!-- 												<div class="ms-t-review-top"> -->
<!-- 													<div class="ms-t-review-name">Moris Willson</div> -->
<!-- 													<div class="ms-t-review-rating"> -->
<!-- 														<i class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star-o"></i> <i -->
<!-- 															class="msicon msi-star-o"></i> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="ms-t-review-bottom"> -->
<!-- 													<p>Lorem Ipsum has been the industry's standard dummy -->
<!-- 														text ever since the 1500s, when an unknown printer took a -->
<!-- 														galley of type and scrambled it to make a type specimen.</p> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 									</div> -->
<!-- 									<div class="ms-ratting-content"> -->
<!-- 										<h3>Add a Review</h3> -->
<!-- 										<div class="ms-ratting-form"> -->
<%-- 											<form action="#"> --%>
<!-- 												<div class="ms-ratting-star"> -->
<!-- 													<span>Your rating:</span> -->
<!-- 													<div class="ms-t-review-rating"> -->
<!-- 														<i class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star fill"></i> <i -->
<!-- 															class="msicon msi-star-o"></i> <i -->
<!-- 															class="msicon msi-star-o"></i> <i -->
<!-- 															class="msicon msi-star-o"></i> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="ms-ratting-input"> -->
<!-- 													<input name="your-name" placeholder="Name" type="text"> -->
<!-- 												</div> -->
<!-- 												<div class="ms-ratting-input"> -->
<!-- 													<input name="your-email" placeholder="Email*" type="email" -->
<!-- 														required=""> -->
<!-- 												</div> -->
<!-- 												<div class="ms-ratting-input form-submit"> -->
<!-- 													<textarea name="your-commemt" -->
<!-- 														placeholder="Enter Your Comment"></textarea> -->
<!-- 													<button class="ms-btn-2" type="submit" value="Submit">Submit</button> -->
<!-- 												</div> -->
<%-- 											</form> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!-- ================== 리뷰 ===================== -->
						</div>
					</div>
				</div>
				<!-- product details description area end -->
			</div>
		</div>
</section>

<c:if test="${not empty petErrors }">
<script>
	Swal.fire("${petErrors}", "", "success");
</script>
<c:remove var="petErrors" scope="session"/>
</c:if>
<script>
$(document).ready(function() {

	function getCurrentTimeAsNumber() {
        var now = new Date();
        var hours = String(now.getHours()).padStart(2, '0'); // 시간을 두 자리로 변환
        var minutes = String(now.getMinutes()).padStart(2, '0'); // 분을 두 자리로 변환
        return parseInt(hours + minutes); // "HHMM" 형식의 숫자로 반환
    }

    function convertTimeStringToNumber(timeString) {
        return parseInt(timeString.replace(':', '')); // "HH:MM"을 "HHMM" 숫자로 변환
    }

    function disablePastTimes() {
        var today = new Date().toISOString().split('T')[0]; // 오늘 날짜 (yyyy-mm-dd)
        var checkInDate = '${resInfo.resHotelInDe}'; // 체크인 날짜 (문자열)

        if (today === checkInDate) {
            var currentTime = getCurrentTimeAsNumber();
            $('#optionsize li.time-slot').each(function() {
                var timeSlot = $(this).text().trim();
                var timeSlotNumber = convertTimeStringToNumber(timeSlot);

                if (timeSlotNumber <= currentTime) {
                    $(this).addClass('data-disabled').css({
                        'color': '#ccc', // 비활성화 색상
                        'pointer-events': 'none', // 클릭 이벤트 비활성화
                        'cursor': 'default' // 커서를 기본 상태로
                    }).removeClass('selected');
                }
            });
        }
    }

    // 입실시간 선택 시 이벤트 처리
    $('#optionsize li.time-slot').on('click', function() {
        $(this).addClass('selected').siblings().removeClass('selected');
        // 선택된 입실시간 값을 resHotelInTime에 저장
        $('#resHotelInTime').val($(this).text().trim());
    });

    // 레이트 체크아웃 선택 시 이벤트 처리
    $('#optionsize li.latecheckout').on('click', function() {
        $(this).addClass('selected').siblings().removeClass('selected');

        // hotelPrice 가져오기
        var hotelPrice = parseInt($('#hotelPrice').data('price'));

        // 선택한 옵션에 따라 lateCheckoutPrice 계산
        if ($(this).text().trim() === '추가하기') {
            var lateCheckoutPrice = hotelPrice / 2;
            $('#resHotelLateout').val(lateCheckoutPrice);
        } else {
            $('#resHotelLateout').val(0);  // 선택안함 클릭 시 0으로 설정
        }

        // 총액 업데이트
        updateFinalPrice();
    });

    function updateFinalPrice() {
        // 호텔 가격 가져오기
        var hotelTotalPrice = parseInt($('#hotelTotalPrice').val()) || 0;

        // latecheckout 가격 가져오기
        var lateCheckoutPrice = parseInt($('#resHotelLateout').val()) || 0;

        // 두 가격의 합산 계산
        var totalPrice = hotelTotalPrice + lateCheckoutPrice;

        // 합산된 가격을 화면에 표시
        if (totalPrice === 0) {
            $('.final-price').text('총액');
        } else {
            $('.final-price').text('총액 ' + totalPrice.toLocaleString() + '원');
        }

    }

    $('#submitBtn').on('click', function() {
        const form1 = document.getElementById("petForm");
        const form2 = document.getElementById("resForm");

        // 폼 요소가 모두 존재하는지 확인
        if (!form1 || !form2) {
            console.error("One or more forms not found");
            return;
        }

        const isForm1Valid = form1.checkValidity();
        const isForm2Valid = form2.checkValidity();

        // 폼에 유효성 검사 스타일을 추가
        if (!isForm1Valid) form1.classList.add('was-validated');
        if (!isForm2Valid) form2.classList.add('was-validated');

        if (!isForm1Valid || !isForm2Valid) {
            Swal.fire({
                title: "모든 정보를 입력해주세요",
                confirmButtonColor: '#3e9172',
                showClass: {
                    popup: 'animate__animated animate__fadeInUp animate__faster'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutDown animate__faster'
                }
            });
        } else {
            Swal.fire({
                title: '예약하시겠습니까?',
                text: '예약 전 주의사항을 꼭 읽어주세요!',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3e9172',
                cancelButtonColor: '#cecece',
                confirmButtonText: '예약',
                cancelButtonText: '취소'
            }).then(result => {
                if (result.isConfirmed) {
                    // 각 폼의 데이터를 가져옵니다.
                    var petFormData = new FormData(form1);
                    var resFormData = new FormData(form2);

                    // FormData의 내용을 출력하기 위해 반복문을 사용
                    console.log("반려동물 폼 내용:");
                    for (var pair of petFormData.entries()) {
                        console.log(pair[0] + ': ' + pair[1]);
                    }

                    console.log("예약정보 폼 내용:");
                    for (var pair of resFormData.entries()) {
                        console.log(pair[0] + ': ' + pair[1]);
                    }

                    // 하나의 FormData 객체에 모든 데이터를 병합합니다.
                    var combinedFormData = new FormData();
                    for (var [key, value] of petFormData.entries()) {
                        combinedFormData.append(key, value);
                    }
                    for (var [key, value] of resFormData.entries()) {
                        combinedFormData.append(key, value);
                    }

                    // Ajax를 사용하여 데이터를 전송합니다.
                    fetch("${cPath}/market/member/hotelRes/hotel/${hotelroom.hotelId}", {
                        method: "POST",
                        body: combinedFormData
                    }).then(response => {
                        // 응답 처리 로직을 여기에 추가합니다.
                        	console.log("서버 응답 데이터:", response);
                        if (response.ok) {
                        	Swal.fire({
        						title: '예약이 완료되었습니다.',
        						text:'',
        						icon:'success',
        						confirmButtonColor: '#3E9172'
                        	}).then(() => {
                                window.location.href = "${cPath}/market/member/" + ${principal.realUser.memNo} + "/hotelResDetail";
                            });
                        } else {
                        	Swal.fire({
        						title: '예약 중 오류가 발생했습니다.',
        						text:'',
        						icon:'error',
        						confirmButtonColor: '#3E9172'
                        	});
                        }
                    }).catch(error => {
                        console.log("폼 전송 중 오류 발생:", error);
                    	Swal.fire({
    						title: '예약 중 오류가 발생했습니다.',
    						text:'',
    						icon:'error',
    						confirmButtonColor: '#3E9172'
                    	});
                    });
                }
            });
        }
    });

 	// 페이지 로드 시 시간 옵션을 비활성화하는 함수 호출
    disablePastTimes();
});
</script>
