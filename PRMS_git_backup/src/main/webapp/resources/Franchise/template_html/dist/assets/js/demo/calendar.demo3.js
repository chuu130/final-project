/*
Template Name: Droplet - Responsive Bootstrap 5 Admin Template
Version: 3.0.0
Author: Sean Ngu
Website: http://www.seantheme.com/droplet/
*/

var handleRenderFullcalendar = function() {
	const cPath = document.body.dataset.contextPath;
	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendar.Interaction.Draggable;

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
			right: 'prev,next today'
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
				$.ajax({
					url: `${cPath}/main/franchise/ajaxData`,
					method: "GET",
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
								title: item.title, // title 데이터
								start: startDateFormatted, // 시작 날짜 (시간 제외)
								end: endDateFormatted, // 종료 날짜 (시간 제외)
								color: item.color, // 색상
								textColor: item.textColor // 텍스트 색상
							});
						});
						console.log(events);
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

		/*	일정추가	*/
		select: function(arg) { // 캘린더에서 이벤트를 생성할 수 있다.
			/*var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
			myModal.show();

			var myModal2 = document.getElementById('modalBtn');
			myModal2.addEventListener("click", function(){
				myModal.hide();
			});

			var title = document.getElementById("title");
			var franchiseId = document.getElementById("franchiseId");

			console.log(title.value);*/
			var title = prompt('일정을 입력해주세요.');
			if (title) {
				calendar.addEvent({
					title: title,
					start: arg.start,
					end: arg.end,
					allDay: arg.allDay,
					color: app.color.black,
					textColor: app.color.white
				})
			}

			var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			for (var i = 0; i < allEvent.length; i++) {
				var obj = new Object();     // Json 을 담기 위해 Object 선언
				// alert(allEvent[i]._def.title); // 이벤트 명칭 알람
				obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
				obj.start = allEvent[i]._instance.range.start; // 시작
				obj.end = allEvent[i]._instance.range.end; // 끝
				/*obj.franchiseId = franchiseId.value;*/

				events.push(obj);

			}

			var jsondata = JSON.stringify(events);
			// console.log(jsondata);
			// saveData(jsondata);
			console.log(jsondata);
			function saveData(jsondata) {
				$.ajax({
					url: `#`,
					method: "POST",
					dataType: "json",
					data: JSON.stringify(events),
					contentType: 'application/json',
				})
					.done(function(result) {
						console.log("성공", result);
					})
					.fail(function(request, status, error) {
						console.log("에러 발생", error); // 에러 메시지 출력
					});
				calendar.unselect()
			};
			saveData(jsondata);
		},


		/*	일정수정	*/
		eventDrop: function(info) {
			// console.log(info);
			if (confirm("'" + info.event.title + "' 의 일정을 수정하시겠습니까 ?")) {
			}
			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			var obj = new Object();

			obj.title = info.event._def.title;
			obj.start = info.event._instance.range.start;
			obj.end = info.event._instance.range.end;
			events.push(obj);

			// console.log(events);
			$(function UpdateData() {
				$.ajax({
					url: "#",
					method: "POST",
					dataType: "json",
					data: JSON.stringify(events),
					contentType: 'application/json',
				})
			})
		},

		/*	일정삭제	*/
		eventClick: function(info) {
			if (confirm("'" + info.event.title + "' 의 일정을 삭제하시겠습니까 ?")) {
				// 확인 클릭 시
				info.event.remove();
				alert("'" + info.event.title + "' 의 일정이 삭제 완료되었습니다.");
			}

			// console.log(info.event);
			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			var obj = new Object();
			obj.title = info.event._def.title;
			obj.start = info.event._instance.range.start;
			events.push(obj);

			// console.log(events);
			$(function deleteData() {
				$.ajax({
					url: "#",
					method: "POST",
					dataType: "json",
					data: JSON.stringify(events),
					contentType: 'application/json',
				})
			})
		},

	});

	calendar.render();
};

/* Controller
------------------------------------------------ */
$(document).ready(function() {
	handleRenderFullcalendar();
});