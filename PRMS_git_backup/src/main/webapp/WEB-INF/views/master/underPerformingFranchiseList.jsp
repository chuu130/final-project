<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/underPerformingFranchiseList" var="underPerformingUrl" />
			<li class="breadcrumb-item"><a href="${underPerformingUrl }">가맹점감사관리</a></li>
			<li class="breadcrumb-item active">부진매장관리</li>
		</ul>
		<h1 class="page-header mb-0">부진매장관리</h1>
	</div>
</div>
<div class="card p-3 mb-5">
    <div class="col-xl-12 col-lg-12">
<!--         <div class="card mb-3"> -->
            <div class="card-body" >
<!--                 <div class="mb-3 fw-semibold d-flex align-items-center"> -->
<!--                     <div class="flex-fill" id="mainCardSmTitle">월별 매출</div> -->
<!--                     <div> -->
<!--                         <a href="#" class="text-body" aria-expanded="false"><i class="fa-solid fa-angle-right" style="color: #818181;"></i></a> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="d-flex" style="width: 100%;height:300px;">
<%--                     <canvas id="barChart" style="width: 100%;height:100%;"></canvas> --%>
					<canvas id="lineChart" style="width: 100%;height:100%;"></canvas>
                </div>
            </div>
<!--         </div> -->
    </div>
