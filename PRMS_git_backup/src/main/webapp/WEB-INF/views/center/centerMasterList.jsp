<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- BEGIN #content -->
			<div class="d-flex align-items-center mb-3">
				<div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">고객문의관리</a></li>
						<li class="breadcrumb-item active">QNA문의</li>
					</ul>
					<h1 class="page-header mb-0">QNA목록</h1>
				</div>
			</div>
			<div class="mb-sm-3 mb-2 d-flex flex-wrap">
			</div>
			 <div class="card">
			 
				<div class="tab-content p-4">
					<div class="tab-pane fade show active" id="allTab">
					
					<!-- BEGIN input-group -->
				<div class="input-group flex-nowrap mb-4" id="searchUI">
					<div>
					    <select class="noticelistselect" style="height:34px" name="condition.searchType" id="searchType">
					    	<option value="">전체</option>
					    	<option value="title">제목</option>
					    	<option value="writer">작성자</option>
					    </select>
						<div role="separator" class="dropdown-divider"></div>
					</div>
					<div class="flex-fill">
						<div class="input-group">
							<div 
								class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 pe-0 ms-1px z-1" onclick="clickSearch()">
								<i class="fa fa-search opacity-5"></i>
							</div>
							<input type="text" id ="inputContent" class="form-control ps-35px"
								placeholder="검색조건을 입력하세요"  onkeydown="keyDown(this, event)">
						</div>
					</div>
				</div>
				<!-- END input-group -->
						
						<!-- BEGIN table -->
						<div class="table-responsive">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th class="pt-0 pb-2">문의번호</th>
                                <th>문의제목</th>
                                <th>문의내용</th>
                                <th class="pt-0 pb-2">작성자</th>
                                <th class="pt-0 pb-2">작성일</th>
                                <th class="pt-0 pb-2">답변여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty centerList}">
                                <c:forEach items="${centerList}" var="center">
                                    <tr>
                                        <td class="align-middle">${center.ctrBbsNo}</td>
                                        <td class="align-middle">
                                            <a href="<c:url value='/main/master/${center.ctrBbsNo}/quest'/>">
                                                ${center.ctrBbsNm}</a>
                                        </td>
                                        <td class="align-middle">${center.ctrBbsCn}</td>
                                        <td class="align-middle">${center.memNm}</td>
                                        <td class="align-middle">${center.ctrBbsDe}</td>
                          			  <!-- 답변 여부 표시 -->
									            <td>
									                <c:set var="hasAnswer" value="false" />
									                <!-- qnaList에서 center.ctrBbsNo에 해당하는 답변이 있는지 확인 -->
									                <c:forEach items="${qnaList}" var="qna">
									                    <c:if test="${qna.ctrBbsNo == center.ctrBbsNo}">
									                        <c:set var="hasAnswer" value="true" />
									                    </c:if>
									                </c:forEach>
									
									                <!-- hasAnswer 값에 따라 상태 표시 -->
									                <c:choose>
									                    <c:when test="${hasAnswer == 'true'}">
									                        <span style="color:green;">답변완료</span>
									                    </c:when>
									                    <c:otherwise>
									                        <span style="color:red;">답변대기</span>
									                    </c:otherwise>
									                </c:choose>
									            </td>          
                                    </tr>
                                 
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                    
                    <div class="pagination mb-0 justify-content-center flex-wrap paging-area">
						${pagingHTML}
					</div>
                    
                </div>
						<!-- END table -->
						
						
				<!-- 검색 폼 -->
				<form id="searchform" method="get" action="/prms/main/master/centerMasterList#centerMasterList" modelAttribute="condition">
					<input type="hidden" name="searchType" value="${condition.searchType}"/>
					<input type="hidden" name="searchWord" value="${condition.searchWord}"/>
					<input type="hidden"name="page" value="${page}" />
				</form>
					</div>
				</div>
			</div>
		<!-- END #content -->
		
		
<script src="${cPath}/resources/js/app/master/masterQna.js"></script>


