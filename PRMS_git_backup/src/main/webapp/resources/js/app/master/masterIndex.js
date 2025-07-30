/* START daterangepicker */
//오늘 날짜로 span 초기화
var today = moment().format('YYYY년 MM월 DD일');
$('#daterange span').html(today + ' - ' + today);

$('#daterange').daterangepicker(
		{
			opens : 'right', // 달력 위치를 설정합니다. ('left', 'center', 'right')
			startDate : moment(), // 시작 날짜를 설정합니다.
			endDate : moment(), // 종료 날짜를 설정합니다.
			minDate : '01/01/2012', // 선택할 수 있는 최소 날짜입니다.
			maxDate : '12/31/2024', // 선택할 수 있는 최대 날짜입니다.
			locale : {
				format : 'YYYY년 MM월 DD일', // 날짜 형식을 설정합니다.
				separator : ' - ', // 시작 날짜와 종료 날짜 사이의 구분자를 설정합니다.
				applyLabel : "적용", // "적용" 버튼의 라벨을 설정합니다.
				cancelLabel : "취소", // "취소" 버튼의 라벨을 설정합니다.
				fromLabel : "시작일", // "시작" 레이블을 설정합니다.
				toLabel : "종료일", // "종료" 레이블을 설정합니다.
				customRangeLabel : "직접 설정", // 사용자 지정 범위 레이블을 설정합니다.
				weekLabel : "주",
				daysOfWeek : [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
						"7월", "8월", "9월", "10월", "11월", "12월" ],
				firstDay : 0
			},
			ranges : {
				'오늘' : [ moment(), moment() ],
				'어제' : [ moment().subtract(1, 'days'),
						moment().subtract(1, 'days') ],
				'지난 7일' : [ moment().subtract(6, 'days'), moment() ],
				'지난 30일' : [ moment().subtract(29, 'days'), moment() ],
				'이번달' : [ moment().startOf('month'),
						moment().endOf('month') ],
				'저번달' : [
						moment().subtract(1, 'month').startOf('month'),
						moment().subtract(1, 'month').endOf('month') ]
			}
		},
		function(start, end, label) {
			$('#daterange span').html(
					start.format('YYYY년 MM월 DD일') + ' - '
							+ end.format('YYYY년 MM월 DD일'));
		});
/* END daterangepicker */
const contextPath = document.body.dataset.contextPath;

