/*
Template Name: Droplet - Responsive Bootstrap 5 Admin Template
Version: 3.0.0
Author: Sean Ngu
Website: http://www.seantheme.com/droplet/
*/
document.addEventListener('DOMContentLoaded', function() {
	const cPath = document.body.dataset.contextPath;
	var handleRenderFullcalendar = function() {
		var Calendar = FullCalendar.Calendar;
		var Draggable = FullCalendar.Interaction.Draggable;
		var empId2 = document.querySelector("#empId2");

		// external events
		var containerEl = document.getElementById('external-events');
		new Draggable(containerEl, {
			itemSelector: '.fc-event-link',
			eventData: function(eventEl) {
				return {
					title: eventEl.innerText,
					color: eventEl.getAttribute('data-color'),
					textColor: eventEl.getAttribute('data-text-color')
				};
			}
		});


		// fullcalendar
		var d = new Date();
		var month = d.getMonth() + 1;
		month = (month < 10) ? '0' + month : month;
		var year = d.getFullYear();
		var day = d.getDate();
		var today = moment().startOf('day');
		var calendarElm = document.getElementById('calendar');
		var calendar = new Calendar(calendarElm, {
			headerToolbar: {
				left: 'dayGridMonth,timeGridWeek,timeGridDay',
				center: 'title',
				right: 'prev,next today, addEventButton',
			},
			customButtons: {
				addEventButton: {
					text: "일정 추가",
					click: function() {
						$("#calendarModal").modal("show");
					}
				}
			},
			buttonText: {
				today: 'Today',
				month: 'Month',
				week: 'Week',
				day: 'Day'
			},
			initialView: 'dayGridMonth',
			locale: "ko",
			editable: true,
			droppable: true,
			selectable: true,
			themeSystem: 'bootstrap',
			views: {
				timeGrid: {
					eventLimit: 6 // adjust to 6 only for timeGridWeek/timeGridDay
				}
			},
			events:
				function eventsData(fetchInfo, successCallback, failureCallback) {
					console.log(empId2);
					$.ajax({
						url: `${cPath}/main/franchise/ajaxData/${empId2.value}`,
						method: "get",
						dataType: "json",
						success: function(response) {
							var events = [];
							$.each(response, function(index, item) {
								// 서버에서 받은 날짜를 JavaScript Date 객체로 변환
								var startDate = new Date(item.start);
								var endDate = new Date(item.end);

								// moment.js를 사용하여 날짜 포맷팅 (시간 제외)
								var startDateFormatted = moment(startDate).format('YYYY-MM-DD');
								var endDateFormatted = moment(endDate).format('YYYY-MM-DD');

								events.push({
									calNo: item.calNo, // 캘린더번호
									title: item.title, // title 데이터
									start: startDateFormatted, // 시작 날짜 (시간 제외)
									end: endDateFormatted, // 종료 날짜 (시간 제외)
									color: item.color, // 색상
									textColor: item.textColor // 텍스트 색상
								});
							});
							successCallback(events); // 이벤트 데이터 전달
						},
						error: function(xhr, status, error) { // 에러 발생 시 처리하는 콜백 함수
							console.error("AJAX 요청 실패:", error);
							failureCallback(error);
						}
					});
				}
			/*[{
				title: 'Trip to London',
				start: year + '-' + month + '-01',
				end: year + '-' + month + '-05',
				color: app.color.theme,
				textColor: app.color.white
			}*/
			,

			/*일정 상세*/
			eventClick: function(info) {
				var calNo = info.event.extendedProps.calNo;
				console.log(info);
				console.log(info.event.extendedProps.calNo);

				var empId = $("#empId2").val();

				console.log(`${cPath}/main/franchise/${empId}/calendarUpdate/${calNo}`);


				// AJAX 요청을 보냅니다.
				$.ajax({
					url: `${cPath}/main/franchise/${empId}/calendarUpdate/${calNo}`,
					method: "get",
					dataType: "json",
					contentType: 'application/json',
					success: function(response) {
						console.log(response);
						console.log(response.franCalendarVO.franchise.franchiseNm);
						console.log(response.franCalendarVO.title);
						// 서버에서 받아온 데이터를 input 태그에 넣기
						$("#franchiseNm").val(response.franCalendarVO.franchise.franchiseNm);  // 가맹점명
						$("#titleUpdate").val(response.franCalendarVO.title);  // 일정 제목
						$("#startUpdate").val(response.franCalendarVO.start);  // 시작 날짜
						$("#endUpdate").val(response.franCalendarVO.end);      // 종료 날짜
						$("#calNoUpdate").val(response.franCalendarVO.calNo);      // 캘린더 번호

						$("#calendarModalUpdate").modal("show");

						$("#UpdateCalendar").on("click", function() {
							var content = $("#titleUpdate").val();
							var start_date = $("#startUpdate").val();
							var end_date = $("#endUpdate").val();
							var empId = $("#empId2").val();
							if (!content) {
								alert("내용을 입력하세요.");
							} else if (!start_date || !end_date) {
								alert("날짜를 입력하세요.");
							} else if (new Date(end_date) < new Date(start_date)) {
								alert("종료일이 시작일보다 먼저입니다.");
							} else {

								var francalVO = {
									title: $("#titleUpdate").val(),
									start: $("#startUpdate").val(),
									end: $("#endUpdate").val(),
									calNo: $("#calNoUpdate").val(),
								};
								$.ajax({
									url: `${cPath}/main/franchise/calendarUpdate`,
									method: "POST",
									dataType: "json",
									contentType: 'application/json',
									data: JSON.stringify(francalVO),
									success: function(response) {
										location.href = `${cPath}/main/franchise/${empId}/francalendar`;
									},
									error: function(xhr, status, error) {
										console.error("이벤트 추가 실패:", error);
									}
								});
							}
						});

						$("#DeleteCalendar").on("click", function() {
							var calNo = $("#calNoUpdate").val();
							var empId = $("#empId2").val();
							console.log(calNo);

							$.ajax({
								url: `${cPath}/main/franchise/calendarDelete/${calNo}`,
								method: "POST",
								success: function(response) {
									location.href = `${cPath}/main/franchise/${empId}/francalendar`;
								},
								error: function(xhr, status, error) {
									console.error("이벤트 추가 실패:", error);
								}
							});
						});

					},
					error: function(xhr, status, error) {
						console.error("이벤트 추가 실패:", error);
						console.error("서버 응답:", xhr.responseText);
					}
				});
			}
			,

		});
		calendar.render();


		$("#addCalendar").on("click", function() {
			var content = $("#title").val();
			var start_date = $("#start").val();
			var end_date = $("#end").val();
			var empId = $("#empId2").val();
			if (!content) {
				alert("내용을 입력하세요.");
			} else if (!start_date || !end_date) {
				alert("날짜를 입력하세요.");
			} else if (new Date(end_date) < new Date(start_date)) {
				alert("종료일이 시작일보다 먼저입니다.");
			} else {
				var newEvent = {
					title: content,
					start: start_date,
					end: end_date
				};
				$.ajax({
					url: `${cPath}/main/franchise/${empId}/calendaradd`,
					method: "POST",
					dataType: "json",
					contentType: 'application/json',
					data: JSON.stringify(newEvent),
					success: function(response) {
						location.href = `${cPath}/main/franchise/${empId}/francalendar`;
					},
					error: function(xhr, status, error) {
						console.error("이벤트 추가 실패:", error);
					}
				});
			}
		});

	};

	/* Controller
	------------------------------------------------ */
	$(document).ready(function() {
		handleRenderFullcalendar();
	});

});