<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>calendar</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- fullcalendar -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            const cPath = document.body.dataset.contextPath || ''; // contextPath를 변수로 정의
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                initialView: 'dayGridMonth',
                locale: "ko",
                editable: true,
                droppable: true,
                displayEventTime: true,
                events: function (fetchInfo, successCallback, failureCallback) {
                	$.ajax({
                        url: `${cPath}/main/franchise/ajaxData`,
                        method: "GET",
                        dataType: "json",
                        success: function (response) {
                            var events = response.map(function (item) {
                                return {
                                    id: item.calNo, // Ensure ID is correctly set
                                    title: item.title,
                                    start: item.start,
                                    end: item.end,
                                    color: item.color,
                                    textColor: item.textColor
                                };
                            });
                            successCallback(events);
                        },
                        error: function (xhr, status, error) {
                            console.error("이벤트 로드 실패:", error);
                            failureCallback(error);
                        }
                    });
                },
                headerToolbar: {
                    center: 'addEventButton'
                },
                customButtons: {
                    addEventButton: {
                        text: "일정 추가",
                        click: function () {
                            $("#calendarModal").modal("show");
                        }
                    }
                },
                eventAdd: function (info) {
                    var newEvent = {
                        title: info.event.title,
                        start: info.event.start.toISOString(),
                        end: info.event.end ? info.event.end.toISOString() : null,
                        color: info.event.backgroundColor,
                        textColor: info.event.textColor
                    };
                    $.ajax({
                        url: `${cPath}/main/master/calendaradd`,
                        method: "POST",
                        dataType: "json",
                        contentType: 'application/json',
                        data: JSON.stringify(newEvent),
                        success: function (response) {
                            console.log("이벤트 추가 성공:", response);
                            // Set the ID of the new event returned by the server
                            info.event.setProp('id', response.id);
                        },
                        error: function (xhr, status, error) {
                            console.error("이벤트 추가 실패:", error);
                        }
                    });
                },
                eventChange: function (info) {
                    var updatedEvent = {
                        id: info.event.id, // Ensure ID is included
                        title: info.event.title,
                        start: info.event.start.toISOString(),
                        end: info.event.end ? info.event.end.toISOString() : null,
                        allDay: info.event.allDay,
                        color: info.event.backgroundColor,
                        textColor: info.event.textColor
                    };
                    $.ajax({
                        url: `${cPath}/main/master/calendarupdate`,
                        method: "POST",
                        dataType: "json",
                        contentType: 'application/json',
                        data: JSON.stringify(updatedEvent),
                        success: function (response) {
                            console.log("이벤트 수정 성공:", response);
                        },
                        error: function (xhr, status, error) {
                            console.error("이벤트 수정 실패:", error);
                        }
                    });
                },
                eventRemove: function (info) {
                    $.ajax({
                        url: `${cPath}/main/master/calendardelete`,
                        method: "POST",
                        dataType: "json",
                        contentType: 'application/json',
                        data: JSON.stringify({ id: info.event.id }),
                        success: function (response) {
                            console.log("이벤트 삭제 성공:", response);
                        },
                        error: function (xhr, status, error) {
                            console.error("이벤트 삭제 실패:", error);
                        }
                    });
                }
            });
            calendar.render();

            $("#addCalendar").on("click", function () {
                var content = $("#title").val();
                var start_date = $("#start").val();
                var end_date = $("#end").val();
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
                    calendar.addEvent(newEvent);
                    $.ajax({
                        url: `${cPath}/main/master/calendaradd`,
                        method: "POST",
                        dataType: "json",
                        contentType: 'application/json',
                        data: JSON.stringify(newEvent),
                        success: function (response) {
                            location.href = "${cPath}/main/master/testcalendar";
                        },
                        error: function (xhr, status, error) {
                            console.error("이벤트 추가 실패:", error);
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <div id="calendarBox">
        <div id="calendar"></div>
    </div>
    <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="start" name="start">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="end" name="end">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
</body>