$(document).ready(function() {

	/* 날짜 */
	let totalUpdateDt = document.querySelector("#totalUpdateDt");
	let onlineUpdateDt = document.querySelector("#onlineUpdateDt");
	let franUpdateDt = document.querySelector("#franUpdateDt");
	let payUpdateDt = document.querySelector("#payUpdateDt");

	/* 발주상태 */
	let waitInv = document.querySelector("#waitInv");
	let successInv = document.querySelector("#successInv");
	let cancelInv = document.querySelector("#cancelInv");
	let rejectInv = document.querySelector("#rejectInv");


	/* 상담상태 */
	let foundReq = document.querySelector("#foundReq");
	let foundAssignment = document.querySelector("#foundAssignment");
	let foundApply = document.querySelector("#foundApply");



	/* START 금액 애니메이션 */
	// 애니메이션이 적용될 요소들을 선택하고 목표 금액을 설정
	var totalSalesElement = document
			.querySelector('.total-sales-amount');
	var onlineSalesElement = document
			.querySelector('.online-sales-amount');
	var franSalesElement = document
			.querySelector('.fran-sales-amount');
	var paymentSalesElement = document
			.querySelector('.payment-sales-amount');

	var totalSalesAmount = 0;
	var onlineSalesAmount = 0;
	var franSalesAmount = 0;
	var paymentSalesAmount = 0;

	var duration = 1500; // 애니메이션 지속 시간 (밀리초)

	// 애니메이션 함수
	function animateValue(element, start, end, duration) {
		var startTime = null;

		function step(timestamp) {
			if (!startTime)
				startTime = timestamp;
			var progress = timestamp - startTime;
			var current = Math.min(Math.round(start
					+ (progress / duration) * (end - start)),
					end);
			element.innerHTML = current.toLocaleString() + '원'; // 숫자를 형식화하여 표시
			if (current < end) {
				window.requestAnimationFrame(step);
			}
		}

		window.requestAnimationFrame(step);
	}


		/* 매출을 반영하는 함수 (실시간으로 호출하기위함 - 애니메이션은 포함하지 않음) */
		const applytotalRevenue = async () => {
			let jsonData = await axios.get(`${contextPath}/main/master/totalRevenue`);

			let newTotalSalesAmount = jsonData.data.totalRevenue;
			let newOnlineSalesAmount = jsonData.data.onlineProdTotalRevenue;
			let newFranSalesAmount = jsonData.data.totalFranRevenue;
			let newPaymentSalesAmount = jsonData.data.franStartRevenue;

			let today = new Date();
			let currentDt = today.toLocaleString();


			// 총매출이 변경되었을 경우, 화면에 반영한다.
			if(newTotalSalesAmount != totalSalesAmount) {
				totalSalesAmount = newTotalSalesAmount;
				animateValue(totalSalesElement, 1, totalSalesAmount, duration);
				totalUpdateDt.innerHTML = currentDt;
			}

			// 온라인 매출이 변경되었을 경우, 화면에 반영한다.
			if(newOnlineSalesAmount != onlineSalesAmount) {
				onlineSalesAmount = newOnlineSalesAmount;
				animateValue(onlineSalesElement, 1, onlineSalesAmount, duration);
				onlineUpdateDt.innerHTML = currentDt;
			}

			// 가맹점매출이 변경되었을 경우, 화면에 반영한다.
			if(newFranSalesAmount != franSalesAmount) {
				franSalesAmount = newFranSalesAmount;
				animateValue(franSalesElement, 1, franSalesAmount, duration);
				franUpdateDt.innerHTML = currentDt;
			}

			// 가맹계약금이 변경되었을 경우, 화면에 반영한다.
			if(newPaymentSalesAmount != paymentSalesAmount) {
				paymentSalesAmount = newPaymentSalesAmount;
				animateValue(paymentSalesElement, 1, paymentSalesAmount, duration);
				payUpdateDt.innerHTML = currentDt;
			}
		}

		// 페이지 로딩시 매출정보를 반영한다.
		applytotalRevenue();

		// 5초에 한번 매출정보를 화면에 반영한다.
//		setInterval(applytotalRevenue, 10000);



	/* 전년 대비 매출 차트 */

	// 차트 색상 설정
	let app = {
		color : {
			pinkRgb : '255, 99, 132',
			warningRgb : '255, 159, 64',
			themeRgb : '75, 192, 192',
			bodyColorRgb : '201, 203, 207',
			indigoRgb : '153, 102, 255',
			teal : '#4CAF50',
			componentColor : '#777'
		}
	};

	let apexAreaChartOptions = {
		    chart: {
		        height: 300,  // 차트 높이를 고정 (필요에 따라 숫자 변경 가능)
		        width: '100%',  // 너비를 100%로 설정하여 반응형으로 설정
		        type: 'area',
		        responsive: [{
		            breakpoint: 768,  // 태블릿 이하 해상도일 때
		            options: {
		                chart: {
		                    height: 250  // 해상도에 따라 차트 높이 조정
		                }
		            }
		        }, {
		            breakpoint: 480,  // 모바일 해상도일 때
		            options: {
		                chart: {
		                    height: 200  // 더 작은 화면에서의 차트 높이 조정
		                }
		            }
		        }]
		    },
		    dataLabels: {
		        enabled: false
		    },
		    stroke: {
		        curve: 'smooth',
		        width: 3
		    },
		    colors: [app.color.componentColor, app.color.teal],
		    series: [{
		        name: '작년',
		        data: [510829071, 465931226, 725914207, 659830828, 822123778, 574163401,
		            723781320, 557982761, 760259708, 517907121, 536929439, 647007270]  // 12개월에 대한 데이터
		    }, {
		        name: '올해',
		        data: [612730489, 550201294, 665489377, 782103428, 725340912, 773771589,
		            624561238, 675612379, 658491001, 717340981, 665780543, 586431224]  // 12개월에 대한 데이터
		    }],
		    xaxis: {
		        type: 'datetime',
		        categories: [
		            '2024-01-01',
		            '2024-02-01',
		            '2024-03-01',
		            '2024-04-01',
		            '2024-05-01',
		            '2024-06-01',
		            '2024-07-01',
		            '2024-08-01',
		            '2024-09-01',
		            '2024-10-01',
		            '2024-11-01',
		            '2024-12-31'
		        ],
		        labels: {
		            datetimeFormatter: {
		                year: 'yyyy년',  // '2024년' 형식
		                month: 'MM월',  // '01월' 형식
		                day: 'dd일',  // '01일' 형식
		                hour: 'HH시'  // 시간 형식 필요시 추가
		            }
		        }
		    },
		    yaxis: {
				min: 0,
		        max: 100000000,
		        labels: {
		            formatter: function (value) {
		               // 만 단위로 포맷팅
		                if (value >= 10000) {
		                    return (value / 10000) + '만';
		                } else {
		                    return value.toLocaleString(); // 그 외 숫자는 그대로 표시
		                }
		            }
		        }
		    },
		    tooltip: {
		        x: {
		            format: 'yyyy년 MM월'  // 툴팁에서 한국어 형식으로 표시
		        }
		    },
		    locale: {
		        name: 'ko',  // 한국어 로케일
		        options: {
		            months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		            shortMonths: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		            days: ['일', '월', '화', '수', '목', '금', '토'],
		            shortDays: ['일', '월', '화', '수', '목', '금', '토'],
		            toolbar: {
		                download: '이미지 다운로드',
		                selection: '영역 선택',
		                selectionZoom: '영역 줌',
		                zoomIn: '확대',
		                zoomOut: '축소',
		                pan: '이동',
		                reset: '초기화'
		            }
		        }
		    }
		};

		const apexAreaMonthList = apexAreaChartOptions.locale.options.months; // 1월 ~ 12월

		let apexAreaChart = new ApexCharts(document.querySelector('#apexAreaChart'), apexAreaChartOptions);
		apexAreaChart.render();

		/* 전년대비 매출을 반영하는 함수 */
		const applyCompareMonthRevenue = async () => {
			let jsonData = await axios.get(`${contextPath}/main/master/compareMonthRevenue`);
//			console.log(jsonData);
//			console.log("작년 1월 차트데이터 샘플 : ", apexAreaChartOptions.series[0].data[0]);
//			console.log("금년 1월 차트데이터 샘플 : ", apexAreaChartOptions.series[1].data[0]);
//			console.log(apexAreaMonthList);

			let lastYearMonthRevenue = jsonData.data.lastYearMonthRevenue;
			let thisYearMonthRevenue = jsonData.data.thisYearMonthRevenue;

			let lastYearMonthRevenueList = [];
			let thisYearMonthRevenueList = [];


			let lastYearIndex = 0;
			let thisYearIndex = 0;
//			console.log(lastYearMonthRevenue[lastYearIndex]);
//			console.log(thisYearMonthRevenue[thisYearIndex]);

			apexAreaMonthList.forEach((month) => {

				if(lastYearIndex < lastYearMonthRevenue.length && month == lastYearMonthRevenue[lastYearIndex].monthDt) {
					let monthTotal = lastYearMonthRevenue[lastYearIndex].selling - lastYearMonthRevenue[lastYearIndex].refund;
					lastYearMonthRevenueList.push(monthTotal);
					lastYearIndex++;
				} else {
					lastYearMonthRevenueList.push(0);
				}

				if(thisYearIndex < thisYearMonthRevenue.length && month == thisYearMonthRevenue[thisYearIndex].monthDt) {
					let monthTotal = thisYearMonthRevenue[thisYearIndex].selling - thisYearMonthRevenue[thisYearIndex].refund;
					thisYearMonthRevenueList.push(monthTotal);
					thisYearIndex++;
				} else {
					thisYearMonthRevenueList.push(0);
				}
			});

//			console.log(lastYearMonthRevenueList);
//			console.log(thisYearMonthRevenueList);

			apexAreaChart.updateSeries([{
				data:lastYearMonthRevenueList
			}, {
				data:thisYearMonthRevenueList
			}]);
		}

		applyCompareMonthRevenue();


		/* 월별 매출을 반영하는 차트 */
		let ctx3 = document.getElementById('barChart');
		let barChart = new Chart(ctx3, {
		    type: 'bar',
		    data: {
		        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 각 월
		        datasets: [{
		            label: '가맹점',
		            data: [0, 0, 0, 0, 0, 0,
		                0, 0, 0, 0, 0, 0], // 가맹점 데이터
		            backgroundColor: 'rgba(' + app.color.pinkRgb + ', .25)',
		            borderWidth: 1.5
		        }, {
		            label: '쇼핑몰',
		            data: [0, 0, 0, 0, 0, 0,
		                0, 0, 0, 0, 0, 0], // 쇼핑몰 데이터
		            backgroundColor: 'rgba(' + app.color.themeRgb  + ', .25)',
		            borderWidth: 1.5
		        }]
		    },
		    options: {
		        scales: {
				    x: {
				        stacked: false // x축 스택 해제 (월별로 온라인과 오프라인 나란히 표시)
				    },
				    y: {
				        stacked: false, // y축 스택 해제
				        beginAtZero: true, // y축이 0부터 시작
				        min: 0, // y축 최소값 설정
				        max: 100000000, // y축 최대값 설정
				        ticks: {
				            callback: function(value) {
				                // 만 단위로 포맷팅
				                if (value >= 10000) {
				                    return (value / 10000) + '만';
				                } else {
				                    return value.toLocaleString(); // 그 외 숫자는 그대로 표시
				                }
				            }
				        }
				    }
				}
		    }
		});

		const monthList = barChart.data.labels; // 1월 ~ 12월

		/* 월별 매출을 반영하는 로직 */
		const applyTotalMonthRevenue = async () => {
			let jsonData = await axios.get(`${contextPath}/main/master/totalMonthRevenue`);
//			console.log(jsonData);

			let franMonthTotal =  jsonData.data.franMonthTotal; // 가맹점 월별 매출리스트
			let onlineMonthTotal =  jsonData.data.onlineMonthTotal; // 쇼핑몰 월별 매출리스트

			let franMonthDataList = [];
			let onlineMonthDataList = [];

//			console.log(franMonthTotal[0].monthDt);
//			console.log(onlineMonthTotal[0].monthDt);


			let franIndex = 0;
			let onlineIndex = 0;
			monthList.forEach((month) => {
//				console.log(month);

				// 가맹점 월별 매출을 반영한다.
				if(franIndex < franMonthTotal.length && franMonthTotal[franIndex].monthDt == month) {
					franMonthDataList.push(franMonthTotal[franIndex].selling - franMonthTotal[franIndex].refund);
					franIndex++;
				} else {
					franMonthDataList.push(0);
				}

				// 온라인 월별 매출을 반영한다.
				if(onlineIndex < onlineMonthTotal.length && onlineMonthTotal[onlineIndex].monthDt == month) {
					onlineMonthDataList.push(onlineMonthTotal[onlineIndex].selling - onlineMonthTotal[onlineIndex].refund);
					onlineIndex++;
				} else{
					onlineMonthDataList.push(0);
				}

			});

			barChart.data.datasets[0].data = franMonthDataList;
			barChart.data.datasets[1].data = onlineMonthDataList;

			barChart.update();
		}

		// 월별 매출을 반영한다.
		applyTotalMonthRevenue();


		/* 발주현황을 반영하는 함수 */
		const applyTodayInvRequest = async () => {
			let jsonData = await axios.get(`${contextPath}/main/master/todayInvRequest`);
//			console.log(jsonData);

			let todayInvRequest = jsonData.data.todayInvRequest;
			console.log(todayInvRequest);

			todayInvRequest.forEach((todayInvRequest) => {

				let fireqSttus = todayInvRequest.FIREQ_STTUS;
				let count = todayInvRequest.COUNT

				let statusCount = `${count}건`;

				if(fireqSttus == 'P') {
					waitInv.innerHTML = statusCount;
				} else if(fireqSttus == 'Y') {
					successInv.innerHTML = statusCount;
				} else if(fireqSttus == 'C') {
					cancelInv.innerHTML = statusCount;
				} else if(fireqSttus == 'N') {
					rejectInv.innerHTML = statusCount;
				}
			});
		}

		// 페이지 로딩시 발주현황을 반영한다.
		applyTodayInvRequest();

		// 5초에 한번씩 발주현황을 업데이트한다.
//		setInterval(applyTodayInvRequest, 10000);



		/* 오늘 창업정보를 반영하는 함수 */
		const applyTodayFound = async () => {
			let jsonData = await axios.get(`${contextPath}/main/master/todayFound`);
//			console.log(jsonData);

			let todayFound = jsonData.data.todayFound;

//			console.log(todayFound);

			foundReq.innerHTML = `${todayFound.FOUND_INDE}건`;
			foundAssignment.innerHTML = `${todayFound.FOUND_ASDE}건`;
			foundApply.innerHTML = `${todayFound.FOUND_CKDE}건`;
		}

		applyTodayFound();

//		10초에 한번씩 상품별 top5 판매량을 반영한다.
//		setInterval(applyTodayFound, 10000);



		/* 상품별 top5 판매량을 반영하는 차트 */
		const top5ProdChatColors = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(230, 215, 7, 0.2)','rgba(75, 88, 172, 0.2)','rgba(75, 182, 0, 0.2)']; // 차트색상
		const top5ProdChatBorderColors = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(230, 215, 7, 1)','rgba(75, 88, 172, 1)','rgba(75, 182, 0, 1)']; // 차트색상

		let ctx1 = document.getElementById('doughnutChart')
				.getContext('2d');
		let top5ProdChat = new Chart(ctx1, {
			type : 'doughnut',
			data : {
				labels : [  ],
				datasets : [ {
					data : [ ],
					backgroundColor : [ ],
					borderColor : [  ],
					borderWidth : 1
				} ]
			},
			options : {
				responsive : true,
				width : 200, // 캔버스 너비 설정
				height : 200
			// 캔버스 높이 설정
			}
		});

		/* 상품별 top5 판매량을 반영하는 함수 */
		const applyTop5Prod = async () => {
			let jsonData = await axios.get(`${contextPath}/main/master/top5Prod`);

			let top5Prod = jsonData.data.yearProdCountTop5;
//			console.log(top5Prod);

			let labels = [];
			let data = [];
			let backgroundColor = [];
			let borderColor = [];

			let colorIndex = 0;

			top5Prod.forEach((prod) => {
				labels.push(prod.prodSleNm);
				data.push(prod.sumCount.toLocaleString());
				backgroundColor.push(top5ProdChatColors[colorIndex]);
				borderColor.push(top5ProdChatBorderColors[colorIndex++]);
			});


			top5ProdChat.data.labels = labels;
			top5ProdChat.data.datasets[0].data = data;
			top5ProdChat.data.datasets[0].backgroundColor = backgroundColor;
			top5ProdChat.data.datasets[0].borderColor = borderColor;


			// 변경된 데이터를 랜더링한다.
			top5ProdChat.update();
		}

		applyTop5Prod();

//		 10초에 한번씩 상품별 top5 판매량을 반영한다.
//		setInterval(applyTop5Prod, 10000);


});