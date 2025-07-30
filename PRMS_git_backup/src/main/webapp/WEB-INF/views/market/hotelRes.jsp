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
<!-- 									<span class="smtitle"></span> -->
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


					<div class="row" style="justify-content: center;">
							<!--======== 날짜 시간 선택 ========-->
							<div class="single-pro-desc single-pro-desc-no-sidebar shadow rounded col-sm-12 col-lg-12" style="width: 100%;padding: 20px 20px 20px 40px;">
<!--     border: 1px solid #eee; -->
<!--     border-radius: 3px; -->
								<div class="single-pro-content">

									<!-- default html -->
<!-- 									<input type="text" class="form-control" id="datepicker" placeholder="dd/mm/yyyy"> -->

<!--  							<h3 class="ms-checkout-title" id="datetitle">날짜 및 시간 선택</h3> -->
									<div class="ms-pro-variation" style="margin:0;">
										<div class="ms-pro-variation-inner ms-pro-variation-size" style="margin:0;">
											<div class="row">
											<div class="ms-pro-variation-content" style="width: 40%;margin-right: 4%;margin-left: 2%;">
											<span>체크인날짜</span>
												<div class="input-group" style="margin-top: 10px;">
												  <input type="hidden" id="franchiseId" value="${franchise.franchiseId }">
												  <input type="text" class="form-control" id="datepicker1" placeholder="날짜를 선택하세요">
												  <label class="input-group-text" for="datepicker1" style="height:35px;">
												    <i class="fa fa-calendar" id="fastyle"></i>
												  </label>
												</div>
											</div>
											<div class="ms-pro-variation-content" style="width:40%">
											<span>체크아웃날짜</span>
												<div class="input-group" style="margin-top: 10px;">
												  <input type="text" class="form-control" id="datepicker2" placeholder="날짜를 선택하세요">
												  <label class="input-group-text" for="datepicker2" style="height:35px;">
												    <i class="fa fa-calendar" id="fastyle"></i>
												  </label>
												</div>
											</div>
											<div class="ms-pro-variation-content" style="width: 14%;display: flex;align-items: flex-end;justify-content: center;">
												<button type="button" id="dateBtn" class="btn ms-btn-2" style="font-size: 15px;">검색</button>
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
</div>
</div>
</section>

<section class="ms-shop padding-tb-30">
        <div class="container">
            <div class="row">
                <div class="ms-shop-rightside col-lg-12 col-md-12 margin-b-30">
                    <!-- Shop Top Start -->

                    <!-- Shop Top End -->

                    <!-- Shop content Start -->
                    <div class="shop-pro-content">
                        <div class="shop-pro-inner list-view-50">
                            <div class="row" id="hotelListContainer">
                                <!-- 호텔방 조회 -->
                            </div>
                            <form id="resForm" method="get">
				    			<input type="hidden" id="resHotelInDe" name="resHotelInDe" required />
				    			<input type="hidden" id="resHotelOutDe" name="resHotelOutDe" required />
				    			<input type="hidden" id="franchiseId" name="franchiseId" value="${franchise.franchiseId }">
				        	</form>
                        </div>
                    </div>
                    </div>
                    <!--Shop content End -->

                </div>

            </div>
    </section>


