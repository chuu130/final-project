<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="table-responsive">
	<table class="table table-hover text-nowrap">
		<thead>
			<tr>
				<th class="pt-0 pb-2">이벤트ID</th>
				<th class="pt-0 pb-2">이벤트제목</th>
				<th class="pt-0 pb-2">이벤트내용</th>
				<th class="pt-0 pb-2">이벤트시작날짜</th>
				<th class="pt-0 pb-2">이벤트종료날짜</th>
				<th class="pt-0 pb-2">직원번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${eventList}" var="Event">
				<tr>
					<td class="align-middle">${Event.eventId}</td>
					<td class="align-middle">${Event.eventNm}</td>
					<td class="align-middle">${Event.eventCn}</td>
					<td class="align-middle">${Event.eventBeginDe}</td>
					<td class="align-middle">${Event.eventEndDe}</td>
					<td class="align-middle">${Event.empNo}</td>
				</tr>
			</c:forEach>

		</tbody>



	</table>
</div>
