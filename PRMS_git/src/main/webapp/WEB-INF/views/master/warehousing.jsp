<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex align-items-center mb-3">
	<div>
		<h3 class="page-header mb-0">상품입고 페이지</h3>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="table-responsive">
				<form method="post" action="${pageContext.request.contextPath }/main/master/partprodinup">
					<table class="table table-hover text-nowrap">
							<tr>
								<th>상품ID</th>
								<td class="align-middle"><input type="text" id="prodId" name="prodId" value="${prodId}" readonly /></td>
							</tr>
							<tr>
								<th>입고수량</th>
								<td class="align-middle"><input type="number" id="warQy" name="warQy" /></td>
							</tr>
							<tr>
								<td colspan="2" class="align-middle" style="text-align: center;">
									<button class="btn btn-theme fw-semibold fs-13px" type="submit">상품 입고</button>
								</td>
							</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