<script>
$(document).ready(function () {

	// 세션 스토리지에서 데이터 가져오기
//     const checkinDate = sessionStorage.getItem('checkinDate');
//     const checkoutDate = sessionStorage.getItem('checkoutDate');
//     const hotelList = sessionStorage.getItem('hotelList');

//     if (checkinDate && checkoutDate) {
//         $('#datepicker1').val(checkinDate);
//         $('#datepicker2').val(checkoutDate);
//     }

//     if (hotelList) {
//         renderHotelList(JSON.parse(hotelList));

//         // 데이터를 한 번 불러온 후 세션 스토리지에서 제거
//         sessionStorage.removeItem('checkinDate');
//         sessionStorage.removeItem('checkoutDate');
//         sessionStorage.removeItem('hotelList');
//     }

	// datepicker1과 datepicker2를 초기화
	$("#datepicker1, #datepicker2").datepicker({
	    dateFormat: 'yy-mm-dd',
	    minDate: 0,
	    autoclose: true
	});

	// datepicker1에서 날짜를 선택했을 때의 동작
	$('#datepicker1').datepicker("option", "onSelect", function (selectedDate) {
	    var date2 = $('#datepicker1').datepicker('getDate');
	    date2.setDate(date2.getDate() + 1);
	    $("#datepicker2").datepicker("option", "minDate", date2);
	});

	// datepicker2에서 날짜를 선택했을 때의 동작
	$('#datepicker2').datepicker("option", "onSelect", function (selectedDate) {
	    var date1 = $('#datepicker2').datepicker('getDate');
	    date1.setDate(date1.getDate() - 1);
	    $("#datepicker1").datepicker("option", "maxDate", date1);
	});

	// 검색 버튼 클릭 이벤트
	$('#dateBtn').on('click', function() {
	    var checkinDate = $('#datepicker1').val();  // datepicker1에서 선택한 날짜
	    var checkoutDate = $('#datepicker2').val(); // datepicker2에서 선택한 날짜

	 	// 체크인 또는 체크아웃 날짜가 선택되지 않았을 경우 경고창을 표시
	    if (!checkinDate || !checkoutDate) {
	    	Swal.fire({
	    		  title: "예약 날짜를 선택하세요.",
	    		  icon: "info",
	    		  confirmButtonColor: '#3e9172'
	    		});
	        return;
	    }

	    var franchiseId = $("#franchiseId").val();	// 가맹점ID

	 // 세션 스토리지에 데이터 저장
//         sessionStorage.setItem('checkinDate', checkinDate);
//         sessionStorage.setItem('checkoutDate', checkoutDate);


	 	// AJAX 요청
	    $.ajax({
	        type: "POST",
	        url: "${cPath}/market/member/hotelRes/date", // 컨트롤러 URL
	        data: JSON.stringify({
	            resHotelInDe: checkinDate,         // 체크인 날짜
	            resHotelOutDe: checkoutDate,       // 체크아웃 날짜
	            franchiseId: franchiseId    // franchiseId
	        }),
	        contentType: "application/json; charset=utf-8",
	        success: function(response) {
		         // 응답 데이터를 HTML에 출력
		         renderHotelList(response);
		     	 // 세션 스토리지에 호텔 리스트 저장
// 	             sessionStorage.setItem('hotelList', JSON.stringify(response));
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            console.log("오류 발생:", error);
	        }
	    });
	});

	//호텔 리스트를 출력하는 함수
	function renderHotelList(hotelList) {
	    var hotelListContainer = $('#hotelListContainer'); // 호텔 리스트를 출력할 컨테이너
	    hotelListContainer.empty(); // 기존 내용을 비웁니다.

	    if(hotelList.length === 0) {
	    	Swal.fire({
	    		  title: "예약 가능한 방이 없습니다.",
	    		  icon: "info",
	    		  confirmButtonColor: '#3e9172'
	    		});
	//         hotelListContainer.append('<p style="font-size: medium;font-weight: 500;">예약 가능한 호텔방이 없습니다.</p>');
	//         hotelListContainer.append('<p style="font-size: medium;font-weight: 500;">다른 날짜를 선택하세요.</p>');
	    } else {

	        hotelList.forEach(function(hotel) {
	            var hotelItem = `
	            	<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-xs-6 mb-6 pro-gl-content ms-product-content width-50" style="z-index: 5;">
	            	<div class="ms-product-inner">
	                    <div class="ms-pro-image-outer">
	                        <div class="ms-pro-image">
	                       		<a href="javascript:void(0);" class="image hotel-link" data-hotel-id="\${hotel.hotelId}" style="pointer-events: auto;">
	                                <span class="label veg">
	                                    <span class="dot"></span>
	                                </span>
	                                <img class="main-image" src="\${hotel.hotelImage}" alt="Product">
	                            </a>
	                            <span class="flags">
	                                <span class="sale">\${hotel.hotelType}</span>
	                            </span>
	                        </div>
	                    </div>


	                    <div class="ms-pro-content">
	                    	<a href="javascript:void(0);" class="hotel-link" data-hotel-id="\${hotel.hotelId}">
	                            <h6 class="ms-pro-stitle">\${hotel.hotelType}</h6>
	                        </a>
	                        <h5 class="ms-pro-title"><a href="javascript:void(0);" class="hotel-link" data-hotel-id="\${hotel.hotelId}">\${hotel.hotelNm}</a></h5>
	                        <p class="ms-info">\${hotel.hotelInfo}</p>
	                        <div class="ms-pro-rat-price">
	                            <span class="ms-price">
	                                <span class="new-price mt-2">\${hotel.hotelPrice.toLocaleString()}원</span>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            `;
	            hotelListContainer.append(hotelItem);
	        });

	     	// 호텔 링크에 클릭 이벤트 추가
	        $('.hotel-link').on('click', function() {
	            var hotelId = $(this).data('hotel-id');
	            var checkinDate = $('#datepicker1').val();
	            var checkoutDate = $('#datepicker2').val();
	            var franchiseId = $("#franchiseId").val();

	            $('#resHotelInDe').val(checkinDate);
	            $('#resHotelOutDe').val(checkoutDate);

	            $('#resForm').attr('action', '${cPath}/market/member/hotelRes/hotel/' + hotelId);
	            $('#resForm').submit();
	        });
	    }
	}
});
</script>