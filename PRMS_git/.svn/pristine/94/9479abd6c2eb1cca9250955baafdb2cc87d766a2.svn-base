<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM" var="today" />

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/franchiseAuditList#franchiseAuditList" var="franchiseAuditListUrl" />
			<li class="breadcrumb-item"><a href="${franchiseAuditListUrl }">가맹점감사관리</a></li>
			<li class="breadcrumb-item active">가맹점감사평가</li>
		</ul>
		<h1 class="page-header mb-0">가맹점감사 평가</h1>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div class="input-group" style="margin-bottom: 20px;width: 50%;">
				<input type="text" class="form-control" id="datepicker"
					placeholder="${today }" > <label class="input-group-text"
					for="datepicker"> <i class="fa fa-calendar"></i>
				</label>
			</div>

			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>가맹점명</th>
							<th>점검확인</th>
							<th>가망잼 전화번호</th>
							<th>가맹점지역</th>
							<th>가맹점주소</th>
							<th>가망점감사작성</th>
						</tr>
					</thead>
					<tbody class="bodycontent">
						<c:forEach items="${franchiseAuditList }" var="audit">
								<fmt:parseDate value="${audit.auditDeCheck }" var="checkDate" pattern="yyyy-MM-dd'T'HH:mm" />
								<fmt:formatDate value="${checkDate}" pattern="yyyy-MM" var="check"/>
							<tr>
								<td class="align-middle">
									${audit.franchise.franchiseNm}
								</td>
								<c:choose>

									<c:when test="${not empty audit.checkNo }">
										<td>
											<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>감사확인
					                    	</span>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>작성필요
					                    	</span>
										</td>
									</c:otherwise>
								</c:choose>

								<td class="align-middle">${audit.franchise.franchiseTel }</td>
								<td class="align-middle">${audit.cmmncode.cmmnCodeNm }</td>
								<td class="align-middle">${audit.franchise.franchiseAdd1 }
								${audit.franchise.franchiseAdd2 }</td>
								<c:choose>
									<c:when test="${not empty audit.checkNo  }">
										<td>
<%-- 											<form class="InsertCheckList" action="${cPath }/main/master/franAduitCheckList#franchiseAuditList" method="POST"> --%>
<%-- 												<input type="hidden" name="franId" value="${audit.franchise.franchiseId }"/> --%>
<%-- 												<input type="hidden" name="franDe" value="${check}"/> --%>
<!-- 												<input type="submit" class="btn btn-outline-dark checkList" name="checkList" value="체크리스트 내역" /> -->
												<a type="button"
										data-bs-toggle="modal" data-bs-target="#modalDetail" data-id="${audit.franchise.franchiseId }" data-de="${check }"><i
											class="btn btn-outline-dark checkList">체크리스트 내역</i></a>
												
<!-- 											</form> -->
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<form class="InsertCheckList" action="${cPath }/main/master/writeFranAuditCheckList#franchiseAuditList" method="GET">
												<input type="hidden" name="franId" value="${audit.franchise.franchiseId }"/>
												<input type="hidden" name="franDe" value="${check}"/>
												<input type="submit" class="btn btn-outline-theme checkList" name="checkList" value="체크리스트 작성" />
											</form>
										</td>
									</c:otherwise>
								</c:choose>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalDetail">
	<div class="modal-dialog" style="max-width: 600px">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">${check } 체크리스트 내역</h5>
				<button class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row gx-4 align-items-center">
					<div class="col-sm-7 py-1 fs-13px">
						<div class="row mb-10px">
							<div class="col-4 fw-bold">가맹점명:</div>
							<div class="col-8 text-body">iPhone 14 Pro Max</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">청결도항목:</div>
							<div class="col-8 text-body" id="checkClean">Space Black</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">호텔 & 미용 리뷰 평가항목:</div>
							<div class="col-8 text-body"></div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">재고관리항목:</div>
							<div class="col-8 text-body">$1,999</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">친절도항목:</div>
							<div class="col-8 text-body">$1,899</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">직무이해도항목:</div>
							<div class="col-8 text-success">$200</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">안전점검항목:</div>
							<div class="col-8 text-success">$200</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">매장관리항목:</div>
							<div class="col-8 text-success">$200</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-bs-dismiss="modal"
					class="btn btn-default fs-13px fw-semibold w-100px">취소</a>
			</div>
		</div>
	</div>
