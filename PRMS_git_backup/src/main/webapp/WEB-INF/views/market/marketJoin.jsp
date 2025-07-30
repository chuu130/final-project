<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

	<!-- Breadcrumb start -->
    <div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">회원가입</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="index.html">홈</a></li>
                                <li class="ms-breadcrumb-item active">회원가입</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->

    <!-- Register section -->
    <section class="ms-register padding-tb-30">
        <div class="container">
            <div class="section-title-2">
                <h2 class="ms-title">회원가입<span></span></h2>
                <p>Best place to buy and sell digital products.</p>
            </div>
            <div class="row p-t-15">
                <div class="ms-register-wrapper">
                    <div class="ms-register-container">
                        <div class="ms-register-form">
                        	<form:form method="post" modelAttribute="member">
                                <span class="ms-register-wrap ms-register-half">
                                    <label>아이디*</label>
                                    <form:input type="text" path="memId" class="form-control" required="required"/>
                                    <form:errors path="memId" cssClass="text-danger" element="span" />
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                	<label style="height:48px;">${dummy }</label>
									<button type="button" id="id-chk-btn" class="ms-btn-1">중복체크</button>
                                    <span id="id-chk-msg" style="color:red;"></span>
                                </span>
                                <span class="ms-register-wrap">
                                    <label>비밀번호*</label>
                                    <input type="password" name="memPassword" class="form-control" required />
                                    <form:errors path="memPassword" cssClass="text-danger" element="span" />
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                    <label>이름*</label>
                                    <form:input type="text" path="memNm" class="form-control" required="required"/>
                                    <form:errors path="memNm" cssClass="text-danger" element="span"/>
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                    <label>이메일*</label>
                                    <form:input type="email" path="memEmail" class="form-control" required="required"/>
									<form:errors path="memEmail" cssClass="text-danger" element="span" />
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                    <label>휴대전화*</label>
                                    <form:input type="text" path="memTelno" class="form-control" required="required" />
                                    <form:errors path="memTelno" cssClass="text-danger" element="span" />
                                </span>
                                 <span class="ms-register-wrap ms-register-half">
                                    <label>생일</label>
                                    <form:input type="date" class="form-control" path="memBirthdy"/>
                                    <form:errors path="memBirthdy" cssClass="text-danger" element="span" />
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                    <label>우편번호</label>
                                    <input type="text" id="sample6_postcode" name="memberAddressList[0].memZip" class="form-control" placeholder="Address Line 1">
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                	<label style="height:48px;">${dummy }</label>

									<button type="button" class="ms-btn-1" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                	<label>주소</label>
                                   <input type="text" id="sample6_address" name="memberAddressList[0].memAdres1" class="form-control" placeholder="주소">
                                </span>
                                <span class="ms-register-wrap ms-register-half">
                                	<label>상세주소</label>
                                   <input type="text" id="sample6_detailAddress" name="memberAddressList[0].memAdres2" class="form-control" placeholder="상세주소">
                                </span>
                                <span class="ms-register-wrap ms-recaptcha">
                                    <span class="g-recaptcha" data-sitekey="6LfKURIUAAAAAO50vlwWZkyK_G2ywqE52NU7YO0S"
                                        data-callback="verifyRecaptchaCallback"
                                        data-expired-callback="expiredRecaptchaCallback"></span>
                                    <input class="form-control d-none" data-recaptcha="true"
                                        data-error="Please complete the Captcha">
                                    <span class="help-block with-errors"></span>
                                </span>
                                <span class="ms-register-wrap ms-register-btn">
                                    <span>이미 계정이 있으신가요?<a href="${cPath }/market/login">Login</a></span>
                                    <button class="ms-btn-2" type="submit">회원가입</button>
                                </span>
                                <span class="ms-register-wrap ms-register-btn mt-3 d-flex justify-content-end">
                                	<button class="ms-btn-1" type="button" onclick="autoInput()">자동입력</button>
                                </span>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Sample section End -->


    <!-- 회원정보 자동입력 스크립트 -->
	<script>
		function autoInput() {
			document.querySelector("input[name=memId]").value = 'jangjangmin';
			document.querySelector("input[name=memPassword]").value = 'java';
			document.querySelector("input[name=memNm]").value ='장민';
			document.querySelector("input[name=memEmail]").value = 'apvmfvodls1@naver.com';
			document.querySelector("input[name=memTelno]").value = '010-1234-5678';
			document.querySelector("input[name=memBirthdy]").value = '1999-05-07';
			document.querySelector("#sample6_postcode").value = '04170';
			document.querySelector("#sample6_address").value = '서울특별시 마포구 도화동 도화길 28';
			document.querySelector("#sample6_detailAddress").value = '109동 1901호';
		}
	</script>


	<!-- 다음 주소 -->
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
	<script src="${cPath }/resources/js/app/nonmember/marketMemberJoin.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/app/utils/fetchUtils.js"></script>