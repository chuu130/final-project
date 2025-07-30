<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="modal-header">
	<h5 class="modal-title">예약 상세 정보</h5>
	<button type="button" class="btn-close" data-bs-dismiss="modal"
		aria-label="Close"></button>
</div>
<div class="modal-body" style="padding: 20px 30px;">
	<div class="card-body">
	<table id="tableres" class="table" style="font-size: 16px;margin: 0;">
			<tr>
				<th>예약 번호</th>
				<td># ${resDetail.resHotelNo}</td>
			</tr>
			<tr>
				<th>호텔방 번호</th>
				<td>${resDetail.hotelId}</td>
			</tr>
			<tr>
				<th>결제한 날짜</th>
				<td>${resDetail.resHotelRegistDe}</td>
			</tr>
			<tr>
				<th>고객명</th>
				<td>${resDetail.mem.memNm}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${resDetail.mem.memTelno}</td>
			</tr>
			<tr>
				<th>반려동물 정보</th>
				<td>
					<table id="btresdetail" class="table" style="text-align: center;width: 90%;">
						<thead>
						<tr>
							<th>반려동물이름</th>
							<th>반려동물종</th>
							<th>반려동물몸무게</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>${resDetail.pet.petNm }</td>
							<td>${resDetail.cmmnCodeNm }</td>
							<td>${resDetail.pet.petWeight }kg</td>
						</tr>
						</tbody>
					</table>
				</td>
			</tr>
	</table>
	</div>
</div>
<div class="modal-footer" style="border:0;">
	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
</div>
