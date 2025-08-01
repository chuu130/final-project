<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">

<meta name="_csrf" content="${_csrf.token}">

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">QNA</li>
		</ul>
		<h1 class="page-header mb-0">문의글답변수정</h1>
	</div>
</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap"></div>

<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">
		
			<!-- BEGIN table -->
			<div class="tab-content p-4">
				<div class="table-responsive">
					<table class="table table-hover text-nowrap">
					<h4>☑️고객문의 상세☑️</h4>
						<thead>
							<tr>
								<th class="board-header-container">문의게시판번호</th>
								<td>${center.ctrBbsNo}</td>
							</tr>
							<tr>
								<th class="board-header-container">제목</th>
								<td>${center.ctrBbsNm}</td>
							</tr>
							<tr>
								<th class="board-header-container">작성자</th>
								<td>${center.memId}</td>
							</tr>
							<tr>
								<th class="board-header-container">날짜</th>
								<td>${center.ctrBbsDe}</td>
							</tr>
							<tr>
								<th class="board-header-container">질문유형</th>
								<td>${center.ctrBbsSn}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="board-header-container">내용</th>
								<td>${center.ctrBbsCn}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- END table -->
		
		

			<!-- Contact us section -->
			<section class="ms-contact padding-tb-30">
				<div class="container">
					<div class="section-title-2">
						<h2 class="ms-title">
							<span>문의글답변수정</span>
						</h2>
<%-- 						<p>${answer}</p> --%>
					</div>
					<div class="row p-t-15">
						<div class="col-md-6" id="form-boxsize">

							<form method="post"
								action="${cPath}/main/master/masterAnswerUpdate"
								id="updateform" enctype="multipart/form-data"
								modelAttribute="qnaBoard">
								<div class="board-content">
									<div class="form-group">
										<input type="hidden" class="form-control" name="qnaAnswerId"
											id="qnaAnswerId" value="${answer.qnaAnswerId }">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" name="qnaAnswerNm"
											id="qnaAnswerNm" value="${answer.qnaAnswerNm }">
									</div>
									<div class="form-group">
										<textarea style="height: 250px" class="form-control"
											name="qnaAnswerCn" id="qnaAnswerCn" rows="3">${answer.qnaAnswerCn }</textarea>
									</div>
									<div>
										 <input type="hidden" name="ctrBbsNo" value="${answer.ctrBbsNo}">
									</div>
								</div>

								<div class="detailBtn">
<!-- 									<div class="ms-auto"> -->
										<a href="${cPath}/main/master/${answer.ctrBbsNo}/quest"
											class="btn btn-theme fw-semibold fs-13px">이전으로</a>
<!-- 									</div> -->
<!-- 									<div class="ms-auto"> -->
									<button type="button" id="updateBtn"
										class="btn btn-theme fw-semibold fs-13px">답변수정</button>
<!-- 									</div> -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<script>

document.getElementById("updateBtn").addEventListener("click", async () => {
    const result = await Swal.fire({
        title: '수정하시겠습니까?',
        text: '한 번 수정하면 되돌릴 수 없습니다.',
        icon: 'warning',
        showCancelButton: true,// cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
        confirmButtonText: '확인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소'// cancel 버튼 텍스트 지정
    });

    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
        await Swal.fire({
            title: '수정이 완료되었습니다.',
            text: '',
            icon: 'success',
            confirmButtonColor: '#3085d6'
        });

        // 폼 제출
        document.getElementById("updateform").requestSubmit();
    }
});


document.addEventListener('DOMContentLoaded', () => {
    ClassicEditor
        .create(document.querySelector('#qnaAnswerCn'), {
            language: 'ko',
            simpleUpload: {
                uploadUrl: '/prms/prod/file/upload',  // 파일 업로드 URL로 변경
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="_csrf"]').getAttribute('content')
                }
            },
            toolbar: [
            	'fontColor', 'fontBackgroundColor', 'heading', '|', 'bold', 'italic', 'link', '|',
                'bulletedList', 'numberedList', '|',
                'blockQuote', 'insertTable', 'mediaEmbed', 'imageUpload', 'undo', 'redo'
            ],
            extraPlugins: [MyCustomUploadAdapterPlugin] // 커스텀 업로드 어댑터 플러그인 추가
        })
        .catch(error => {
            console.error('CKEditor 에러:', error);
        });
});

function MyCustomUploadAdapterPlugin(editor) { // 업로드 어댑터 에디터 설정해줘야 쓸수있음
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyUploadAdapter(loader);
    };
}

class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload() {
        return this.loader.file
            .then(file => {
                const formData = new FormData();
                formData.append('upload', file);

                return fetch('/prms/prod/file/upload', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="_csrf"]').getAttribute('content')
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        throw new Error(data.error.message);
                    }

                    // 파일 업로드 후 에디터에 링크 삽입
                    return {
                        default: data.url
                    };
                });
            })
            .then(data => {
                const linkUrl = data.default;
                const editor = this.loader.editor;
                const model = editor.model;

                model.change(writer => {
                    const linkElement = writer.createElement('link', {
                        href: linkUrl
                    });
                    writer.insertText('Uploaded File', { linkHref: linkUrl }, linkElement, model.document.selection.getFirstPosition());
                });
            });
    }

    abort() {
        // 파일 업로드 중단 처리
    }
}


</script>

<script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>
<script src="${cPath }/resources/js/app/master/noticeboard.js"></script>
<script src="${cPath }/resources/js/ckeditor/ckeditor.js"></script>