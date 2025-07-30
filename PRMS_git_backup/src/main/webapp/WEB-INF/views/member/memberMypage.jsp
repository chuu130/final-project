<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/prms/resources/js/jquery-3.7.1.min.js"></script>
<link href="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="${cPath }/resources/Franchise/template_html/dist/assets/plugins/summernote/dist/summernote-lite.min.js"></script>


    <section class="ms-blog padding-tb-30">
        <div class="container">
            <div class="row">
                <div class="ms-blogs-rightside col-lg-9 order-lg-last col-md-12 order-md-first">

                    <!-- Blog content Start -->
                    <div class="ms-blogs-content">
                        <div class="ms-blogs-inner">
                            <div class="ms-single-blog-item">
                                <div class="single-blog-info">
                                    <div class="single-blog-detail">

									<!-- Sample section Start -->
                                      <section class="ms-register padding-tb-30">
									        <div class="container">
									            <div class="section-title-2">
									                <h2 class="ms-title">회원 상세</h2>
									                <br>
										        	<h5>회원등급 <label style="text-align: right;">${rankVO.rankSe }</label></h5>
									            </div>
									            <div class="row p-t-15">
									                <div class="ms-register-wrapper">
									                    <div class="ms-register-container">
									                        <div class="ms-register-form">
									                            <form method="post" action="${cPath }/market/member/memUpdate" id="updateForm">
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>아이디</label>
									                                    <input type="text" id="memId" name="memId" value="${memberVO.memId}" readonly>
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>이름</label>
									                                    <input type="text" id="memNm" name="memNm" value="${memberVO.memNm}" >
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>이메일</label>
									                                    <input type="text" id="memEmail" name="memEmail" value="${memberVO.memEmail}" >
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>휴대폰 번호</label>
									                                    <input type="text" id="memTelno" name="memTelno" value="${memberVO.memTelno}" >
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>우편번호</label>
									                                    <input type="text" id="memZip" name="memZip" value="${addrVO.memZip}" >
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>주소</label>
									                                    <input type="text" id="memAdres1" name="memAdres1" value="${addrVO.memAdres1}" >
									                                </span>
									                                <span class="ms-register-wrap">
									                                    <label>상세 주소</label>
									                                    <input type="text" id="memAdres2" name="memAdres2" value="${addrVO.memAdres2}" >
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>생년월일</label>
									                                    <input type="date" id="memBirthdy" name="memBirthdy" value="${memberVO.memBirthdy}" >
									                                </span>
									                                <span class="ms-register-wrap ms-register-half">
									                                    <label>마일리지</label>
									                                    <input type="number" id="memMl" name="memMl" value="${memberVO.memMl}" readonly>
									                                </span>
									                                <span class="ms-register-wrap ms-register-btn">
									                                    <button class="ms-btn-2" type="button" id="updateBtn">정보 수정</button>
									                                    <button class="ms-btn-2" type="button" id="delBtn">회원 탈퇴</button>
									                                </span>
									                            <input type="hidden" id="memNo" name="memNo" value="${memberVO.memNo}" />
									                            <input type="hidden" id="memPassword" name="memPassword" value="${memberVO.memPassword}" />
									                            </form>
									                        </div>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </section>
									    <!-- Sample section End -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Blog content End -->
                </div>

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
                                    	<c:url value="/market/member/${memberVO.memNo }/memreview" var="memReviewUrl" />
                                        <a href="${memReviewUrl}">내가 쓴 리뷰</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sidebar Recent Blog Block -->
                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- Modal -->
<!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">회원비밀번호 확인</h5> -->
<!--         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<form id="deleteform" method="post" action="${cPath}/market/member/memberDelete">
<!--         <input type="text" id="memPassword" name="memPassword"> -->
        <input type="hidden" id="memNo" name="memNo" value="${memberVO.memNo }">
</form>
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-primary" id="delBtn2">Save changes</button> -->
<!--         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

<script type="text/javascript" defer="defer">
// 	document.addEventListener("DOMContentLoaded", ()=>{
// 		let delBtn = document.getElementById("delBtn");
// 		console.log("DOMContentLoaded delBtn : ", delBtn);

// 		let memNo = document.getElementById("memNo");
// 		console.log("DOMContentLoaded memNo : ", memNo);

// 		delBtn.addEventListener("click", function(){
// 			$.ajax({
// 				type:"POST",
// 				url:`${cPath}/market/memberDelete`,
// 				data: {
// 					"memNo" : memNo.value
// 				},
// 				success : function(res){
// 	            	alert("회원 탈퇴 성공", res);
// 	            	location.href = `${cPath}/market/marketpage.do`;
// 	           },
// 	           error : function(error){
// 	            	alert("회원 탈퇴 실패");
// 	           }
// 			});
// 		});
// 	});

	document.getElementById("updateBtn").addEventListener("click", ()=>{
		Swal.fire({
			   title: '수정하시겠습니까?',
			   text: '회원 정보가 수정됩니다.',
			   icon: 'warning',

			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			   confirmButtonColor: '#3E9172', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
			   confirmButtonText: '수정', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
			   // 만약 Promise리턴을 받으면,
			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				   Swal.fire({
					   title: '회원정보가 수정이 완료었습니다.',
					   text: '',
					   icon: 'success',
					   confirmButtonColor: '#3E9172'
					   }) .then(()=>{
					   updateForm.requestSubmit();
				   });
			   }
			});
	});

	document.getElementById("delBtn").addEventListener("click", ()=>{
		Swal.fire({
			   title: '삭제하시겠습니까?',
			   text: '한 번 삭제하면 되돌릴 수 없습니다.',
			   icon: 'warning',

			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			   confirmButtonColor: '#3E9172', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
			   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소' // cancel 버튼 텍스트 지정

			}).then(result => {
			   // 만약 Promise리턴을 받으면,
			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				   Swal.fire({
					   title: '회원 탈퇴가 완료었습니다.',
					   text: '',
					   icon: 'success',
					   confirmButtonColor: '#3E9172'
					}).then(()=>{
						deleteform.requestSubmit();
				   });
			   }
			});
	});
</script>
