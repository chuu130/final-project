<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.coupon-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* Two columns */
	gap: 20px; /* Space between the coupons */
	border: solid 1px #eee;
}

.coupon {
	border-radius: 10px;
	border:none;
	border-right-style: dashed;
    border-right-color: #007d05;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 140px;
}
.card:hover {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	transform: none;
}
.coupon-info {
	display: flex;
	flex-direction: column;
}

.amount {
	font-size: 32px;
	font-weight: bold;
	color: #007d05;
}

.desc {
	margin-top: 5px;
	font-size: 17px;
}

.couponde{
	color: #676767;
    font-size: 14px;
    margin-top: 5px;
}

.usage-guide {
	margin-top: 10px;
	font-size: 12px;
	color: white;
	text-decoration: underline;
}

.get-coupon {
	color: inherit;
	text-decoration: none;
}

#titlecoupon{
	margin: 20px 0 20px 10px;
	display: flex;
    flex-direction: row;
    justify-content: space-between;
}


</style>
    <section class="ms-blog padding-tb-30">
        <div class="container">
            <div class="row">
                <div class="ms-blogs-rightside col-lg-9 order-lg-last col-md-12 order-md-first">
					<!-- section Start -->
                	<section class="ms-register">
                    	<div class="section-title-2" id="titlecoupon">
                            <h2 class="ms-title">보유한 쿠폰 내역</h2>
                            <form action="${cPath }/market/event/eventList" method="get">
	    						<button type="submit" class="btn btn-secondary">
                            		<i class="bi bi-ticket-perforated"></i>&nbsp;쿠폰 받기
                            	</button>
							</form>
						</div>
							<div class="row">
		        				<div class="coupon-container p-5">
		        					<c:forEach items="${conponList }" var="cou">
		        						<div class="coupon card p-4">
						                    <div class="coupon-info">
						                        <span class="amount">${cou.coupon.couponDiscount}</span>
						                        <span class="desc">${cou.coupon.couponDc}</span>
						                        <span class="couponde">${cou.coupon.couponDe}까지</span>
						                    </div>
						                </div>
						            </c:forEach>
								</div>
							</div>
					</section>
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
                                 	<c:url value="/market/member/${memVO.memId }/mypage" var="memMypage"/>
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
	                                   	<c:url value="/market/member/${memVO.memNo }/beautyResDetail" var="beautyResDetail"/>
	                                    <a href="${beautyResDetail }">미용예약내역</a>
	                                </div>
	                            </div>
	                            <div class="ms-sidebar-block-item">
	                                    <div class="ms-sidebar-block-detial">
	                                    	<c:url value="/market/member/${memVO.memNo }/hotelResDetail" var="hotelResDetail"/>
	                                        <a href="${hotelResDetail }">호텔예약내역</a>
	                                    </div>
	                                </div>
                                <div class="ms-sidebar-block-item">
                                    <div class="ms-sidebar-block-detial">
                                    	<c:url value="/market/member/${memVO.memNo }/memcoupon"
	                                    		var="memCouUrl" />
                                        <a href="${memCouUrl}">보유 쿠폰</a>
                                    </div>
                                </div>
                                	<div class="ms-sidebar-block-item">
										<div class="ms-sidebar-block-detial">
											<c:url value="/market/member/${memVO.memNo }/memreview"
												var="memReviewUrl" />
											<a href="${memReviewUrl}">내가 쓴 리뷰</a>
										</div>
									</div>
                       		</div>
                		</div>
                    </div>
                </div>
			</div>
<!-- 										<th class="pt-0 pb-2">쿠폰명</th> -->
<!-- 										<th class="pt-0 pb-2">쿠폰내용</th> -->
<!-- 										<th class="pt-0 pb-2">쿠폰할인율</th> -->
<!-- 										<th class="pt-0 pb-2">쿠폰사용여부</th> -->
<%-- 											<td class="align-middle">${cou.coupon.couponNm }</td> --%>
<%-- 											<td class="align-middle">${cou.coupon.couponDc }</td> --%>
<%-- 											<td class="align-middle">${cou.coupon.couponDiscount }</td> --%>
<%-- 											<td class="align-middle">${cou.couponDelyn}</td> --%>
            </div>
    </section>
