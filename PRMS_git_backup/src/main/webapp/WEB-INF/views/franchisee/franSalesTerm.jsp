<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="d-flex mb-3">
    <div>
        <ul class="breadcrumb">
            <c:url value="/main/master/franchise" var="franList" />
            <li class="breadcrumb-item">매출관리</li>
            <li class="breadcrumb-item active"><a href="${franList }">기간별판매매출</a></li>
        </ul>
        <h1 class="page-header mb-0">기간별 판매매출</h1>
    </div>
</div>

<div class="card p-3 mb-5">
	<div style="display: flex;justify-content: flex-end;">
		<button class="btn btn-outline-default dropdown-toggle" id="dropdownMenuButton1" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:100px;margin-right: 10px;">기간선택 &nbsp;</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(424px, 231px);" data-popper-escaped="" data-popper-placement="bottom-start">
			<a class="dropdown-item" href="#" data-value="월별">월별</a>
			<a class="dropdown-item" href="#" data-value="분기별">분기별</a>
			<a class="dropdown-item" href="#" data-value="연도별">연도별</a>
		</div>
		<button class="btn btn-outline-default dropdown-toggle" id="dropdownMenuButton2" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:100px;margin-right: 30px;">연도선택 &nbsp;</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(424px, 231px);" data-popper-escaped="" data-popper-placement="bottom-start">
			<a class="dropdown-item" href="#" data-value="2024">2024</a>
			<a class="dropdown-item" href="#" data-value="2023">2023</a>
			<a class="dropdown-item" href="#" data-value="2022">2022</a>
		</div>
	</div>
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
<c:set var="salesFexps" value="${franSalesFexpsList }"></c:set>
<c:set var="salesFsel" value="${franSalesFselList }"></c:set>
<div class="card p-3 mb-5">
    <div class="tab-content p-4">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="text-center">
                <thead>
                    <tr>
<!--                         <th>#</th> -->
                        <th>#</th>
                        <th>매출총액</th>
                        <th>매출원가</th>
                        <th>매출이익</th>
                    </tr>
                </thead>
                <tbody id="text-middle" class="list-body">
	                    <tr>
		                    <td>1월</td>
	                        <td>18,090,000원</td>
	                        <td>10,440,000원</td>
	                        <td>7,650,000원</td>
	                    </tr>
	                    <tr>
		                    <td>2월</td>
	                        <td>32,000,000원</td>
	                        <td>23,100,000원</td>
	                        <td>8,900,000원</td>
	                    </tr>
	                    <tr>
		                    <td>3월</td>
	                        <td>14,020,000원</td>
	                        <td>7,500,000원</td>
	                        <td>6,520,000원</td>
	                    </tr>
	                    <tr>
		                    <td>4월</td>
	                        <td>12,100,000원</td>
	                        <td>8,099,500원</td>
	                        <td>4,000,500원</td>
	                    </tr>
	                    <tr>
		                    <td>5월</td>
	                        <td>8,000,000원</td>
	                        <td>6,800,000원</td>
	                        <td>1,200,000원</td>
	                    </tr>
	                    <tr>
		                    <td>6월</td>
	                        <td>25,030,000원</td>
	                        <td>17,830,000원</td>
	                        <td>7,200,000원</td>
	                    </tr>
	                    <tr>
		                    <td>7월</td>
	                        <td>13,002,000원</td>
	                        <td>9,001,000원</td>
	                        <td>4,001,000원</td>
	                    </tr>
	                    <tr>
		                    <td>8월</td>
	                        <td>20,102,000원</td>
	                        <td>14,082,000원</td>
	                        <td>6,020,000원</td>
	                    </tr>
	                    <tr>
		                    <td>9월</td>
	                        <td>15,323,300원</td>
	                        <td>10,123,200원</td>
	                        <td>5,200,100원</td>
	                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:if test="${not empty message }">
    <script>
        Swal.fire('<c:out value="${message}" escapeXml="true"/>', '', 'success');
    </script>
    <c:remove var="message" scope="session" />
</c:if>

