<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form method="post" action="${pageContext.request.contextPath }/main/master/insertmemo.do">
		<div class="d-flex align-items-center mb-3">
			<div>
				<h1 class="page-header mb-0">공문등록페이지</h1>
			</div>
		</div>
		<div class="card">
			<div class="tab-content p-4">
				<div class="tab-pane fade show active" id="allTab" role="tabpanel">
					<div class="table-responsive">
						<table class="table table-hover text-nowrap">
							<tr>
								<th class="align-middle">공문제목</th>
								<td><input type="text" id="memoranNm" name="memoranNm" /></td>
							</tr>
							<tr>
								<th class="align-middle">공문내용</th>
								<td><input type="text" id="memoranCn" name="memoranCn" /></td>
							</tr>
							<tr>
								<th class="align-middle">발송일</th>
								<td><input type="datetime" id="memoranDe" name="memoranDe" /></td>
							</tr>
							<tr>
								<th class="align-middle">가맹점ID</th>
								<td><input type="text" id="franchiseId" name="franchiseId" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button type="submit" class="btn btn-theme fw-semibold fs-13px">등록하기</button>
								</td>
							</tr>
						</table>
					</div>

				</div>
			</div>
		</div>
</form>
