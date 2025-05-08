<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="${cPath }/resources/css/marketstyle/marketBoard.css">

<meta name="_csrf" content="${_csrf.token}">
      
      <div class="ms-breadcrumb m-b-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ms_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ms-breadcrumb-title">질문등록</h2>
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
        </div>
</section>

<!-- Contact us section -->
<div class="quset">
    <section class="ms-contact padding-tb-30">
        <div class="container">
            <div class="section-title-2 section-title-custom">
                 <h2 class="ms-title">
                    <span>Q&A게시판</span>
                </h2>
            </div>
            <div class="row p-t-15" id="section-qna">
                <div class="col-md-6" id="section-width">
                    <form method="post" action="/prms/market/member/centerInsertData" enctype="multipart/form-data" modelAttribute="centerList">
                        <div class="form-group">
                         <h6>제목</h6>
                            <input type="text" class="form-control ctrBbsNm-style" name="ctrBbsNm" id="ctrBbsNm" placeholder="제목을 입력해주세요">
                        </div>
                         <div class="form-group">
                         <h6>질문유형</h6>
                           <select class="form-control ctrBbsType-style" name="ctrBbsSn" >
	                           	<option value="">질문유형을 선택해주세요</option>
	                           	<option value="회원가입/정보">회원가입/정보</option>
	                           	<option value="상품구매/주문">상품구매/주문</option>
	                           	<option value="결제/배송">결제/배송</option>
	                           	<option value="교환/반품">교환/반품</option>
	                           	<option value="기타">기타</option>
                           </select>
                        </div>
                        <div class="form-group">
                         <textarea class="form-control" name="ctrBbsCn" id="ctrBbsCn" rows="3" placeholder="문의할내용을 입력해주세요"></textarea>
                        </div>
                        <div class="qnaBtn">
                            <button type="submit" class="btn ms-btn-2">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Load CKEditor -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/ckeditor5/build/ckeditor.js"></script> --%>
<script src="${cPath }/resources/js/ckeditor/ckeditor.js"></script>
<script>
document.addEventListener('DOMContentLoaded', () => {
    ClassicEditor
        .create(document.querySelector('#ctrBbsCn'), {
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
                'blockQuote', 'insertTable', 'mediaEmbed', 'imageUpload', 'fileUpload', 'undo', 'redo'
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

document.getElementById('fileUpdateForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(this);

    fetch('/prod/file/update', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="_csrf"]').getAttribute('content')
        }
    })
    .then(response => response.json())
    .then(data => {
        if (data.error) {
            alert('파일 수정 오류: ' + data.error.message);
        } else if (data.url) {
            alert('파일 수정 성공: ' + data.url);
        } else {
            alert(data.message);
        }
    })
    .catch(error => {
        console.error('파일 수정 요청 실패:', error);
    });
});
</script>