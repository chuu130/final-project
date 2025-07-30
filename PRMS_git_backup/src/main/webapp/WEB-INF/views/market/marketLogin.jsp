<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<!-- 아이디 찾기 모달 -->
	<div class="idFind_modal" style="z-index:9999;">
      <div class="idFind_popup" style="width: 350px;">
        <h4 class="idFindTitle mb-4 text-center">아이디 찾기</h4>
	    <div class="col-sm-12 mt-3">
	      <label class="mb-2">이름</label>
	      <input type="text" class="form-control" id="memNm" name="memNm" style="height: 40px;" required>
	    </div>
	    <div class="col-sm-12 mt-3">
	      <label class="mb-2">전화번호</label>
	      <input type="text" class="form-control" id="memTelno" name="memTelno" placeholder="010-xxxx-xxxx" style="height: 40px;" required>
	    </div>
        <br />
        <div class="text-end">
	        <button type="button" class="idFind_moadl_idFind_btn ms-btn-2 btn">찾기</button>
	        <button type="button" class="idFind_modal_idFind_closeBtn ms-btn-2 btn">닫기</button>
        </div>
      </div>
	</div>


	<!-- 비밀번호 찾기 모달 -->
	<div class="pwFind_modal" style="z-index:9999;">
      <div class="pwFind_popup" style="width: 350px;">
        <h4 class="pwFindTitle mb-4 text-center">비밀번호 찾기</h4>
	    <div class="col-sm-12 mt-3">
	      <label class="mb-2">아이디</label>
	      <input type="text" class="form-control" id="memId" name="memId" style="height: 40px;" required>
	    </div>
	    <div class="col-sm-12 mt-3">
	      <label class="mb-2">이메일</label>
	      <input type="email" class="form-control" id="memEmail" name="memEmail" style="height: 40px;" required>
	    </div>
        <br />
        <div class="text-end">
	        <button type="button" class="pwFind_moadl_pwFind_btn ms-btn-2 btn">전송</button>
	        <button type="button" class="pwFind_modal_pwFind_closeBtn ms-btn-2 btn">닫기</button>
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
                            <h2 class="ms-breadcrumb-title">로그인 화면</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="index.html">홈</a></li>
                                <li class="ms-breadcrumb-item active">로그인</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->

    <!-- Login section -->
    <section class="ms-login padding-tb-30">
        <div class="container">
            <div class="ms-login-content p-t-15">
                <div class="ms-login-box" style="width: 100%;">
                    <div class="ms-login-wrapper">
                        <div class="ms-login-container">
                            <div class="ms-login-form">
                                <form action="#" method="post">
						            <div class="section-title-2">
						                <h2 class="ms-title mb-3">로그인<span></span></h2>
						            </div>
                                    <span class="ms-login-wrap">
                                        <label>아이디</label>
                                        <input type="text" name="memId" placeholder="아이디를 입력하세요..." required>
                                    </span>
                                    <span class="ms-login-wrap">
                                        <label>비밀번호</label>
                                        <input type="password" name="memPassword" placeholder="비밀번호를 입력하세요..." required>
                                    </span>
                                    <span class="ms-login-fp text-end">
                                        <label><button id="id_find_btn" type="button">아이디 찾기</button></label>
                                        <label><button id="pw_find_btn" type="button">비밀번호 찾기</button></label>
                                    </span>
                                    <span class="ms-login-wrap ms-login-btn">
                                        <span><a href="${cPath }/market/join" class="">회원가입</a></span>
                                        <button class="ms-btn-2 btn" type="submit" id="loginBtn">로그인</button>
                                    </span>
                                    <span class="ms-login-wrap ms-login-btn d-flex justify-content-end">
                                    	<button class="ms-btn-1 btn" type="button" onclick="autoLogin()">자동로그인</button>
                                    </span>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login section End -->

    <!-- 자동로그인 처리를위한 임시 스크립트 -->
    <script>
		function autoLogin() {
			document.querySelectorAll("input[name=memId]")[1].value = "bokyu";
			document.querySelector("input[name=memPassword]").value = "java";
			document.querySelector("#loginBtn").click();
		}
    </script>

	<!-- 회원정보 찾기 스크립트 -->
    <script src="${cPath }/resources/js/app/nonmember/marketMemberFinding.js"></script>

