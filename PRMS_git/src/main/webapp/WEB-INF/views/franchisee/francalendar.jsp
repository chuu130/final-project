<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal" var="principal"/>
<input type="hidden" id="empId2" name="empId" value="${principal.username}">
			<!-- BEGIN calendar -->
			<div class="calendar">
				<!-- BEGIN calendar-body -->
				<div class="calendar-body">
					<div data-scrollbar="true" data-height="100%">
						<div id="calendar"></div>
					</div>
				</div>
				<!-- ENG calendar-body -->
				<!-- BEGIN calendar-sidebar -->
				<div class="calendar-sidebar">
					<div class="desktop-sticky-top flex-fill h-100">
						<div class="calendar-sidebar-title">일정 추가</div>
						<div class="fc-event-list" id="external-events">
							<div class="fc-event-item"><div class="fc-event-link" data-color="#ff3b30" data-text-color="#ffffff"><i class="fa fa-circle fs-8px me-2 text-danger"></i> 매장 시설 수리</div></div>
							<div class="fc-event-item"><div class="fc-event-link" data-color="#FF9500" data-text-color="#ffffff"><i class="fa fa-circle fs-8px me-2 text-warning"></i> 미용 예약</div></div>
							<div class="fc-event-item"><div class="fc-event-link" data-color="#ffa8e4" data-text-color="#ffffff"><i class="fa fa-circle fs-8px me-2 text-yellow"></i> 호텔 예약</div></div>
						</div>
					</div>
				</div>
				<!-- ENG calendar-sidebar -->
			</div>
			<!-- end calendar -->


<!-- Modal -->
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="display: flex;justify-content: space-between;">
                    <h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                    	<security:authentication property="principal" var="principal"/>
                    	<input type="hidden" id="empId" name="empId" value="${principal.username }">
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="start" name="start">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="end" name="end">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-theme" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

<!-- Modal -->
<div class="modal fade" id="calendarModalUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="display: flex;justify-content: space-between;">
                    <h5 class="modal-title" id="exampleModalLabel">일정 상세</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                    	<security:authentication property="principal" var="principal"/>
                    	<input type="hidden" id="empId" name="empId" value="${principal.username }">
                    	<label for="taskId" class="col-form-label">가맹점명</label>
                        <input type="text" class="form-control" id="franchiseNm" name="franchiseNm" readonly>
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control" id="titleUpdate" name="title">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="startUpdate" name="start">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="endUpdate" name="end">
                        <input type="hidden" class="form-control" id="calNoUpdate" name="calNo">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-theme" id="UpdateCalendar">일정수정</button>
                    <button type="button" class="btn btn-theme" id="DeleteCalendar">일정삭제</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

