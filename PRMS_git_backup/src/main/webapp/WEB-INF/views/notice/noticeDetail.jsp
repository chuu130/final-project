<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">



<!-- 본사 master 공지사항 디테일 페이지 -->
<!-- BEGIN #content -->
<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/noticeList" var="noticeListUrl" />
			<li class="breadcrumb-item"><a href="${noticeListUrl }">공지사항목록</a></li>
			<li class="breadcrumb-item active">공지사항상세</li>
		</ul>
		<h1 class="page-header mb-0">공지사항 상세</h1>
	</div>
</div>

<!-- #contentBOX -->
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">

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
			<div class="detailBtn">
				<div class="detailBtn-align">
				<div class="d-lg-flex align-items-center">
					<div class="detailBtn-align-margin">
					<form method="get" action="${cPath}/main/master/${notice.noticeBbsNo}/updateUI">
						<button type="submit" class="btn btn-theme fw-semibold fs-13px">수정</button>
					</form>
					</div>
					<div class="detailBtn-align-margin">
					<form method="post" action="/prms/main/master/${notice.noticeBbsNo}/deleteNotice" id="deleteform">
						<button type="button" onclick="return deletebtn()" id="delBtn" class="btn btn-danger fw-semibold fs-13px">삭제</button>
					</form>
					</div>
				</div>
				</div>
			</div>

			<script>
				document.getElementById("delBtn").addEventListener("click", async () => {
				    const result = await Swal.fire({
				        title: '삭제하시겠습니까?',
				        text: '한 번 삭제하면 되돌릴 수 없습니다.',
				        icon: 'warning',
				        showCancelButton: true,// cancel버튼 보이기. 기본은 원래 없음
				        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				        cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				        confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				        cancelButtonText: '취소'// cancel 버튼 텍스트 지정
				    });
	
				    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				        await Swal.fire({
				            title: '삭제가 완료되었습니다.',
				            text: '',
				            icon: 'success',
				            confirmButtonColor: '#3085d6'
				        });
	
				        // 폼 제출
				        document.getElementById("deleteform").requestSubmit();
				    }
				});
			</script>
		</div>
	</div>
</div>
<!-- #contentBOX END -->