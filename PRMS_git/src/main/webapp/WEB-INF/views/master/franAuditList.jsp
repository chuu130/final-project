<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM" var="today" />

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/franAuditList" var="franAuditListUrl" />
			<li class="breadcrumb-item"><a href="${franAuditListUrl }">가맹점감사관리</a></li>
			<li class="breadcrumb-item active">가맹점감사결과</li>
		</ul>
		<h1 class="page-header mb-0">가맹점 감사결과</h1>
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
					<thead class="boardlist-head">
						<tr>
							<th>가맹점명</th>
							<th>감사통과여부</th>
							<th>감사상태내용</th>
							<th>감사날짜</th>
							<th>감사결과</th>
						</tr>
					</thead>
					<tbody class="bodycontent">
						<c:forEach items="${auditList }" var="audit">
							<tr>
								<td class="align-middle">
									${audit.franchise.franchiseNm}
								</td>
								<c:choose>
									<c:when test="${'Y' eq audit.auditConfmAt }">
										<td class="align-middle">
										<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>통과
					                    </span>
					                    </td>
									</c:when>
									<c:when test="${empty audit.auditConfmAt }">
										<td class="align-middle">
										<span class="badge text-secondary bg-secondary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>작성필요
					                    </span>
					                    </td>
									</c:when>
									<c:otherwise>
										<td class="align-middle">
										<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>교육필요
					                    </span>
					                    </td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${empty audit.auditSttus }">
										<td class="align-middle">-</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle">${audit.auditSttus }</td>

									</c:otherwise>
								</c:choose>
								<td class="align-middle">${audit.auditDe }</td>
								<c:choose>
									<c:when test="${'우수' eq audit.auditResult }">
										<td class="align-middle">
										<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>우수
					                    </span>
					                    </td>
									</c:when>
									<c:when test="${'양호' eq audit.auditResult}">
										<td class="align-middle">
										<span class="badge text-warning bg-warning bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>양호
					                    </span>
					                    </td>
									</c:when>
									<c:when test="${empty audit.auditResult}">
										<td class="align-middle">
										<span class="badge text-secondary bg-secondary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>미작성
					                    </span>
					                    </td>
									</c:when>
									<c:otherwise>
										<td class="align-middle">
										<span class="badge text-danger bg-primary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>미달
					                    </span>
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
    	 url: `${cPath}/main/master/franPostAuditList`,
    	 data :{ "date" : date},
    	 type : "POST",
    	 success:(audit)=>{
				console.log(audit);
// 				console.log(data[1].franprodsetl.franprodSetlDe);
// 				console.log(data[0].franprod.length);
				body.empty();

				if(audit.length ===0){
					var tdTags =`
					<td>감사관리 내역이 없습니다.</td>
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

							if(audit[i].auditConfmAt === 'Y'){
								trTags +=`
										<td class="align-middle">
											<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
						                        <i class=""></i>통과
						                    </span>
				                    	</td>
				                   `;
							}else if(audit[i].auditConfmAt === null){
								trTags +=`
									<td class="align-middle">
										<span class="badge text-secondary bg-secondary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>작성필요
					                    </span>
				                    </td>
			                   `;
							}
							else{
								trTags +=`
									<td class="align-middle">
										<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					                        <i class=""></i>교육필요
					                    </span>
				                    </td>
			                   `;
							}
						if(audit[i].auditSttus === null){
							trTags += `
								<td class="align-middle">-</td>
								`;

						}else{
							trTags += `
								<td class="align-middle">\${audit[i].auditSttus }</td>
								`;

						}
						trTags +=`
							<td class="align-middle">\${audit[i].auditDe }</td>
						`;
						if(audit[i].auditResult === '우수'){
							trTags += `
								<td class="align-middle">
									<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
				                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>우수
				                    </span>
			                    </td>
		                    </tr>
							`;
						}else if(audit[i].auditResult === '양호'){
							trTags += `
								<td class="align-middle">
									<span class="badge text-warning bg-warning bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
				                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>양호
				                    </span>
			                    </td>
		                    </tr>
							`;
						}else if(audit[i].auditResult === null){
							trTags += `
								<td class="align-middle">
									<span class="badge text-secondary bg-secondary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
				                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>미작성
				                    </span>
			                    </td>
		                    </tr>
							`;
						}
						else{
							trTags += `
								<td class="align-middle">
									<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
				                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>미달
				                    </span>
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
