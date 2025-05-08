<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post" action="${pageContext.request.contextPath }/main/master/updatememo.do">
		<div class="d-flex align-items-center mb-3">
			<div>
				<h1 class="page-header mb-0">공문상세페이지</h1>
			</div>
		</div>
		<div class="card">
			<ul class="nav nav-tabs nav-tabs-v2 px-3" role="tablist">
				<li class="nav-item me-2" role="presentation"><a href="#allTab"
					class="nav-link active px-2" data-bs-toggle="tab"
					aria-selected="true" role="tab">전체</a></li>
			</ul>
			<div class="tab-content p-4">
				<div class="tab-pane fade show active" id="allTab" role="tabpanel">
					<div class="table-responsive">
						<table class="table table-hover text-nowrap">
							<tr>
								<th class="align-middle">공문번호</th>
								<td><input type="number" id="memoranNo" name="memoranNo" value="${memoVO.memoranNo}" readonly /></td>
							</tr>
							<tr>
								<th class="align-middle">공문제목</th>
								<td><input type="text" id="memoranNm" name="memoranNm" value="${memoVO.memoranNm}" /></td>
							</tr>
							<tr>
								<th class="align-middle">공문내용</th>
								<td><input type="text" id="memoranCn" name="memoranCn" value="${memoVO.memoranCn}" /></td>
							</tr>
							<tr>
								<th class="align-middle">발송일</th>
								<td><input type="text" id="memoranDe" name="memoranDe" value="${memoVO.memoranDe}" readonly /></td>
							</tr>
							<tr>
								<th class="align-middle">가맹점ID</th>
								<td><input type="text" id="franchiseId" name="franchiseId" value="${memoVO.franchiseId}" readonly /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button class="btn btn-theme fw-semibold fs-13px" type="submit">수정하기</button>
									<button class="btn btn-theme fw-semibold fs-13px" type="button" id="delBtn">삭제하기</button>
								</td>
							</tr>
						</table>
					</div>

				</div>
			</div>
		</div>
</form>

<script type="text/javascript" defer="defer">
	document.addEventListener("DOMContentLoaded", ()=>{
		let delBtn = document.getElementById("delBtn");
		console.log("DOMContentLoaded delBtn : ", delBtn);

		let memoranNo = document.getElementById("memoranNo");
		console.log("DOMContentLoaded memoranNo : ", memoranNo);

		delBtn.addEventListener("click", function(){
			$.ajax({
				type:"POST",
				url:`${cPath}/main/master/deletememo.do`,
				data: {
					"memoranNo" : memoranNo.value
				},
				success : function(res){
	            	alert("삭제 성공", res);
	            	location.href = `${cPath}/main/master/memorandumList.do`;
	           },
	           error : function(error){
	            	alert("삭제 실패");
	           }
			});
		});
	});
</script>