</div>
<script src="${cPath }/resources/js/app/master/franchiseAuditList.js"></script>
<script>
  $('#datepicker').datepicker({
    autoclose: true,
    format: "yyyy-mm",
    startView: "months",
    minViewMode: "months",
    months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    language : "ko"

  }).on("changeDate", function(e) {
      //picker_event는 "이벤트명" 이런 식으로 적는다.
      //하고 싶은 행동
      console.log(e.target.value.toString());
      var date = e.target.value.toString();

      var body = $(".bodycontent");

   		// 현재 날짜와 시간을 가져오기
      const currentDate = new Date();

      // 날짜와 시간을 문자열로 포맷팅
      const formattedDate = `${currentDate.getFullYear()}-${currentDate.getMonth() + 1}`;

      const formattedDate1 = currentDate.getFullYear()+ "-0" +(currentDate.getMonth() + 1);
      $.ajax({
    	 url: `${cPath}/main/master/franchisePostAuditList`,
    	 data :{ "date" : date},
    	 type : "POST",
    	 success:(audit)=>{
				console.log(audit);
// 				console.log(data[1].franprodsetl.franprodSetlDe);
// 				console.log(data[0].franprod.length);
				body.empty();

				if(audit.length ===0){
					var tdTags =`
					<td>점검 내역이 없습니다.</td>
					`;
					body.append(tdTags);
				}else{


				for(var i=0; i<audit.length; i++){
					console.log(audit[0].auditDe);
					var trTags = `
						<tr>
						<td class="align-middle">
							\${audit[i].franchise.franchiseNm}
						</td>
					`;

					if(audit[i].checkNo !== null){
						trTags +=`
							<td>
								<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
		                        <i class=""></i>감사확인
		                    	</span>
							</td>
						`;

					}else{
						trTags +=`
							<td>
								<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
		                        <i class=""></i>작성필요
		                    	</span>
							</td>
						`;
					}

						trTags += `
						<td class="align-middle">\${audit[i].franchise.franchiseTel }</td>
						<td class="align-middle">\${audit[i].cmmncode.cmmnCodeNm }</td>
						<td class="align-middle">\${audit[i].franchise.franchiseAdd1 }
						\${audit[i].franchise.franchiseAdd2 }</td>

						`;

						if(audit[i].checkNo !== null){
							trTags +=`
								<td>
									
									<a type="button"
										data-bs-toggle="modal" data-bs-target="#modalDetail" data-id="\${audit[i].franchise.franchiseId }" data-de="\${audit[i].auditDe}"><i
											class="btn btn-outline-dark checkList">체크리스트 내역</i></a>
								</td>
							</tr>
							`;
						}else{
							trTags +=`
								<td>
									<form class="InsertCheckList" action="${cPath }/main/master/writeFranAuditCheckList" method="GET">
										<input type="hidden" name="franId" value="\${audit[i].franchise.franchiseId }"/>
										<input type="hidden" name="franDe" value="\${audit[i].auditDe}"/>
										<input type="submit" class="btn btn-outline-theme checkList" name="checkList" value="체크리스트 작성" />
									</form>
								</td>
							</tr>
							`;
						}


					body.append(trTags);

					}
				}
			},
			error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		});

     });
</script>

<%-- <form class="InsertCheckList" action="${cPath }/main/master/franAduitCheckList" method="GET"> --%>
<!-- 										<input type="hidden" name="franId" value="\${audit[i].franchise.franchiseId }"/> -->
<!-- 										<input type="hidden" name="franDe" value="\${audit[i].auditDe}"/> -->
<!-- 										<input type="submit" class="btn btn-outline-dark checkList" name="checkList" value="체크리스트 내역" /> -->
<!-- 									</form> -->