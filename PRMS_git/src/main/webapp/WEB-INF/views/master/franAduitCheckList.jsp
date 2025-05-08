<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex align-items-center mb-3">
	<div>
		<h1 class="page-header mb-0">체크리스트내역</h1>
	</div>
</div>
<fmt:parseDate
							value="${checkList.franaudit.auditDe}"
							pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
						<fmt:formatDate pattern="yyyy-MM"
							value="${ parsedDateTime }" var="date" />
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">

						<h3>${date } </h3>
			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>가맹점명</th>
							<th>청결도항목</th>
							<th>호텔 & 미용 리뷰 평가항목</th>
							<th>재고관리항목</th>
							<th>친절도항목</th>
							<th>직무이해도항목</th>
							<th>안전점검항목</th>
							<th>매장관리항목</th>
						</tr>
					</thead>
					<tbody class="bodycontent">
							
							<tr>
								<td class="align-middle">
									${checkList.franchise.franchiseNm}
								</td>
								
								<td class="align-middle">${checkList.checkClean }</td>
								<td class="align-middle">${checkList.checkReview }</td>
								<td class="align-middle">${checkList.checkStock }</td>
								<td class="align-middle">${checkList.checkKind }</td>
								<td class="align-middle">${checkList.checkJob }</td>
								<td class="align-middle">${checkList.checkSafety }</td>
								<td class="align-middle">${checkList.checkStore }</td>
							</tr>

					</tbody>
					
				</table>
							<input type="button" class="btn btn-success" onclick="history.back()" style="float: right;" value="뒤로가기" />
			</div>

		</div>
	</div>
</div>
  
    