<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="table-responsive">
	<table class="table table-hover text-nowrap">
		<thead>
			<tr>
				<th class="pt-0 pb-2">쿠폰ID</th>
				<th class="pt-0 pb-2">쿠폰명</th>
				<th class="pt-0 pb-2">쿠폰설명</th>
				<th class="pt-0 pb-2">쿠폰사용기간</th>
				<th class="pt-0 pb-2">쿠폰발급날짜</th>
				<th class="pt-0 pb-2">쿠폰할인정보</th>
				<th class="pt-0 pb-2">이벤트ID</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cuponList}" var="cupon">
				<tr>
					<td class="align-middle">${cupon.couponNo}</td>
					<td class="align-middle">${cupon.couponNm}</td>
					<td class="align-middle">${cupon.couponDc}</td>
					<td class="align-middle">${cupon.couponPd}</td>
					<td class="align-middle">${cupon.couponDe}</td>
					<td class="align-middle">${cupon.couponDiscount}</td>
					<td class="align-middle">${cupon.eventId}</td>
				</tr>
			</c:forEach>

		</tbody>



	</table>
</div>
