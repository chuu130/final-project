
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>droplet | Product Details</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="assets/css/vendor.min.css" rel="stylesheet">
	<link href="assets/css/app.min.css" rel="stylesheet">
	<!-- ================== END core-css ================== -->
	
	<!-- ================== BEGIN page-css ================== -->
	<link href="../assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet">
	<link href="../assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet">
	<link href="../assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet">
	<!-- ================== END page-css ================== -->

</head>
		
		<!-- BEGIN #content -->
			<div class="d-flex align-items-center mb-3">
				<div>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:;">Pages</a></li>
						<li class="breadcrumb-item active">시설수리신청</li>
					</ol>
					<h1 class="page-header mb-0">시설수리신청</h1>
				</div>
			</div>
			
			<div class="row gx-4">
				<div class="col-xl-8">
					<div class="card mb-4">
						<div class="card-header bg-none fw-bold">
							시설수리신청
						</div>
						<div class="card-body">
							<div class="mb-3">
								<label class="form-label">내용 <span class="text-danger">*</span></label>
								<input type="text" class="form-control" name="title" placeholder="내용">
							</div>
							<div class="">
								<label class="form-label">사진 <span class="text-danger">*</span></label>
								<textarea class="summernote" rows="10"></textarea>
							</div>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header d-flex align-items-center bg-none fw-bold">
							파일
						</div>
						<form id="fileupload" action="//jquery-file-upload.appspot.com/" name="file_upload_form" method="POST" enctype="multipart/form-data">
							<div class="card-body pb-2">
								<div class="fileupload-buttonbar mb-2">
									<div class="d-block d-lg-flex align-items-center">
										<span class="btn btn-theme fs-13px fw-semibold fileinput-button me-2 mb-1">
											<i class="fa fa-fw fa-plus"></i>
											<span>파일추가하기</span>
											<input type="file" name="files[]" multiple>
										</span>
										<button type="reset" class="btn btn-default fs-13px fw-semibold me-2 mb-1 cancel">
											<i class="fa fa-fw fa-ban"></i>
											<span>단건삭제</span>
										</button>
										<button type="button" class="btn btn-default fs-13px fw-semibold me-2 mb-1 delete">
											<i class="fa fa-fw fa-trash"></i>
											<span>전체삭제</span>
										</button>
										<div class="form-check ms-2 mb-1">
											<input type="checkbox" id="toggle-delete" class="form-check-input toggle">
											<label for="toggle-delete" class="form-check-label">Select Files</label>
										</div>
									</div>
								</div>
								<div id="error-msg"></div>
							</div>
							<table class="table table-card mb-0 fs-13px">
								
								<tbody class="files">
									<tr class="empty-row">
										<td colspan="4" class="text-center p-3">
											<div class="text-body text-opacity-25 my-3"><i class="fa fa-file-archive fa-3x"></i></div> 
											No file uploaded
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div class="card mb-4">
						<div class="card-header d-flex align-items-center bg-none fw-bold">
							신청상세
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-6">
									<div class="mb-lg-0 mb-3">
										<label class="form-label">파손사유</label>
										<select class="form-select" name="warranty_type_id">
											<option value="">파손사유선택</option>
											<option value="1">고객 잘못으로 인한 시설물 파손</option>
											<option value="2">직원 잘못으로 인한 시설물 파손</option>
											<option value="3">천재지변으로 인한 시설물 파손</option>
											<option value="4">기타</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="mb-lg-0 mb-3">
										<label class="form-label">예상수리가격</label>
										<select class="form-select" name="warranty_id">
											<option value="">예상수리가격</option>
											<option value="1">100,000</option>
											<option value="2">200,000</option>
											<option value="3">300,000</option>
											<option value="4">400,000</option>
											<option value="5">500,000</option>
											<option value="10">600,000</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4">
					<div class="card mb-4">
						<div class="card-header bg-none fw-bold d-flex align-items-center">
							<div class="flex-1">
								<div>신청일자</div>
							</div>
							<div><a href="#" class="text-decoration-none fw-normal link-secondary">Manage</a></div>
						</div>
						<div class="card-body">
							<div class="d-flex">
								<div class="flex-1 d-flex">
									<div class="me-3"><i class="fa fa-store fa-lg fa-fw text-body text-opacity-25"></i></div>
									<div>신청일자</div>
									<span class="badge bg-theme-subtle text-theme fw-bold fs-12px ms-auto me-2 d-flex align-items-center">2024-01-05</span>
								</div>
								<div class="w-50px text-center"><a href="#" class="text-decoration-none link-secondary"><i class="bi bi-calendar fa-lg"></i></a></div>
							</div>
							<hr class="my-3 opacity-1">
							<div class="d-flex">
								<div class="flex-1 d-flex">
									<div class="me-3"><i class="fab fa-shopify fa-lg fa-fw text-body text-opacity-25"></i></div>
									<div>승인일자</div>
									<span class="badge bg-theme-subtle text-theme fw-bold fs-12px ms-auto me-2 d-flex align-items-center">2024-01-05</span>
								</div>
								<div class="w-50px text-center"><a href="#" class="text-decoration-none link-secondary"><i class="bi bi-calendar fa-lg"></i></a></div>
							</div>
							<hr class="my-3 opacity-1">
							<div class="d-flex">
								<div class="flex-1 d-flex">
									<div class="me-3"><i class="fab fa-amazon fa-lg fa-fw text-body text-opacity-25"></i></div>
									<div>
										<div>신청승인상태</div>
										<div class="d-flex mt-1 text-body text-opacity-50 small">
											<div><i class="fa fa-circle text-warning fs-6px d-block mt-2"></i></div>
											<div class="flex-1 ps-2">
												<div class="mb-2">
													미승인
												</div>
												<a href="#">나의 신청목록 조회</a>
											</div>
										</div>
									</div>
								</div>
								<div class="w-50px text-center"><a href="#" class="text-decoration-none link-secondary"><i class="bi bi-x-circle-fill fa-lg fa-fw"></i></a></div>
							</div>
						</div>
					</div>
					
							
		<!-- END #content -->
		
		<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
		<!-- END btn-scroll-top -->
	</div>
	<!-- END #app -->

    