</div>
<c:forTokens items="" delims=""></c:forTokens>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<c:set  var="thisSelling" value="${thisYearSellingList }"></c:set>
			<c:set  var="thisExpense" value="${thisYearExpenseList }"></c:set>
			<c:set  var="lastSelling" value="${LastYearSellingList }"></c:set>
			<c:set  var="lastExpense" value="${LastYearExpenseList }"></c:set>




			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th></th>
							<th>가맹점명</th>
							<th>작년(2023) 매출액</th>
							<th>작년(2023) 지출액</th>
							<th>작년 영업이익</th>
							<th>올해(2024) 매출액</th>
							<th>올해(2024) 지출액</th>
							<th>올해 영업이익</th>
						</tr>
					</thead>
					<tbody class="bodycontent">
						<c:forEach var="i" begin="0" end="${thisSelling.size()-1 }" step="1">
							<fmt:formatNumber value="${thisSelling[i].totalThisyearSelling }" pattern="#,###" var="totalThisyearSelling"/>
							<fmt:formatNumber value="${thisExpense[i].totalThisyearExpense }" pattern="#,###" var="totalThisyearExpense"/>
							<fmt:formatNumber value="${lastSelling[i].totalLastyearSelling }" pattern="#,###" var="totalLastyearSelling"/>
							<fmt:formatNumber value="${lastExpense[i].totalLastyearExpense }" pattern="#,###" var="totalLastyearExpense"/>

							<input type="hidden" value="${thisSelling[i].totalThisyearSelling}" class="totalThisyearSelling" />
							<input type="hidden" value="${lastSelling[i].totalLastyearSelling}" class="totalLastyearSelling" />
							<input type="hidden" value="${thisExpense[i].totalThisyearExpense }" class="totalThisyearExpense" />
							<input type="hidden" value="${lastExpense[i].totalLastyearExpense }" class="totalLastyearExpense" />
							<tr>
								<c:choose>
								<c:when test="${'멍냥몰 세종호려점' eq thisSelling[i].franchiseNm }">
								<td class="align-middle">
										<span class="badge  bg-opacity-15 px-2 py-6px  fs-12px d-inline-flex align-items-center"
										style="background-color: rgb(153, 102, 255, 0.6); " >
					                    </span>
					            </td>
					           	</c:when>
								<c:when test="${'멍냥몰 태평점' eq thisSelling[i].franchiseNm }">
								<td class="align-middle">
										<span class="badge  bg-opacity-15 px-2 py-6px  fs-12px d-inline-flex align-items-center"
										style="background-color: rgb(255, 159, 64, 0.6); " >
					                    </span>
					            </td>
					           	</c:when>
								<c:when test="${'멍냥몰 서울강남구점' eq thisSelling[i].franchiseNm }">
								<td class="align-middle">
										<span class="badge  bg-opacity-15 px-2 py-6px  fs-12px d-inline-flex align-items-center"
										style="background-color: rgb(172, 222, 230, 0.6); " >
					                    </span>
					            </td>
					            </c:when>
								<c:when test="${'멍냥몰 서대전점' eq thisSelling[i].franchiseNm }">
								<td class="align-middle">
										<span class="badge  bg-opacity-15 px-2 py-6px  fs-12px d-inline-flex align-items-center"
										style="background-color: rgb(255, 255, 051, 0.6); " >
					                    </span>
					            </td>
					            </c:when>
								<c:when test="${'멍냥몰 수원장안구점' eq thisSelling[i].franchiseNm }">
								<td class="align-middle">
										<span class="badge  bg-opacity-15 px-2 py-6px  fs-12px d-inline-flex align-items-center"
										style="background-color: rgb(243, 176, 195, 0.6); " >
					                    </span>
					            </td>
					           	</c:when>
					           	
					           	<c:otherwise>
					           		<td></td>
					           	</c:otherwise>
					           	</c:choose>
								<td >${thisSelling[i].franchiseNm }</td>
								<td class="">${totalLastyearSelling }원</td>
								<td class="">${totalLastyearExpense }원</td>
								<c:choose>
									<c:when test="${0 gt lastSelling[i].totalLastyearSelling - lastExpense[i].totalLastyearExpense }">
										<fmt:formatNumber value="${lastSelling[i].totalLastyearSelling - lastExpense[i].totalLastyearExpense}" pattern="#,###" var="lastProfit"/>
										<td style="color: red;">${lastProfit}원</td>
									</c:when>
									<c:when  test="${0 lt lastSelling[i].totalLastyearSelling - lastExpense[i].totalLastyearExpense }">
										<fmt:formatNumber value="${lastSelling[i].totalLastyearSelling - lastExpense[i].totalLastyearExpense}" pattern="#,###" var="lastProfit"/>
										<td style="color: blue;">${lastProfit}원</td>
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${lastSelling[i].totalLastyearSelling - lastExpense[i].totalLastyearExpense}" pattern="#,###" var="lastProfit"/>
										<td>${lastProfit}원</td>
									</c:otherwise>
								</c:choose>
								<td class="">${totalThisyearSelling }원</td>
								<td class="">${totalThisyearExpense }원</td>
								<c:choose>
									<c:when test="${0 gt thisSelling[i].totalThisyearSelling - thisExpense[i].totalThisyearExpense }">
										<fmt:formatNumber value="${thisSelling[i].totalThisyearSelling - thisExpense[i].totalThisyearExpense}" pattern="#,###" var="thisProfit"/>
										<td style="color: red;">${thisProfit}원</td>
									</c:when>
									<c:when  test="${0 lt thisSelling[i].totalThisyearSelling - thisExpense[i].totalThisyearExpense }">
										<fmt:formatNumber value="${thisSelling[i].totalThisyearSelling - thisExpense[i].totalThisyearExpense}" pattern="#,###" var="thisProfit"/>
										<td style="color: blue;">${thisProfit}원</td>
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${thisSelling[i].totalThisyearSelling - thisExpense[i].totalThisyearExpense}" pattern="#,###" var="thisProfit"/>
										<td>${thisProfit}원</td>
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
$(document).ready(function() {
    // Line Chart
    var totalThisyearSelling = document.querySelectorAll(".totalThisyearSelling");
    var totalLastyearSelling = document.querySelectorAll(".totalLastyearSelling");
    var totalThisyearExpense = document.querySelectorAll(".totalThisyearExpense");
    var totalLastyearExpense = document.querySelectorAll(".totalLastyearExpense");
    
    console.log(totalLastyearSelling[0].value);
    console.log(totalThisyearSelling[0].value);
    var ctx4 = document.getElementById('lineChart');
    var lineChart = new Chart(ctx4, {
        type: 'bar',
        data: {
            labels: ['2023년 매출', '2023년 지출', '2024년 매출', '2024년 지출'], // 12월까지 확장
            datasets: [
              {
                label: '멍냥몰 세종호려점',
                borderColor: 'rgba(153, 102, 255, 0.6)', // 파스텔톤 보라색
                backgroundColor: 'rgba(153, 102, 255, 0.2)', // 파스텔톤 보라색의 배경
                borderWidth: 1.5,
                pointBackgroundColor: 'rgba(255, 255, 255, 1)', // 흰색 포인트 배경
                pointBorderColor: 'rgba(153, 102, 255, 1)', // 포인트 테두리 색상
                pointBorderWidth: 1.5,
                pointRadius: 4,
                pointHoverBackgroundColor: 'rgba(153, 102, 255, 0.8)', // 호버 시 포인트 배경
                pointHoverBorderColor: 'rgba(153, 102, 255, 1)', // 호버 시 포인트 테두리
                pointHoverRadius: 7,
                data: [totalLastyearSelling[0].value, totalThisyearExpense[0].value, totalThisyearSelling[0].value, totalLastyearExpense[0].value ] // 데이터 예시
              },
              {
                label: '멍냥몰 태평점',
                borderColor: 'rgba(255, 159, 64, 0.6)',
                backgroundColor: 'rgba(255, 159, 64, 0.2)',
                borderWidth: 1.5,
                pointBackgroundColor: 'rgba(255, 255, 255, 1)',
                pointBorderColor: 'rgba(255, 159, 64, 1)',
                pointBorderWidth: 1.5,
                pointRadius: 4,
                pointHoverBackgroundColor: 'rgba(255, 159, 64, 0.8)',
                pointHoverBorderColor: 'rgba(255, 159, 64, 1)',
                pointHoverRadius: 7,
                data: [totalLastyearSelling[1].value, totalThisyearExpense[1].value, totalThisyearSelling[1].value, totalLastyearExpense[1].value] // 데이터 예시
              },
              {
                label: '멍냥몰 서울강남구점',
                borderColor: 'rgba(172, 222, 230, 0.6)',
                backgroundColor: 'rgba(172, 222, 230, 0.2)',
                borderWidth: 1.5,
                pointBackgroundColor: 'rgba(255, 255, 255, 1)',
                pointBorderColor: 'rgba(172, 222, 230, 1)',
                pointBorderWidth: 1.5,
                pointRadius: 4,
                pointHoverBackgroundColor: 'rgba(172, 222, 230, 0.8)',
                pointHoverBorderColor: 'rgba(172, 222, 230, 1)',
                pointHoverRadius: 7,
                data: [totalLastyearSelling[2].value, totalThisyearExpense[2].value, totalThisyearSelling[2].value, totalLastyearExpense[2].value] // 데이터 예시
              },
              {
                label: '멍냥몰 서대전점',
                borderColor: 'rgba(255, 255, 051, 0.6)',
                backgroundColor: 'rgba(255, 255, 051, 0.2)',
                borderWidth: 1.5,
                pointBackgroundColor: 'rgba(255, 255, 255, 1)',
                pointBorderColor: 'rgba(255, 255, 051, 1)',
                pointBorderWidth: 1.5,
                pointRadius: 4,
                pointHoverBackgroundColor: 'rgba(255, 255, 051, 0.8)',
                pointHoverBorderColor: 'rgba(255, 255, 051, 1)',
                pointHoverRadius: 7,
                data: [totalLastyearSelling[3].value, totalThisyearExpense[3].value, totalThisyearSelling[3].value, totalLastyearExpense[3].value] // 데이터 예시
              },
              {
                label: '멍냥몰 수원장안구점',
                borderColor: 'rgba(243, 176, 195, 0.6)',
                backgroundColor: 'rgba(243, 176, 195, 0.2)',
                borderWidth: 1.5,
                pointBackgroundColor: 'rgba(255, 255, 255, 1)',
                pointBorderColor: 'rgba(243, 176, 195, 1)',
                pointBorderWidth: 1.5,
                pointRadius: 4,
                pointHoverBackgroundColor: 'rgba(243, 176, 195, 0.8)',
                pointHoverBorderColor: 'rgba(243, 176, 195, 1)',
                pointHoverRadius: 7,
                data: [totalLastyearSelling[4].value, totalThisyearExpense[4].value, totalThisyearSelling[4].value, totalLastyearExpense[4].value] // 데이터 예시
              }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            indexAxis: 'x',
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            if (value >= 100000000) {
                                return (value / 100000000).toFixed(1) + '억';  // '억' 단위로 변환
                            } else {
                                return value.toLocaleString();  // 일반 숫자
                            }
                        }
                    }
                }
            }
        }
    });
});
   </script>