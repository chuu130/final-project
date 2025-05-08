<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

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
}
.card:hover {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
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

/* .coupon-button { */
/* 	display: flex; */
/* 	align-items: center; */
/* 	justify-content: center; */
/* 	background: white; */
/* 	color: #0a0a0a; */
/* 	padding: 10px 20px; */
/* 	border-radius: 5px; */
/* 	font-size: 16px; */
/* 	font-weight: bold; */
/* } */

.get-coupon {
	color: inherit;
	text-decoration: none;
}
</style>

<br>
<div class="container">
	<div class="row">
		<button onclick="history.back()" id="backbtn"><i class="bi bi-chevron-left"></i>뒤로가기</button>
		<h3 class="text-center mb-5" style="font-weight: 500;">진행중인 이벤트 및 쿠폰</h3>
	</div>
</div>

<c:if test="${not empty msg}">
    <c:choose>
        <c:when test="${msg == '쿠폰발급완료'}">
            <script type="text/javascript">
                Swal.fire({
                    title: "${msg}",
                    text: '',
                    icon: 'success', // 성공 아이콘
                    confirmButtonColor: '#3E9172',
                });
            </script>
        </c:when>
        <c:otherwise>
            <script type="text/javascript">
                Swal.fire({
                    title: "이미 보유중인 쿠폰입니다.",
                    text: '',
                    icon: 'info', // 실패 아이콘
                    confirmButtonColor: '#3E9172',
                });
            </script>
        </c:otherwise>
    </c:choose>
</c:if>

<div class="container">
    <div class="row">
        <div class="coupon-container p-5">
            <c:forEach items="${couponList}" var="coupon">
                <div class="coupon card p-4">
                    <div class="coupon-info">
                        <span class="amount">${coupon.couponDiscount}</span>
                        <span class="desc">${coupon.couponDc}</span>
                        <span class="couponde">${coupon.couponDe}까지</span>
                    </div>

                    <security:authorize access="hasAuthority('ROLE_USER')">
                        <security:authentication property="principal" var="principal"/>
                            <div style="width: 10%;">
                        	<form action="${pageContext.request.contextPath}/market/${coupon.couponNo}/give/${principal.username}" method="post">
                                <button type="submit" class="get-coupon">
                                	<img src="${cPath }/resources/images/downloadicon.png" alt="쿠폰발급"/>
                                </button>
                        	</form>
                            </div>
                    </security:authorize>

                    <security:authorize access="!hasAuthority('ROLE_USER')">
					    <div style="width: 10%;">
					        <a href="${cPath}/market/login" class="get-coupon">
					            <img src="${cPath}/resources/images/downloadicon.png" alt="쿠폰발급"/>
					        </a>
					    </div>
					</security:authorize>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
