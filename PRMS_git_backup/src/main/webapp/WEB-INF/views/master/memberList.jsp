<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
th, td {
    text-align: center;
}

.memlist-head{
background-color: #3cd2a514;
}
</style>

<div class="d-flex mb-3">
	<div>
	    <ul class="breadcrumb">
	        <c:url value="/main/master/memberList.do" var="memberListUrl" />
	        <li class="breadcrumb-item"><a href="${memberListUrl }">회원관리</a></li>
	        <li class="breadcrumb-item active">회원정보</li>
	    </ul>
	    <h1 class="page-header mb-0">회원정보</h1>
	</div>
</div>

<div class="card p-3 mb-5">
<div class="tab-content p-4">
<div class="table-responsive">
	<h4>회원정보 목록</h4>
    <table class="table table-hover text-nowrap">
        <thead class="boardlist-head">
            <tr>
                <th class="order-border">회원ID</th>
                <th class="order-border">회원명</th>
                <th class="order-border">회원전화번호</th>
                <th class="order-border">회원생년월일</th>
                <th class="order-border">회원이메일</th>
                <th class="order-border">회원탈퇴여부</th>
                <th class="order-border">마일리지</th>
                <th class="order-border-top">블랙리스트</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${memberList}" var="mem">
                <tr>
                    <td class="order-border">${mem.memId}</td>
                    <td class="order-border">${mem.memNm}</td>
                    <td class="order-border">${mem.memTelno}</td>
                    <td class="order-border">${mem.memBirthdy}</td>
                    <td class="text-start order-border">${mem.memEmail}</td>
                    <td class="order-border">${mem.memYnAt}</td>
                    <td class="order-border">${mem.memMl}</td>
                    <td>
                    	<c:choose>
			                <c:when test="${blacklistMap[mem.memNo] > 0}">
			                    블랙리스트
			                </c:when>
			                <c:otherwise>
			                    <button type="button" class="btn btn-primary"
			                            data-bs-toggle="modal"
			                            data-bs-target="#blacklistModal"
			                            onclick="setModalValues('${mem.memNo}', '${mem.memNm}')">
			                        블랙리스트 추가
			                    </button>
			                </c:otherwise>
			            </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <form id="searchform" method="get" action="${cPath }/main/master/memberList.do#memberList">
				<input type="hidden" name="page" />
			</form>
			<div class="d-lg-flex align-items-center">
				<div
					class="me-lg-auto text-md-left text-center mt-2 mt-lg-0 mb-2 mb-lg-0">
				</div>
				<ul class="pagination mb-0 justify-content-center flex-wrap paging-area">
					${pagingHTML }
				</ul>
			</div>
</div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="blacklistModal" tabindex="-1" aria-labelledby="blacklistModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="blacklistModalLabel">블랙리스트 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${cPath}/main/master/blackList#memberList" method="post">
                    <input type="hidden" id="memNo" name="memNo">
                    <div>
                        <label>회원명: <span id="memberName"></span></label>
                    </div>
                    <div class="mb-3">
                        <label for="blacklistResn" class="form-label">사유:</label>
                        <input type="text" class="form-control" id="blacklistResn" name="blacklistResn" required>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">블랙리스트 등록</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">등록 취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function setModalValues(memNo, memName) {
    document.getElementById('memNo').value = memNo;
    document.getElementById('memberName').textContent = memName;
}
</script>
<script src="${cPath}/resources/js/app/utils/paging.js"></script>