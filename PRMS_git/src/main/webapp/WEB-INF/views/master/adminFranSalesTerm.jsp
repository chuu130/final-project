<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="d-flex mb-3">
    <div>
        <ul class="breadcrumb">
            <c:url value="/main/master/salesTerm" var="salesTerm" />
            <li class="breadcrumb-item"><a href="${salesTerm }">매출관리</a></li>
            <li class="breadcrumb-item active">기간별매출</li>
        </ul>
        <h1 class="page-header mb-0">기간별 매출</h1>
    </div>
</div>

<div class="card p-3 mb-5">
	<div style="width:100%;">
	<div style="display: flex; justify-content: flex-start; float:left; width:50%;">
		<button class="btn btn-outline-default dropdown-toggle" id="dropdownMenuButton0" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:130px;margin-right: 10px;">멍냥몰 대전점 &nbsp;</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style=" position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(424px, 231px);" data-popper-escaped="" data-popper-placement="bottom-start">
				<a class="dropdown-item" href="#" data-value="멍냥몰 대전점">멍냥몰 대전점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 수원점">멍냥몰 수원점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 세종점">멍냥몰 세종점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 서울점">멍냥몰 서울점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 광주점">멍냥몰 광주점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 서면점">멍냥몰 서면점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 속초점">멍냥몰 속초점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 둔산점">멍냥몰 둔산점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 서대전점">멍냥몰 서대전점</a>
				<a class="dropdown-item" href="#" data-value="멍냥몰 태평점">멍냥몰 태평점</a>
			</div>
	</div>
	<div style="display: flex; justify-content: flex-end; float:right; width:50%;">
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
<c:set var="sell" value="${selling }"/>
<c:set var="exp" value="${expense }"/>
<div class="card p-3 mb-5">
    <div class="tab-content p-4">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="text-center">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>매출총액</th>
                        <th>매출원가</th>
                        <th>매출이익</th>
                    </tr>
                </thead>
                <tbody id="text-middle" class="list-body">
                    <tr>
                        <td>1월</td>
                        <td>50,030,000원</td>
                        <td>16,810,000원</td>
                        <td>33,220,000원</td>
                    </tr>
                    <tr>
                        <td>2월</td>
                        <td>54,203,020원</td>
                        <td>31,164,020원</td>
                        <td>23,039,000원</td>
                    </tr>
                    <tr>
                        <td>3월</td>
                        <td>93,201,920원</td>
                        <td>30,202,900원</td>
                        <td>62,999,020원</td>
                    </tr>
                    <tr>
                        <td>4월</td>
                        <td>42,003,221원</td>
                        <td>21,971,221원</td>
                        <td>20,032,000원</td>
                    </tr>
                    <tr>
                        <td>5월</td>
                        <td>80,002,300원</td>
                        <td>29,999,300원</td>
                        <td>50,003,000원</td>
                    </tr>
                    <tr>
                        <td>6월</td>
                        <td>100,500,000원</td>
                        <td>30,300,000원</td>
                        <td>70,200,000원</td>
                    </tr>
                    <tr>
                        <td>7월</td>
                        <td>64,001,001원</td>
                        <td>29,999,001원</td>
                        <td>34,002,000원</td>
                    </tr>
                    <tr>
                        <td>8월</td>
                        <td>60,320,010원</td>
                        <td>20,119,010원</td>
                        <td>40,201,000원</td>
                    </tr>
                    <tr>
                        <td>9월</td>
                        <td>87,830,630원</td>
                        <td>34,828,630원</td>
                        <td>53,002,000원</td>
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
                label: '총매출',
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
                data: [50030000, 54203020, 93201920, 42003221, 80002300, 100500000, 64001001, 60320010, 87830630] // 데이터 예시
              },
              {
                label: '매출이익',
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
                data: [33220000, 23039000, 62999020, 20032000, 50003000, 70200000, 34002000, 40201000, 53002000] // 데이터 예시
              }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
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
                newTotalSales = [50030000, 54203020, 93201920, 42003221, 80002300, 100500000, 64001001, 60320010, 87830630];  // 2024년 월별 데이터
                newAverageSales = [33220000, 23039000, 62999020, 20032000, 50003000, 70200000, 34002000, 40201000, 53002000];
            } else if (year === '2023') {
	           	 newTotalSales = [80002300, 54203020, 120002300, 93201920, 24000200, 50300020, 70002010, 80020100, 75002000, 60300000, 92000010, 50020000];  // 2023년 월별 데이터
	             newAverageSales = [50003000, 23039000, 73001000, 62999020, 5000000, 23000000, 32000000, 65002000, 24000000, 33000100, 65000000, 17500000];
            } else if (year === '2022') {
                newTotalSales = [153500000, 142000000, 90200012, 79291000, 60310211, 121000000, 93201920, 24000200, 80002300, 75002000, 100500000, 64001001];  // 2022년 월별 데이터
                newAverageSales = [80320000, 50200000, 30002000, 15002000, 32000000, 77000020, 62999020, 5000000, 50003000, 24000000, 70200000, 34002000];
            }
        } else if (period === '분기별') {
            lineChart.data.labels = ['1분기', '2분기', '3분기', '4분기'];  // 분기별 레이블 설정
            if (year === '2024') {
                newTotalSales = [197434940, 222505521, 212151641];  // 2024년 분기별 데이터
                newAverageSales = [119258020, 140235000, 127205000];
            } else if (year === '2023') {
                newTotalSales = [254207620, 167502140, 225024110, 202320010];  // 2023년 분기별 데이터
                newAverageSales = [146043000, 90999020, 121002000, 115500100];
            } else if (year === '2022') {
                newTotalSales = [385700012, 260601211, 197204420, 239503001];  // 2022년 분기별 데이터
                newAverageSales = [160522000, 124002020, 118002020, 128202000];
            }
        } else if (period === '연도별') {
            lineChart.data.labels = ['2021', '2022', '2023', '2024'];  // 연도별 레이블 설정
            newTotalSales = [720500000, 1083008640, 849053880, 632092102];  // 연도별 데이터
            newAverageSales = [421000000, 530728040, 473544120, 386698020];
        }

        // 차트 데이터 업데이트
        lineChart.data.datasets[0].data = newTotalSales;  // Total Sales 데이터 변경
        lineChart.data.datasets[1].data = newAverageSales;  // Average Sales 데이터 변경

        // 차트 업데이트
        lineChart.update();
    }

    // 기간 선택 시 처리
    $("#dropdownMenuButton9 + .dropdown-menu .dropdown-item").on("click", function(e){
        e.preventDefault();  // 기본 동작 방지
        selectedPeriod = $(this).data("value").toString().trim();  // 선택한 값 가져오기
        $("#dropdownMenuButton0").html(selectedPeriod + '&nbsp;');  // 버튼에 선택한 값 표시

    });

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
                <td>50,030,001원</td>
                <td>16,810,000원</td>
                <td>33,220,000원</td>
            </tr>
            <tr>
                <td>2월</td>
                <td>54,203,020원</td>
                <td>31,164,020원</td>
                <td>23,039,000원</td>
            </tr>
            <tr>
                <td>3월</td>
                <td>93,201,920원</td>
                <td>30,202,900원</td>
                <td>62,999,020원</td>
            </tr>
            <tr>
                <td>4월</td>
                <td>42,003,221원</td>
                <td>21,971,221원</td>
                <td>20,032,000원</td>
            </tr>
            <tr>
                <td>5월</td>
                <td>80,002,300원</td>
                <td>29,999,300원</td>
                <td>50,003,000원</td>
            </tr>
            <tr>
                <td>6월</td>
                <td>100,500,000원</td>
                <td>30,300,000원</td>
                <td>70,200,000원</td>
            </tr>
            <tr>
                <td>7월</td>
                <td>64,001,001원</td>
                <td>29,999,001원</td>
                <td>34,002,000원</td>
            </tr>
            <tr>
                <td>8월</td>
                <td>60,320,010원</td>
                <td>20,119,010원</td>
                <td>40,201,000원</td>
            </tr>
            <tr>
                <td>9월</td>
                <td>87,830,630원</td>
                <td>34,828,630원</td>
                <td>53,002,000원</td>
            </tr>

        	`;
        	 $(".list-body").append(table);
        }
        else if(selectedPeriod =='월별' && selectedYear == '2023'){
        	 $(".list-body").empty();
        	table += `
        		<tr>
                <td>1월</td>
                <td>80,002,300원</td>
                <td>29,999,300원</td>
                <td>50,003,000원</td>
            </tr>
            <tr>
                <td>2월</td>
                <td>54,203,020원</td>
                <td>31,164,020원</td>
                <td>23,039,000원</td>
            </tr>
            <tr>
                <td>3월</td>
                <td>120,002,300원</td>
                <td>47,001,300원</td>
                <td>73,001,000원</td>
            </tr>
            <tr>
                <td>4월</td>
                <td>93,201,920원</td>
                <td>30,202,900원</td>
                <td>62,999,020원</td>
            </tr>
            <tr>
                <td>5월</td>
                <td>24,000,200원</td>
                <td>19,000,200원</td>
                <td>5,000,000원</td>
            </tr>
            <tr>
                <td>6월</td>
                <td>50,300,020원</td>
                <td>27,300,020원</td>
                <td>23,000,000원</td>
            </tr>
            <tr>
                <td>7월</td>
                <td>70,002,010원</td>
                <td>38,002,010원</td>
                <td>32,000,000원</td>
            </tr>
            <tr>
                <td>8월</td>
                <td>80,020,100원</td>
                <td>15,018,100원</td>
                <td>65,002,000원</td>
            </tr>
            <tr>
                <td>9월</td>
                <td>75,002,000원</td>
                <td>51,002,000원</td>
                <td>24,000,000원</td>
            </tr>
            <tr>
                <td>10월</td>
                <td>60,300,000원</td>
                <td>27,299,900원</td>
                <td>33,000,100원</td>
            </tr>
            <tr>
                <td>11월</td>
                <td>92,000,010원</td>
                <td>27,000,010원</td>
                <td>65,000,000원</td>
            </tr>
            <tr>
                <td>12월</td>
                <td>50,020,000원</td>
                <td>32,520,000원</td>
                <td>17,500,000원</td>
            </tr>
        	`;
        	 $(".list-body").append(table);
        }else if(selectedPeriod =='월별' && selectedYear == '2022'){
			 $(".list-body").empty();
		 	table += `
		 		<tr>
		         <td>1월</td>
		         <td>153,500,000원</td>
		         <td>73,180,000원</td>
		         <td>80,320,000원</td>
		     </tr>
		     <tr>
		         <td>2월</td>
		         <td>142,000,000원</td>
		         <td>91,800,000원</td>
		         <td>50,200,000원</td>
		     </tr>
		     <tr>
		         <td>3월</td>
		         <td>90,200,012원</td>
		         <td>60,198,012원</td>
		         <td>30,002,000원</td>
		     </tr>
		     <tr>
		         <td>4월</td>
		         <td>79,291,000원</td>
		         <td>64,289,000원</td>
		         <td>15,002,000원</td>
		     </tr>
		     <tr>
		         <td>5월</td>
		         <td>60,310,211원</td>
		         <td>28,310,211원</td>
		         <td>32,000,000원</td>
		     </tr>
		     <tr>
		         <td>6월</td>
		         <td>121,000,000원</td>
		         <td>43,999,980원</td>
		         <td>77,000,020원</td>
		     </tr>
		     <tr>
		         <td>7월</td>
		         <td>93,201,920원</td>
		         <td>30,202,900원</td>
		         <td>62,999,020원</td>
		     </tr>
		     <tr>
		         <td>8월</td>
		         <td>24,000,200원</td>
		         <td>19,000,200원</td>
		         <td>5,000,000원</td>
		     </tr>
		     <tr>
		         <td>9월</td>
		         <td>80,002,300원</td>
		         <td>29,999,300원</td>
		         <td>50,003,000원</td>
		     </tr>
		     <tr>
		         <td>10월</td>
		         <td>75,002,000원</td>
		         <td>51,002,000원</td>
		         <td>24,000,000원</td>
		     </tr>
		     <tr>
		         <td>11월</td>
		         <td>100,500,000원</td>
		         <td>30,300,000원</td>
		         <td>70,200,000원</td>
		     </tr>
		     <tr>
		         <td>12월</td>
		         <td>64,001,001원</td>
		         <td>29,999,001원</td>
		         <td>34,002,000원</td>
		     </tr>
		 	`;
		 	 $(".list-body").append(table);

			}else if (selectedPeriod =='분기별' && selectedYear == '2024'){
        	 $(".list-body").empty();
	        	table += `
	        		<tr>
	                <td>1분기</td>
	                <td>197,434,940원</td>
	                <td>78,176,920원</td>
	                <td>119,258,020원</td>
	            </tr>
	            <tr>
	                <td>2분기</td>
	                <td>222,505,521원</td>
	                <td>82,270,521원</td>
	                <td>140,235,000원</td>
	            </tr>
	            <tr>
	                <td>3분기</td>
	                <td>212,151,641원</td>
	                <td>84,946,641원</td>
	                <td>127205000원</td>
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
	                <td>254,207,620원</td>
	                <td>108,164,620원</td>
	                <td>146,043,000원</td>
	            </tr>
	            <tr>
	                <td>2분기</td>
	                <td>167,502,140원</td>
	                <td>76,503,120원</td>
	                <td>90,999,020원</td>
	            </tr>
	            <tr>
	                <td>3분기</td>
	                <td>225,024,110원</td>
	                <td>104,022,110원</td>
	                <td>121,002,000원</td>
	            </tr>
	            <tr>
	                <td>4분기</td>
	                <td>202,320,010원</td>
	                <td>86,819,910원</td>
	                <td>115,500,100원</td>
	            </tr>

	        	`;
	        $(".list-body").append(table);
        }else if(selectedPeriod =='분기별' && selectedYear == '2022'){
       	 $(".list-body").empty();
		     	table += `
		     		<tr>
		             <td>1분기</td>
		             <td>385,700,012원</td>
		             <td>225,178,012원</td>
		             <td>160,522,000원</td>
		         </tr>
		         <tr>
		             <td>2분기</td>
		             <td>260,601,211원</td>
		             <td>136,599,191원</td>
		             <td>124,002,020원</td>
		         </tr>
		         <tr>
		             <td>3분기</td>
		             <td>197,204,420원</td>
		             <td>79,202,400원</td>
		             <td>118,002,020원</td>
		         </tr>
		         <tr>
		             <td>4분기</td>
		             <td>239,503,001원</td>
		             <td>111,301,001원</td>
		             <td>128,202,000원</td>
		         </tr>

		     	`;
		     $(".list-body").append(table);
		 }else if (selectedPeriod =='연도별' ){
        	$(".list-body").empty();
	        	table += `
	        		<tr>
	                <td>2021년도</td>
	                <td>720,500,000원</td>
	                <td>299,500,000원</td>
	                <td>421,000,000원</td>
	            </tr>
	            <tr>
	                <td>2022년도</td>
	                <td>1,083,008,640원</td>
	                <td>552,280,600원</td>
	                <td>530,728,040원</td>
	            </tr>
	            <tr>
	                <td>2023년도</td>
	                <td>849,053,880원</td>
	                <td>375,509,760원</td>
	                <td>473,544,120원</td>
	            </tr>
	            <tr>
	                <td>2024년도</td>
	                <td>632,092,102원</td>
	                <td>245,394,082원</td>
	                <td>386,698,020원</td>
	            </tr>

	        	`;
	        $(".list-body").append(table);
        }
    }
});
</script>
