<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- 마켓질문게시판 리스트페이지 -->
<div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title"></h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ms-breadcrumb-list start -->
                            <ul class="ms-breadcrumb-list">
                                <li class="ms-breadcrumb-item"><a href="${cPath }/market/marketpage.do">Home</a></li>
                                <li class="ms-breadcrumb-item active">Q&A</li>
                            </ul>
                            <!-- ms-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- Shop section -->
<section class="ms-shop padding-tb-30">
	<div class="container">
	
			<!-- Shop content Start -->
			<div class="shop-pro-content">
				<div class="shop-pro-inner">
					<div class="row">
						<!-- 한단락 -->
					</div>
				</div>
			</div>
			<!--Shop content End -->
			
			
	<!-- Shop section -->
<div class="ms-shop padding-tb-30">
	<div class="container">
		<div class="container-preboard">
		<h4>질문상세보기</h4>
		</div>
		
			<!-- BEGIN table -->
			<div class="table-responsive">
				<table class="table text-nowrap">
					<thead>
						<tr>
							<th class="notice-background">작성자</th>
							<td>${center.memId}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="notice-background">제목</th>
							<td>${center.ctrBbsNm}</td>
						</tr>
						<tr>
							<th class="notice-background">날짜</th>
							<td>${center.ctrBbsDe}</td>
						</tr>
						<tr>
							<th class="notice-background">질문유형</th>
							<td>${center.ctrBbsSn}</td>
						</tr>
						<tr>
							<th class="notice-background">내용</th>
							<td class="pt-0 pb-2 board-content" colspan="2" id="noticeBbsCn">${center.ctrBbsCn}</td>

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
		<div class="noticeBtn-group">
			<div class="d-lg-flex align-items-center">
				<div class="btn-group">
					<form method="get" action="${cPath }/market/member/centerMarketList">
						<button type="submit" class="btn ms-btn-2"
							id="insertBtn">목록조회</button>
					</form>
					<form method="get"
						action="${cPath}/market/member/${ctrBbsNo}/updateCenter">
						<button type="submit" class="btn ms-btn-2" id="upBtn">수정하기</button>
					</form>
					<form method="post"
						action="${cPath}/market/member/${ctrBbsNo}/deleteCenter">
						<button type="submit" class="btn ms-btn-2" id="delBtn">삭제하기</button>
					</form>

				</div>
			</div>
		</div>
			</div>
		
			<!-- END table -->		
			
		
		</div>
		<!-- END table -->
		
					<!-- BEGIN table -->
	<div class="tab-content p-4">
		<div class="table-responsive">
			<h6>관리자답변</h6>
			<table class="table table-hover text-nowrap">
			<c:if test="${not empty qnaList}">
					<c:forEach items="${qnaList}" var="qnaList">
				<thead>
				</thead>
				<tbody>
					<tr>
						<th>
							<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_8odrQguUEk4y0r47v-EpBtqpn-Iw3WiErA&s" style="width: 80px;">
						</th>
						<td>
							${qnaList.qnaAnswerNm}<br>
							${qnaList.qnaAnswerDe}<br>
							${qnaList.qnaAnswerCn}<br>
						</td>
					</tr>
				</tbody>
				</c:forEach>
				</c:if>
			</table>
		</div>
		<!-- END table -->
		
	</div>


<!-- END #content -->
		</div>
	</div>
</section>