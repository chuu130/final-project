<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


	<!-- 회원정보 -->
	<security:authorize access="hasAuthority('ROLE_USER')">
		<security:authentication property="principal" var="principal"/>
		<c:set value="${principal.realUser }"  var="member" />
	</security:authorize>

	<!-- 주문번호 -->
	<span style="display:none" id="newOrderId">${newOrderId }</span>


	<!-- 배송지 리스트 모달 -->
	<div class="modal fade" id="addressListModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">${member.memNm }님 배송지 정보</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table table-bordered  table-hover">
	        	<thead>
					<tr>
						<th>우편번호</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody id="add-list-body">

				</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn ms-btn-2" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn ms-btn-2" id="add-change-btn">변경하기</button>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- Breadcrumb start -->
    <div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">주문서</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="ms-breadcrumb-item active">결제하기</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->




    <!-- Checkout section -->
    <form action="#" method="post">
    <section class="ms-checkout-section padding-tb-30">
        <h2 class="d-none">Checkout Page</h2>
        <div class="container">
            <div class="row">
                <div class="ms-checkout-leftside col-lg-8 col-md-12 ">
                    <!-- checkout content Start -->
                    <div class="ms-checkout-content">
                        <div class="ms-checkout-inner">
                            <div class="ms-checkout-wrap m-b-30">
                                <div class="ms-checkout-block ms-check-new">
                                    <h3 class="ms-checkout-title">배송지</h3>
                                </div>
                                <div class="ms-checkout-block ms-check-login">
                                    <h3 class="ms-checkout-title d-inline"><span><h6 class="ms-checkout-title d-inline me-3">${member.memNm }</h6><span class="badge bg-light text-secondary me-3" id="addInfo">기본배송지</span></span><span><button type="button" class="ms-btn-1" id="changeAddressBtn">배송지 변경</button></span></h3>
									<br><br>
                                    <div class="ms-check-login-form">

                                           <span class="ms-register-wrap ms-register-half">
			                                    <label>우편번호</label>
			                                    <input type="text" id="sample6_postcode" name="memberAddressList[0].memZip" class="form-control" placeholder="Address Line 1" value="${memberDefaultAddress.memZip }">
			                               </span>
			                               <span class="ms-register-wrap ms-register-half">
			                                	<label>${dummy }</label>
												<button type="button" class="ms-btn-1" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
			                               </span>
			                               <span class="ms-register-wrap ms-register-half">
			                                	<label>주소</label>
			                                   <input type="text" id="sample6_address" name="memberAddressList[0].memAdres1" class="form-control" placeholder="주소" value="${memberDefaultAddress.memAdres1 }">
			                               </span>
			                               <span class="ms-register-wrap ms-register-half">
			                                	<label>상세주소</label>
			                                   <input type="text" id="sample6_detailAddress" name="memberAddressList[0].memAdres2" class="form-control" placeholder="상세주소" value="${memberDefaultAddress.memAdres2 }">
			                               </span>

                                    </div>
                                </div>
                            </div>

                            <div class="ms-checkout-wrap m-b-30 padding-bottom-3">
                                <div class="ms-checkout-block ms-check-bill">
                                    <h3 class="ms-checkout-title">할인정보</h3>
                                    <div class="ms-bl-block-content">
                                        <div class="ms-check-subtitle">구매 적립 / 선할인</div>
                                        <span class="ms-bill-option">
                                            <span>
                                                <input type="radio" id="after-discount" name="discount-radio-group" checked>
                                                <label for="after-discount">구매 적립<span class="text-primary">(<span id="pre-discount-price" style="margin:0px;">${prodSlePc * cdQy}</span>원 적립)</span></label>
                                            </span>
                                            <span>
                                                <input type="radio" id="pre-discount" name="discount-radio-group">
                                                <label for="pre-discount">적립금 선할인</label>
                                            </span>
                                        </span>

                                        <div class="ms-check-subtitle">보유 적립금 사용</div>
                                        <div class="row g-3">
		                                    <div class="col-auto">
		                                    	<c:set value="적립금을 입력하세요."  var="hasMl" />
		                                    	<c:set value="보유하신 적립금이 없습니다."  var="hasNoMl" />
	                                        	<input type="text" class="form-control" id="memMl" name="memMl" placeholder="${member.memMl > 0 ? hasMl : hasNoMl}"> <span class="text-danger" id="canMl">${member.memMl > 0 ? member.memMl : ""}</span><span class="text-danger">${member.memMl > 0 ? "점 사용가능" : "보유하신 적립금이 없습니다."}</span>
	                                        </div>
										</div>

										<div class="ms-check-subtitle">쿠폰사용</div>
                                        <div class="row g-3">
		                                    <div class="col-auto">
												<select name="my-coupon-list" id="my-coupon-list" class="form-control">
													<option value="">쿠폰선택</option>
													<c:choose>
														<c:when test="${not empty myCouponList}">
															<c:forEach items="${myCouponList }" var="myCoupon">
																<option label="${myCoupon.coupon.couponDc }" value="${myCoupon.mycouponNo }" id="${myCoupon.coupon.couponDiscount }">
															</c:forEach>
														</c:when>
														<c:otherwise>
															<option label="보유하신 쿠폰이 없습니다.">
														</c:otherwise>
													</c:choose>
												</select>
	                                        </div>
										</div>
                                    </div>
                                </div>
                            </div>
		                            <span class="ms-check-order-btn">
		                                <button type="button" class="ms-btn-2" id="paymentBtn">결제하기</button>
		                            </span>
                        </div>
                    </div>
                    <!--cart content End -->
                </div>

                <!-- Sidebar Area Start -->
                <div class="ms-checkout-rightside col-lg-4 col-md-12 m-t-991">
                    <div class="ms-sidebar-wrap">
                        <!-- Sidebar Summary Block -->
                        <div class="ms-sidebar-block">
                            <div class="ms-sb-title">
                                <h3 class="ms-sidebar-title">주문상품</h3>
                            </div>
                            <div class="ms-sb-block-content">
                                <div class="ms-checkout-summary">
                                    <div>
                                        <span class="text-left">주문금액</span>
                                        <span class="text-right"><span id="orderPrice">${prodDetail.prod.prodSlePc * cdQy }</span>원</span>
                                    </div>
                                    <div>
                                        <span class="text-left">배송비</span>
                                        <span class="text-right">무료</span>
                                    </div>
                                    <div>
                                        <span class="text-left">쿠폰할인</span>
                                        <span class="text-right" id="discountCoupon"><span id="total-discount-coupon-price">0</span>원</span>
                                    </div>
                                    <div>
                                        <span class="text-left">적립금할인</span>
                                        <span class="text-right" id="discountMl"><span id="total-mileage-discount">0</span>원</span>
                                    </div>
                                    <div class="ms-checkout-coupan-content">
                                            <input class="ms-coupan" type="text"
                                                placeholder="Enter Your Coupan Code" name="ms-coupan" value="">
                                            <button class="ms-coupan-btn ms-btn-2" type="submit"
                                                name="subscribe" value="">Apply</button>
                                    </div>
                                    <div class="ms-checkout-summary-total">
                                        <span class="text-left">총금액</span>
                                        <span class="text-right"><span id="totalPrice">${prodDetail.prod.prodSlePc * cdQy }</span>원</span>
                                    </div>
                                </div>
                                <div class="ms-checkout-pro">
                                    <div class="col-sm-12 mb-6">
                                        <div class="ms-product-inner">
                                            <div class="ms-pro-image-outer">
                                                <div class="ms-pro-image">
                                                    <a href="product-left-sidebar.html" class="image" style="width:100px;height:100px">
                                                        <img class="main-image"
                                                            src="${ prodDetail.prod.prodImage}"
                                                            alt="주문상품">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="ms-pro-content" id="pro-content" data-prod-id=${prodDetail.prod.prodId }>
                                                <h5 class="ms-pro-title"><a href="${cPath }/market/prodDetail/${prodDetail.prod.prodId }" id="prodNm">${prodDetail.prod.prodSleNm }</a></h5>
                                                <span>수량 : <span id="cdQy">${cdQy }</span></span>