<script>
$(document).ready(function() {
    // Line Chart
    var ctx4 = document.getElementById('lineChart');
    var lineChart = new Chart(ctx4, {
        type: 'line',
        data: {
            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 12월까지 확장
            datasets: [
              {
                label: '총 매출',
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
                data: [18090000, 32000000, 14020000, 12100000, 8000000, 25030000, 13002000, 20102000, 15323300] // 데이터 예시
              },
              {
                label: '매출 이익',
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
                data: [7650000, 8900000, 6520000, 4000500, 1200000, 7200000 , 4001000, 6020000, 5200100] // 데이터 예시
              }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });

    // 초기 차트 설정
    $('#lineChart').show();  // lineChart를 기본으로 표시
    $("#dropdownMenuButton1").html('월별&nbsp;');  // 기본 기간 선택을 '월별'로 설정
    $("#dropdownMenuButton2").html('2024&nbsp;');  // 기본 연도 선택을 '2024'로 설정

    var selectedPeriod = '월별';  // 기본 기간을 월별로 설정
    var selectedYear = '2024';  // 기본 연도를 2024로 설정

    // 데이터 업데이트 함수
    function updateChart(period, year) {
        var newTotalSales = [];
        var newAverageSales = [];

        if (period === '월별') {
            lineChart.data.labels = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];  // 월별 레이블 설정
            if (year === '2024') {
                newTotalSales =[18090000, 32000000, 14020000, 12100000, 8000000, 25030000, 13002000, 20102000, 15323300];  // 2024년 월별 데이터
                newAverageSales = [7650000, 8900000, 6520000, 4000500, 1200000, 7200000 , 4001000, 6020000, 5200100] ;
            } else if (year === '2023') {
                newTotalSales = [14000002, 32100010, 23100010, 43200100, 21023000, 14200010, 18920100, 12500000, 22010000, 6210000, 15323300, 32000000];  // 2023년 월별 데이터
                newAverageSales = [2000000, 8000010, 6420100, 12100001, 6201000, 3100200, 6201000, 2000100, 4200000, 921100, 5200100, 8900000];
            } else if (year === '2022') {
                newTotalSales = [32100020, 20104200, 19202100, 17020000, 14015900, 7000100, 24100000, 12000100, 18020000, 29100200, 23019000, 15201000];  // 2022년 월별 데이터
                newAverageSales = [15210000, 7201000, 5201000, 6023010, 5421000, 1020000, 11004000, 2100000, 5201000, 8001000, 6201000, 4100000];
            }
        } else if (period === '분기별') {
            lineChart.data.labels = ['1분기', '2분기', '3분기', '4분기'];  // 분기별 레이블 설정
            if (year === '2024') {
                newTotalSales = [64110000, 45130000, 48427300];  // 2024년 분기별 데이터
                newAverageSales = [23070000, 12400500, 15221100];
            } else if (year === '2023') {
                newTotalSales = [69200022, 78423110, 53430100, 53533300];  // 2023년 분기별 데이터
                newAverageSales = [16420110, 21401201, 12401100, 15021200];
            } else if (year === '2022') {
                newTotalSales = [71406320, 38036000, 54120100, 67320200];  // 2022년 분기별 데이터
                newAverageSales = [27612000, 12464010, 18305000, 18302000];
            }
        } else if (period === '연도별') {
            lineChart.data.labels = ['2021', '2022', '2023', '2024'];  // 연도별 레이블 설정
            newTotalSales = [320010000, 230882620, 254586532, 157667300];  // 연도별 데이터
            newAverageSales = [123100000, 76683010, 65243611, 50691600];
        }

        // 차트 데이터 업데이트
        lineChart.data.datasets[0].data = newTotalSales;  // Total Sales 데이터 변경
        lineChart.data.datasets[1].data = newAverageSales;  // Average Sales 데이터 변경

        // 차트 업데이트
        lineChart.update();
    }

    // 기간 선택 시 처리
    $("#dropdownMenuButton1 + .dropdown-menu .dropdown-item").on("click", function(e){
        e.preventDefault();  // 기본 동작 방지
        selectedPeriod = $(this).data("value").toString().trim();  // 선택한 값 가져오기
        $("#dropdownMenuButton1").html(selectedPeriod + '&nbsp;');  // 버튼에 선택한 값 표시

        // 분기별이나 월별일 경우 연도 선택 버튼 표시
        if (selectedPeriod === '연도별') {
            $("#dropdownMenuButton2").hide();  // 연도별일 경우 두 번째 버튼 숨기기
        } else {
            $("#dropdownMenuButton2").show();  // 월별이나 분기별일 경우 두 번째 버튼 보이기
        }

        // 차트 업데이트
        updateChart(selectedPeriod, selectedYear);
        updateTable(selectedPeriod, selectedYear);
    });

    // 연도 선택 시 처리
    $("#dropdownMenuButton2 + .dropdown-menu .dropdown-item").on("click", function(e){
        e.preventDefault();  // 기본 동작 방지
        selectedYear = $(this).data("value").toString().trim();  // 선택한 값 가져오기
        $("#dropdownMenuButton2").html(selectedYear + '&nbsp;');  // 버튼에 선택한 값 표시

        // 차트 업데이트
        updateChart(selectedPeriod, selectedYear);
        updateTable(selectedPeriod, selectedYear);
    });
    function updateTable(period, year){
    	var table = '';
    	
        if (selectedPeriod =='월별' && selectedYear == '2024'){
        	 $(".list-body").empty();
        	table += `
        		<tr>
	                <td>1월</td>
	                <td>18,090,000원</td>
	                <td>10,440,000원</td>
	                <td>7,650,000원</td>
	            </tr>
	            <tr>
	                <td>2월</td>
	                <td>32,000,000원</td>
	                <td>23,100,000원</td>
	                <td>8,900,000원</td>
	            </tr>
	            <tr>
	                <td>3월</td>
	                <td>14,020,000원</td>
	                <td>7,500,000원</td>
	                <td>6,520,000원</td>
	            </tr>
	            <tr>
	                <td>4월</td>
	                <td>12,100,000원</td>
	                <td>8,099,500원</td>
	                <td>4,000,500원</td>
	            </tr>
	            <tr>
	                <td>5월</td>
	                <td>8,000,000원</td>
	                <td>6,800,000원</td>
	                <td>1,200,000원</td>
	            </tr>
	            <tr>
	                <td>6월</td>
	                <td>25,030,000원</td>
	                <td>17,830,000원</td>
	                <td>7,200,000원</td>
	            </tr>
	            <tr>
	                <td>7월</td>
	                <td>13,002,000원</td>
	                <td>9,001,000원</td>
	                <td>4,001,000원</td>
	            </tr>
	            <tr>
	                <td>8월</td>
	                <td>20,102,000원</td>
	                <td>14,082,000원</td>
	                <td>6,020,000원</td>
	            </tr>
	            <tr>
	                <td>9월</td>
	                <td>15,323,300원</td>
	                <td>10,123,200원</td>
	                <td>5,200,100원</td>
	            </tr>
        		
        	`;
        	 $(".list-body").append(table);
        }
        else if(selectedPeriod =='월별' && selectedYear == '2023'){
        	 $(".list-body").empty();
        	table += `
        		<tr>
                <td>1월</td>
                <td>14,000,002원</td>
                <td>12,000,002원</td>
                <td>2,000,000원</td>
            </tr>
            <tr>
                <td>2월</td>
                <td>32,100,010원</td>
                <td>24,100,000원</td>
                <td>8,000,010원</td>
            </tr>
            <tr>
                <td>3월</td>
                <td>23,100,010원</td>
                <td>16,679,910원</td>
                <td>6,420,100원</td>
            </tr>
            <tr>
                <td>4월</td>
                <td>43,200,100원</td>
                <td>31,100,099원</td>
                <td>12,100,001원</td>
            </tr>
            <tr>
                <td>5월</td>
                <td>21,023,000원</td>
                <td>14,822,000원</td>
                <td>6,201,000원</td>
            </tr>
            <tr>
                <td>6월</td>
                <td>14,200,010원</td>
                <td>11,099,810원</td>
                <td>3,100,200원</td>
            </tr>
            <tr>
                <td>7월</td>
                <td>18,920,100원</td>
                <td>12,719,100원</td>
                <td>6,201,000원</td>
            </tr>
            <tr>
                <td>8월</td>
                <td>12,500,000원</td>
                <td>10,499,900원</td>
                <td>2,000,100원</td>
            </tr>
            <tr>
                <td>9월</td>
                <td>22,010,000원</td>
                <td>17,810,000원</td>
                <td>4,200,000원</td>
            </tr>
            <tr>
                <td>10월</td>
                <td>6,210,000원</td>
                <td>5,288,900원</td>
                <td>921,100원</td>
            </tr>
            <tr>
                <td>11월</td>
                <td>15,323,300원</td>
                <td>10,123,200원</td>
                <td>5,200,100원</td>
            </tr>
            <tr>
                <td>12월</td>
                <td>32,000,000원</td>
                <td>23,100,000원</td>
                <td>8,900,000원</td>
            </tr>
        	`;
        	 $(".list-body").append(table);
        }else if(selectedPeriod =='월별' && selectedYear == '2022'){
			 $(".list-body").empty();
		 	table += `
		 		<tr>
		         <td>1월</td>
		         <td>32,100,020원</td>
		         <td>16,890,020원</td>
		         <td>15,210,000원</td>
		     </tr>
		     <tr>
		         <td>2월</td>
		         <td>20,104,200원</td>
		         <td>12,903,200원</td>
		         <td>7,201,000원</td>
		     </tr>
		     <tr>
		         <td>3월</td>
		         <td>19,202,100원</td>
		         <td>14,001,100원</td>
		         <td>5,201,000원</td>
		     </tr>
		     <tr>
		         <td>4월</td>
		         <td>17,020,000원</td>
		         <td>10,996,990원</td>
		         <td>6,023,010원</td>
		     </tr>
		     <tr>
		         <td>5월</td>
		         <td>14,015,900원</td>
		         <td>8,594,900원</td>
		         <td>5,421,000원</td>
		     </tr>
		     <tr>
		         <td>6월</td>
		         <td>7,000,100원</td>
		         <td>5,980,100원</td>
		         <td>1,020,000원</td>
		     </tr>
		     <tr>
		         <td>7월</td>
		         <td>24,100,000원</td>
		         <td>13,096,000원</td>
		         <td>11,004,000원</td>
		     </tr>
		     <tr>
		         <td>8월</td>
		         <td>12,000,100원</td>
		         <td>9,900,100원</td>
		         <td>2,100,000원</td>
		     </tr>
		     <tr>
		         <td>9월</td>
		         <td>18,020,000원</td>
		         <td>12,819,000원</td>
		         <td>5,201,000원</td>
		     </tr>
		     <tr>
		         <td>10월</td>
		         <td>29,100,200원</td>
		         <td>21,099,200원</td>
		         <td>8,001,000원</td>
		     </tr>
		     <tr>
		         <td>11월</td>
		         <td>23,019,000원</td>
		         <td>16,818,000원</td>
		         <td>6,201,000원</td>
		     </tr>
		     <tr>
		         <td>12월</td>
		         <td>15,201,000원</td>
		         <td>11,101,000원</td>
		         <td>4,100,000원</td>
		     </tr>
		 	`;
		 	 $(".list-body").append(table);
		
			}else if (selectedPeriod =='분기별' && selectedYear == '2024'){
        	 $(".list-body").empty();
	        	table += `
	        		<tr>
	                <td>1분기</td>
	                <td>64,110,000원</td>
	                <td>41,040,000원</td>
	                <td>23,070,000원</td>
	            </tr>
	            <tr>
	                <td>2분기</td>
	                <td>45,130,000원</td>
	                <td>32,729,500원</td>
	                <td>12,400,500원</td>
	            </tr>
	            <tr>
	                <td>3분기</td>
	                <td>48,427,300원</td>
	                <td>33,206,200원</td>
	                <td>15,221,100원</td>
	            </tr>
	            <tr>
	                <td>4분기</td>
	                <td> - </td>
	                <td> - </td>
	                <td> - </td>
	            </tr>
	            
	        	`;
	        $(".list-body").append(table);
        }else if(selectedPeriod =='분기별' && selectedYear == '2023'){
        	 $(".list-body").empty();
	        	table += `
	        		<tr>
	                <td>1분기</td>
	                <td>69,200,022원</td>
	                <td>52,779,912원</td>
	                <td>16,420,110원</td>
	            </tr>
	            <tr>
	                <td>2분기</td>
	                <td>78,423,110원</td>
	                <td>57,021,909원</td>
	                <td>21,401,201원</td>
	            </tr>
	            <tr>
	                <td>3분기</td>
	                <td>53,430,100원</td>
	                <td>41,029,000원</td>
	                <td>12,401,100원</td>
	            </tr>
	            <tr>
	                <td>4분기</td>
	                <td>53,533,300원</td>
	                <td>38,512,100원</td>
	                <td>15,021,200원</td>
	            </tr>
	            
	        	`;
	        $(".list-body").append(table);
        }else if(selectedPeriod =='분기별' && selectedYear == '2022'){
       	 $(".list-body").empty();
		     	table += `
		     		<tr>
		             <td>1분기</td>
		             <td>71,406,320원</td>
		             <td>43,794,320원</td>
		             <td>27,612,000원</td>
		         </tr>
		         <tr>
		             <td>2분기</td>
		             <td>38,036,000원</td>
		             <td>25,571,990원</td>
		             <td>12,464,010원</td>
		         </tr>
		         <tr>
		             <td>3분기</td>
		             <td>54,120,100원</td>
		             <td>35,815,100원</td>
		             <td>18,305,000원</td>
		         </tr>
		         <tr>
		             <td>4분기</td>
		             <td>67,320,200원</td>
		             <td>49,018,200원</td>
		             <td>18,302,000원</td>
		         </tr>
		         
		     	`;
		     $(".list-body").append(table);
		 }else if (selectedPeriod =='연도별' ){
        	$(".list-body").empty();
	        	table += `
	        		<tr>
	                <td>2021년도</td>
	                <td>320,010,000원</td>
	                <td>196,910,000원</td>
	                <td>123,100,000원</td>
	            </tr>
	            <tr>
	                <td>2022년도</td>
	                <td>230,882,620원</td>
	                <td>154,199,610원</td>
	                <td>76,683,010원</td>
	            </tr>
	            <tr>
	                <td>2023년도</td>
	                <td>254,586,532원</td>
	                <td>189,342,921원</td>
	                <td>65,243,611원</td>
	            </tr>
	            <tr>
	                <td>2024년도</td>
	                <td>157,667,300원</td>
	                <td>106,975,700원</td>
	                <td>50,691,600원</td>
	            </tr>
	            
	        	`;
	        $(".list-body").append(table);
        }
    }
});
</script>
