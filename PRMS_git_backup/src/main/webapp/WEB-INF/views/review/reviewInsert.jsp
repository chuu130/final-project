<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketBoard.css">

<div class="ms-breadcrumb m-b-30">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row ms_breadcrumb_inner">
                    <div class="col-md-6 col-sm-12">
                        <h2 class="ms-breadcrumb-title">Product Page</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                       
                        <ul class="ms-breadcrumb-list">
                            <li class="ms-breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="ms-breadcrumb-item active">Product Page</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 시작 -->
<section class="ms-single-product padding-b-30">
    <div class="container">
        <div class="row">
            <div class="ms-pro-rightside ms-common-rightside col-lg-9 order-lg-last col-md-12 order-md-first">
                <div class="single-pro-block">
                    <div class="single-pro-inner">
                        <div class="row">
                        </div>
                    </div>
                </div>

                <div class="ms-single-pro-tab">
                    <div class="ms-single-pro-tab-wrapper">
                        <div class="ms-single-pro-tab-nav">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab"
                                        data-bs-target="#ms-spt-nav-review" 
                                        aria-controls="ms-spt-nav-review" aria-selected="true">리뷰등록</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content ms-single-pro-tab-content">
                            <div id="ms-spt-nav-review" class="tab-pane fade show active">
                                <div class="row">
                                    <div class="ms-t-review-wrapper" id="starReviewlist">
                                        <c:if test="${not empty reviewProdList}">
                                            <c:forEach items="${reviewProdList}" var="review">
                                                <div class="ms-t-review-item">
                                                    <div class="ms-t-review-avtar">
                                                        <img src="assets/img/user/1.jpg" alt="user">
                                                    </div>
                                                    <div class="ms-t-review-content">
                                                        <div class="ms-t-review-top">
                                                            <div class="ms-t-review-name">
                                                                <p>리뷰번호 : ${review.reviewNo}</p>
                                                                <p>작성자 : ${review.reviewWriter}</p>
                                                                <p>${review.reviewScore}</p>
                                                            </div>
                                                            <div class="ms-t-review-rating">
                                                                <c:forEach begin="1" end="${review.reviewScore}" varStatus="vs">
                                                                    <i class="msicon msi-star-fill star-icon" data-value="${vs.count}"></i>
                                                                    <c:if test="${vs.last}">
                                                                        <c:set var="lastnum" value="${vs.count}"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:forEach begin="1" end="${5-review.reviewScore}" varStatus="vs">
                                                                    <i class="msicon msi-star-o star-icon" data-value="${lastnum + vs.count}"></i>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                         <div class="ms-t-review-bottom">
                                                        <input type="file" name="reviewImage" accept="image/*"> 
                                                    	</div>
                                                        <div class="ms-t-review-bottom">
                                                            <p>${review.reviewCn}</p>
                                                        </div>
                                                  
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                        <h4 class="title-style">선택한 상품이 마음에 드셨나요?</h4>
                                    <div class="product-style">
                                     <img src="${product.prodImage }" style="width:200px; height:200px; margin-top:10px;">
                                    <p>상품번호 : ${prodId}<br>
                                     상품이름 : ${product.prodSleNm }<br>
                                     상품가격 : ${product.prodSlePc }원<br>
                                     상품설명 : ${product.prodDc }
                                     </p>
								     </div>
                                    <div class="ms-ratting-content">
                                        <div class="ms-ratting-form">
                                            <form method="post" id="starform" action="/prms/market/member/reviewProdInsert">
                                                <div class="ms-ratting-star text-center centered-content">
<!--                                                     <span>별점</span> -->
                                                    <div class="ms-t-review-rating d-inline-block custom-star-size" id="starfill">
                                                        <i class="msicon msi-star-o star-icon" id="star1" data-value="1"></i>
                                                        <i class="msicon msi-star-o star-icon" id="star2" data-value="2"></i>
                                                        <i class="msicon msi-star-o star-icon" id="star3" data-value="3"></i>
                                                        <i class="msicon msi-star-o star-icon" id="star4" data-value="4"></i>
                                                        <i class="msicon msi-star-o star-icon" id="star5" data-value="5"></i>
                                                    </div>
                                                    <!-- 리뷰 별점 값을 reviewScore로 저장 -->
                                                    <input type="hidden" name="reviewScore" id="reviewScore"> 
                                                </div>
                                                <div class="ms-ratting-input">
                                                    <input name="reviewSj" placeholder="제목" type="text" class="custom-input-review " required>
                                                </div>
                                                <div class="ms-ratting-input form-submit">
                                                    <textarea name="reviewCn" placeholder="내용을 입력하세요" class="custom-input-review " required></textarea>
                                                <div class="ms-ratting-input">
                                                    <input type="file" name="uploadFile" placeholder="상품이미지를 등록해주세요" id="reviewImage" class="custom-file">
                                                </div>
                                                    <button class="ms-btn-2" type="button" value="submit" id="insertBtn">등록</button>
                                                </div>
                                                 <!-- prodId를 숨겨진 입력 필드로 추가 해당상품번호-->
                                                   <c:set var="prodId" value="${param.prodId}" />
                                                   <input type="hidden" name="prodId" value="${prodId}">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 영역 끝 -->
            </div>
        </div>
    </div>
</section>
<!-- 상품 끝 -->

	<script>
	
	document.addEventListener("DOMContentLoaded", function() {
	    const starform = document.querySelector("#starform");
	    const insertBtn = document.querySelector("#insertBtn");
	    const stars = document.querySelectorAll('.ms-t-review-rating .msicon');
	    
	    // 별점 업데이트 함수
	    function updateStarRating(rating) {
	        stars.forEach((star, index) => {
	            if (index < rating) {
	                star.classList.add('fill');
	                star.classList.remove('msi-star-o');
	                star.classList.add('msi-star');
	            } else {
	                star.classList.remove('fill');
	                star.classList.add('msi-star-o');
	                star.classList.remove('msi-star');
	            }
	        });
	    }
	
	    // 별점을 클릭했을 때 실행되는 이벤트 핸들러
	    stars.forEach(star => {
	        star.addEventListener('click', function() {
	            const rating = Array.from(stars).indexOf(this) + 1;
	            document.querySelector('#reviewScore').value = rating;
	            updateStarRating(rating);
	        });
	    });
	
	    // 등록 버튼 클릭 시 폼 전송 처리
	    insertBtn.onclick = function(event) {
	        event.preventDefault(); 
	
	        let formData = new FormData(starform);
	        console.log("formData?",formData);
	        for(let [key,val] of formData){
	        	console.log("체크",key,val);
	        }
	
	        fetch("${cPath}/market/member/reviewProdInsert", {
	            method: "post",
	            body: formData
	        }).then((resp) => {
	            return resp.text();
	        }).then((result) => {
	        	console.log("체크:",result);
	            if (result === "success") {
	                alert("등록 성공");
	                // prodId가 포함된 상품 상세 페이지로 리다이렉트
	               location.href= `/prms/market/prodDetail/${prodId}`;
	            } else {
	                alert("등록 실패");
	            }
	        }).catch((error) => {
	            console.error("Error:", error);
	        });
	    };
	});
	
	//                 const prodId = prodIdInput.value;
	</script>