<!--                                                 <div class="ms-pro-rating"> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star fill"></i> -->
<!--                                                     <i class="msicon msi-star"></i> -->
<!--                                                 </div> -->
                                                <span class="ms-price">
                                                    <span class="new-price">${prodDetail.prod.prodSlePc * cdQy}원</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sidebar Summary Block -->
                    </div>

                    <div class="ms-sidebar-wrap ms-checkout-pay-wrap">
                        <!-- Sidebar Payment Block -->
                        <div class="ms-sidebar-block">
                            <div class="ms-sb-title">
                                <h3 class="ms-sidebar-title">결제 수단</h3>
                            </div>
                            <div class="ms-sb-block-content">
                                <div class="ms-checkout-pay">
                                        <div class="ms-pay-option">
                                            <div>
                                                <input type="radio" id="kakaopay" name="radio-group" data-pay-method="kakaoPay" checked>
                                                <label for="kakaopay">카카오페이</label>
                                            </div>
                                            <div>
                                                <input type="radio" id="kcp" name="radio-group" data-pay-method="card">
                                                <label for="kcp">카드결제</label>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sidebar Payment Block -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- Checkout section End -->

	<!-- 다음주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}


							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
			}
	</script>

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="${cPath }/resources/js/app/market/payment/marketSinglePurchasing.js"></script>
	<script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>

