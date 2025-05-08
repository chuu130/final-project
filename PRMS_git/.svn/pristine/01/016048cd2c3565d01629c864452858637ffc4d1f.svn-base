<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">
<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketBoard.css">

<!-- BEGIN #content -->

<div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">공지사항</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="${cPath }/market/marketpage.do">Home</a></li>
                                <li class="ms-breadcrumb-item active">공지사항</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>	



<!-- Shop section -->
<div class="ms-shop padding-tb-30">
	<div class="container">
		<div class="container-preboard">
		<h4 class="notice-sub">공지사항</h4>
		</div>
		
			<!-- BEGIN table -->
			<div class="table-responsive">
				<table class="table text-nowrap">
					<thead>
						<tr>
							<th class="notice-background">작성자</th>
							<td>${notice.empId}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="notice-background">제목</th>
							<td>${notice.noticeBbsNm}</td>
						</tr>
						<tr>
							<th class="notice-background">날짜</th>
							<td>${notice.noticeBbsDe}</td>
						</tr>
						<tr>
							<th class="notice-background">내용</th>
							<td class="pt-0 pb-2 board-content" colspan="2" id="noticeBbsCn">${notice.noticeBbsCn}</td>

						</tr>
						<tr>
							<th class="notice-background">파일</th>
							<td colspan="2">
							<c:if test="${not empty notice.atchFile}">
									<c:forEach items="${notice.atchFile.fileDetails}" var="file">
										<c:url value='/files/${file.streFileNm}_${file.orignlFileNm}' var="fileUrl" />
											<a href="/prms/download?fileName=${file.streFileNm}_${file.orignlFileNm}">${file.orignlFileNm}(${file.fileFancysize})</a>
									</c:forEach>
								</c:if></td>
						</tr>
					</tbody>
				</table>
			</div>
		
			<!-- END table -->
			
			
		<div id="noticeMarketBtn">
			<button type="button" class="btn ms-btn-2" onclick = "location.href ='${cPath}/market/member/noticeList'">목록보기</button>
		</div>
	</div>
</div>



