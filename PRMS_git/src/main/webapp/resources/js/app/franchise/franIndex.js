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

const contextPath = document.body.dataset.contextPath;

$(document).ready(
	
		function() {

			// 애니메이션이 적용될 요소들을 선택하고 목표 금액을 설정
			var totalSalesElement = document
					.querySelector('.total-sales-amount');
			var productSalesElement = document
					.querySelector('.product-sales-amount');
			var hotelSalesElement = document
					.querySelector('.hotel-sales-amount');
			var beautySalesElement = document
					.querySelector('.beauty-sales-amount');

			var total = document.querySelector("#totalSalesAmount");
			var product = document.querySelector("#productSalesAmount");
			var beauty = document.querySelector("#beautySalesAmount");
			var hotel = document.querySelector("#hotelSalesAmount");
			console.log(product.value);

			var totalSalesAmount = total.value;
			var productSalesAmount = product.value;
			var hotelSalesAmount = beauty.value;
			var beautySalesAmount = hotel.value;

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

			// 페이지가 로드되면 각각의 애니메이션 시작
			animateValue(totalSalesElement, 1, totalSalesAmount,
					duration);
			animateValue(productSalesElement, 1, productSalesAmount,
					duration);
			animateValue(hotelSalesElement, 1, hotelSalesAmount,
					duration);
			animateValue(beautySalesElement, 1, beautySalesAmount,
					duration);

			var ctx1 = document.getElementById('doughnutChart')
					.getContext('2d');
			var doughnutChart = new Chart(ctx1, {
				type : 'doughnut',
				data : {
					labels : [ '인건비', '관리비',
							'가맹비' ],
					datasets : [ {
						data : [ 300, 50, 100 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(75, 192, 192, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(75, 192, 192, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					responsive : true,
					width : 300, // 캔버스 너비 설정
					height : 300
				// 캔버스 높이 설정
				}
			});

			var ctx2 = document.getElementById('pieChart').getContext(
					'2d');
			var pieChart = new Chart(ctx2, {
				type : 'pie',
				data : {
					labels : [ topFiveListArr[0].cmmnCodeNm, topFiveListArr[1].cmmnCodeNm,
							topFiveListArr[2].cmmnCodeNm, topFiveListArr[3].cmmnCodeNm, topFiveListArr[4].cmmnCodeNm ],
					datasets : [ {
						data : [ topFiveListArr[0].prodTotal, topFiveListArr[1].prodTotal, topFiveListArr[2].prodTotal, topFiveListArr[3].prodTotal, topFiveListArr[4].prodTotal ],
						backgroundColor : [ 'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 204, 182, 0.2)',
								'rgba(243, 176, 195, 0.2)' ],
						borderColor : [ 'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 204, 182, 1)',
								'rgba(243, 176, 195, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					responsive : true
				}
			});

			var app = {
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

			var hotelNumber = Number(prodRateListArr[0].serviceTotal);
			var prodNumber = Number(prodRateListArr[1].serviceTotal);
			var beautyNumber = Number(prodRateListArr[2].serviceTotal);
			var emerNumber = Number(prodRateListArr[3].serviceTotal);
			var apexPieChartOptions = {
				chart : {
					type : 'pie'
				},
				dataLabels : {
					dropShadow : {
						enabled : false,
						top : 1,
						left : 1,
						blur : 1,
						opacity : 1
					}
				},
				stroke : {
					show : false
				},
				colors : [ 'rgba(' + app.color.pinkRgb + ', .75)',
						'rgba(' + app.color.warningRgb + ', .75)',
						'rgba(' + app.color.themeRgb + ', .75)',
						'rgba(' + app.color.indigoRgb + ', .75)' ],
				labels : [ '상품판매', '호텔예약', '미용예약', '긴급재고'],
				series : [prodNumber, hotelNumber, beautyNumber, emerNumber],
				title : {
					text : ''
				}
			};
			console.log( prodRateListArr[0].serviceCnt);
			var thisWeekSale = $("#franThisWeekSale");
			var thisWeekSaleList = thisWeekSale.val();
			console.log(thisWeekSaleList[0]);
			for(var i =0; i<thisWeekSaleArr.length; i++){
				console.log("가격:" + thisWeekSaleArr[i].fselTotalAmount);
				console.log("날짜:" + thisWeekSaleArr[i].fselDt);
			}

			today = new Date();
			var day = '';

			function getDayOfWeek(날짜문자열){ //ex) getDayOfWeek('2022-06-13')

			    const week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];

			    const dayOfWeek = week[new Date(날짜문자열).getDay()];

			    return dayOfWeek;
			}

			function newDate(date){
				let mm = date.substring(5,7);
				let dd = date.substring(8,10);

				let stringNewDate = mm + "/" + dd;

				return stringNewDate;
			}

			console.log(newDate(thisWeekSaleArr[6].fselDt));


			var apexPieChart = new ApexCharts(document
					.querySelector('#apexPieChart'),
					apexPieChartOptions);
			apexPieChart.render();

			var apexAreaChartOptions = {
				    chart: {
				        height: 300,
				        width: '100%',
				        type: 'area'
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
				        name: '지난주(' + lastWeekSaleArr[0].fselDt + ' ~ ' + lastWeekSaleArr[6].fselDt + ')',
				        data: [lastWeekSaleArr[0].fselTotalAmount
								, lastWeekSaleArr[1].fselTotalAmount
								, lastWeekSaleArr[2].fselTotalAmount
								, lastWeekSaleArr[3].fselTotalAmount
								, lastWeekSaleArr[4].fselTotalAmount
								, lastWeekSaleArr[5].fselTotalAmount
								, lastWeekSaleArr[6].fselTotalAmount]
				    }, {
				        name: '이번주(' + thisWeekSaleArr[0].fselDt + ' ~ ' + thisWeekSaleArr[6].fselDt + ')',
				        data: [thisWeekSaleArr[0].fselTotalAmount
								, thisWeekSaleArr[1].fselTotalAmount
								, thisWeekSaleArr[2].fselTotalAmount
								, thisWeekSaleArr[3].fselTotalAmount
								, thisWeekSaleArr[4].fselTotalAmount
								, thisWeekSaleArr[5].fselTotalAmount
								, thisWeekSaleArr[6].fselTotalAmount]
				    }],
				    xaxis: {
				        type: 'string',
				        categories: [
				            getDayOfWeek(thisWeekSaleArr[0].fselDt) ,getDayOfWeek(thisWeekSaleArr[1].fselDt)
							, getDayOfWeek(thisWeekSaleArr[2].fselDt), getDayOfWeek(thisWeekSaleArr[3].fselDt)
							, getDayOfWeek(thisWeekSaleArr[4].fselDt), getDayOfWeek(thisWeekSaleArr[5].fselDt)
							, getDayOfWeek(thisWeekSaleArr[6].fselDt)
				        ],
				        labels: {
				            format: 'string'  // 월/일 형식으로 표시
				        },
				        axisBorder: {
				            show: true,
				            color: app.color.componentColor,
				            height: 1,
				            width: '100%',
				            offsetX: 0,
				            offsetY: -1
				        },
				        axisTicks: {
				            show: true,
				            borderType: 'solid',
				            color: app.color.componentColor,
				            height: 6,
				            offsetX: 0,
				            offsetY: 0
				        }
				    },
				    yaxis: {
				        max: 10000000,  // y축 최대값을 1억으로 설정
				        labels: {
				            formatter: function (val) {
				                if (val >= 10000000) {
				                    return (val / 10000000).toFixed(1) + '억';
				                } else {
				                    return val.toLocaleString() + '원';
				                }
				            }
				        }
				    },
				    tooltip: {
				        x: {
				            format: 'string'  // 툴팁에서 월/일 형식으로 표시
				        }
				    }
				};

			var apexAreaChart = new ApexCharts(document
					.querySelector('#apexAreaChart'),
					apexAreaChartOptions);
			apexAreaChart.render();



});