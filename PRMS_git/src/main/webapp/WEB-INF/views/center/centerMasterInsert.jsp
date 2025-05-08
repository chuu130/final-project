<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">
<meta name="_csrf" content="${_csrf.token}">

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">고객센터</li>
		</ul>
		<h1 class="page-header mb-0">QNA</h1>
	</div>
</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap"></div>

<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">

			<!-- BEGIN table -->
			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="board-header-container">
								<div class="board-header-title">${center.ctrBbsNm}</div>
								<div class="board-header-date">${center.ctrBbsDe}</div>
								<div class="board-header-date">게시물 번호: ${center.ctrBbsNo}</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="board-content-row">
							<td class="board-content">${center.ctrBbsCn}</td>
						</tr>
					</tbody>
				</table>

			</div>
			<!-- END table -->

			<!-- Contact us section -->
			<section class="ms-contact padding-tb-30">
				<div class="container">
					<div class="section-title-2">
						<h5 class="ms-title">회원문의글 답변 등록</h5>
					</div>
					<div class="row p-t-15">
						<div class="col-md-6" id="form-boxsize">
							<form:form method="post"
								action="${cPath }/main/master/masterAnswerInsert" id="insertform">
								<div class="form-group">
									<input type="hidden" name="ctrBbsNo" value="${center.ctrBbsNo}">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="qnaAnswerNm"
										id="qnaAnswerNm" placeholder="제목">
								</div>
								<div class="form-group">
									<textarea class="qnaAnswerCn-form" name="qnaAnswerCn"
										style="height: 200px" id="qnaAnswerCn" rows="3"
										placeholder="답변할 내용을 이곳에 입력해주세요"></textarea>
								</div>
								<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
								<div class="noticeBtn-group">
									<button type="button" class="btn btn-theme fw-semibold fs-13px"
										id="insertBtn">등록하기</button>
								<form method="get" action="${cPath }/main/master/centerMasterList">
								<button type="button" class="btn btn-primary">목록조회</button>
								</form>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<!-- Load CKEditor -->
<script src="${cPath }/resources/js/ckeditor/ckeditor.js"></script>
<script>
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
                'heading', '|', 'bold', 'italic', 'link', '|',
                'bulletedList', 'numberedList', '|',
                'blockQuote', 'insertTable', 'mediaEmbed', 'imageUpload', 'undo', 'redo'
            ],
            extraPlugins: [MyCustomUploadAdapterPlugin] // 커스텀 업로드 어댑터 플러그인 추가
        })
        .catch(error => {
            console.error('CKEditor 에러:', error);
        });
});

function MyCustomUploadAdapterPlugin(editor) {
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


document.getElementById("insertBtn").addEventListener("click", async () => {
    const result = await Swal.fire({
        title: '등록하시겠습니까?',
        text: '한 번 등록하면 되돌릴 수 없습니다.',
        icon: 'warning',
        showCancelButton: true,// cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
        confirmButtonText: '확인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소'// cancel 버튼 텍스트 지정
    });

    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
        await Swal.fire({
            title: '등록이 완료되었습니다.',
            text: '',
            icon: 'success',
            confirmButtonColor: '#3085d6'
        });

        // 폼 제출
        document.getElementById("insertform").requestSubmit();
    }
});





$(document).ready(function(){
 $('.qnaAnswerCn-form').keyup(function (){
	var content = $(this).val();
	$('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

	if (content.length > 200){
		alert("최대 200자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 200));
		$('#counter').html("(200 / 최대 200자)");
	}
 });
});

</script>