<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex align-items-center mb-3">
	<div>
		<h3 class="page-header mb-0">감사관리 상세페이지</h3>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="table-responsive">
				<form method="post" action="${pageContext.request.contextPath }/market/update">
					<table class="table table-hover text-nowrap">
							<tr>
								<th>점검번호</th>
								<td class="align-middle"><input type="text" id="auditNo" name="auditNo" value="${auditVO.auditNo}" readonly/></td>
							</tr>
							<tr>
								<th>가맹점번호</th>
								<td class="align-middle"><input type="text" id="franchiseId" name="franchiseId" value="${auditVO.franchiseId}" readonly/></td>
							</tr>
							<tr>
								<th>체크리스트번호</th>
								<td class="align-middle"><input type="text" id="checkNo" name="checkNo" value="${auditVO.checkNo}" readonly/></td>
							</tr>
							<tr>
								<th>감사날짜</th>
								<td class="align-middle"><input type="datetime" id="auditDe" name="auditDe" value="${auditVO.auditDe}"/></td>
							</tr>
							<tr>
								<th>감사통과여부</th>
								<td class="align-middle"><input type="text" id="auditConfmAt" name="auditConfmAt" value="${auditVO.auditConfmAt}"/></td>
							</tr>
							<tr>
								<th>감사결과</th>
								<td class="align-middle"><input type="text" id="auditResult" name="auditResult" value="${auditVO.auditResult}"/></td>
							</tr>
							<tr>
								<th>감사상태내용</th>
								<td class="align-middle"><input type="text" id="auditSttus" name="auditSttus" value="${auditVO.auditSttus}"/></td>
							</tr>
							<tr>
								<td colspan="2" class="align-middle" style="text-align: center;">
									<button class="btn btn-theme fw-semibold fs-13px" type="submit">수정하기</button>
								</td>
							</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>