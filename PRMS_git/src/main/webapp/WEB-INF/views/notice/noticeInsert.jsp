<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="${cPath }/resources/css/franstyle/franBoard.css">

<style>

.ck-editor__main{
    min-height: 150px; /* 최소 높이 설정 */
    height: auto; /* 높이를 자동으로 설정 */
}

.ck-editor__editable_inline {
    min-height: 200px;
    max-height: 200px; /* 최대 높이 설정 */
    overflow-y: auto; /* 내용이 넘칠 경우 세로 스크롤 추가 */
}

</style>

<meta name="_csrf" content="${_csrf.token}">

<div class="d-flex mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/noticeList" var="noticeListUrl" />
			<li class="breadcrumb-item"><a href="${noticeListUrl }">공지사항 목록</a></li>
			<li class="breadcrumb-item active">공지사항 등록</li>
		</ul>
		<h1 class="page-header mb-0">공지사항 등록</h1>
	</div>
</div>

<div class="mb-sm-3 mb-2 d-flex flex-wrap"></div>

<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">

			<!-- Contact us section -->
			<section class="ms-contact padding-tb-30">
				<div class="container">
					<div class="row p-t-15">
						<div class="col-md-6" id="form-boxsize">
							<form:form method="post"
								action="/prms/main/master/noticeInsertData"
								enctype="multipart/form-data" modelAttribute="noticeBoard">
								<div class="col-xl-6">
								<div class="form-group mb-3">
									<label class="form-label label-text">제목</label>
									<input type="text" class="form-control" name="noticeBbsNm"
										id="noticeBbsNm" placeholder="제목 ">
								</div>
								</div>
								<div class="col-xl-12">
								<div class="form-group mb-3">
									<label class="form-label label-text">내용</label>
									<textarea class="form-control" name="noticeBbsCn"
										id="noticeBbsCn" rows="3" placeholder="내용"></textarea>
								</div>
								</div>
								<div class="form-group">
									<input type="file" class="form-control"
										name="atchFile.fileDetails[0].uploadFile" id="uploadFile1"
										placeholder="제목 " />
									<!--                             <input type="file" class="form-control" name="atchFile.fileDetails[1].uploadFile" id="uploadFile2"  -->
									<!--                             	placeholder="제목 " /> -->
								</div>
								<!--                          <div class="form-group"> -->
								<!--                             <input type="text" class="form-control" name="empNo" id="empNo" placeholder="직원번호등록자"> -->
								<!--                         </div> -->
								<div class="noticeBtn-group">
								<button type="submit" class="btn btn-theme fw-semibold fs-13px" id="insertBtn" style="margin-top:20px;">등록하기</button>
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
        .create(document.querySelector('#noticeBbsCn'), {
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
                'blockQuote', 'insertTable', 'mediaEmbed', 'imageUpload', 'undo', 'redo','fontColor', 'fontBackgroundColor'
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