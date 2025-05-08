<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="d-flex align-items-center mb-3">
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:;">Pages</a></li>
			<li class="breadcrumb-item active">Product Details</li>
		</ol>
		<h1 class="page-header mb-0">Product Details</h1>
	</div>
</div>

<div class="row gx-4">
	<div class="col-xl-8">
		<div class="card mb-4">
			<div class="card-header bg-none fw-bold">상품 정보</div>
			<div class="card-body">
				<div class="mb-3">
					<label class="form-label">상품이름 <span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="title" value="${prodDetail.prodSleNm }"
						placeholder="Product name">
				</div>
				<div class="">
					<label class="form-label">상품사진 <span
						class="text-danger">*</span></label>
					<img src="${prodDetail.prodImage }" width="200px" height ="200px"/>
				</div>
				<table class="table table-hover text-nowrap">
					<tr>
						<th>상품 가격</th>
						<td>${prodDetail.prodSlePc }원</td>
					</tr>
					<tr>
						<th>상품 등록일</th>
						<td>${prodDetail.prodRegistDe }</td>
					</tr>
					<tr>
						<th>상품 재고수량</th>
						<td>${prodDetail.adminInv.admininvQy }개</td>
					</tr>
					<tr>
						<th>상품 업체</th>
						<td>${prodDetail.partners.partnersCornm }</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header d-flex align-items-center bg-none fw-bold">
				Media</div>
			<form id="fileupload" action="//jquery-file-upload.appspot.com/"
				name="file_upload_form" method="POST" enctype="multipart/form-data">
				<div class="card-body pb-2">
					<div class="fileupload-buttonbar mb-2">
						<div class="d-block d-lg-flex align-items-center">
							<span
								class="btn btn-theme fs-13px fw-semibold fileinput-button me-2 mb-1">
								<i class="fa fa-fw fa-plus"></i> <span>Add files...</span> <input
								type="file" name="files[]" multiple="">
							</span>
							<button type="submit"
								class="btn btn-default fs-13px fw-semibold me-2 mb-1 start">
								<i class="fa fa-fw fa-upload"></i> <span>Start upload</span>
							</button>
							<button type="reset"
								class="btn btn-default fs-13px fw-semibold me-2 mb-1 cancel">
								<i class="fa fa-fw fa-ban"></i> <span>Cancel upload</span>
							</button>
							<button type="button"
								class="btn btn-default fs-13px fw-semibold me-2 mb-1 delete">
								<i class="fa fa-fw fa-trash"></i> <span>Delete</span>
							</button>
							<div class="form-check ms-2 mb-1">
								<input type="checkbox" id="toggle-delete"
									class="form-check-input toggle"> <label
									for="toggle-delete" class="form-check-label">Select
									Files</label>
							</div>
						</div>
					</div>
					<div id="error-msg"></div>
				</div>
				<table class="table table-card mb-0 fs-13px">
					<thead>
						<tr class="fs-12px">
							<th class="pt-2 pb-2 w-25">Preview</th>
							<th class="pt-2 pb-2 w-25">Filename</th>
							<th class="pt-2 pb-2 w-25">Size</th>
							<th class="pt-2 pb-2 w-25">Action</th>
						</tr>
					</thead>
					<tbody class="files">
						<tr class="empty-row">
							<td colspan="4" class="text-center p-3">
								<div class="text-body text-opacity-25 my-3">
									<i class="fa fa-file-archive fa-3x"></i>
								</div> No file uploaded
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		
	</div>	
	
	<div class="col-xl-4">
		<div class="card mb-4">
			<div class="card-header bg-none fw-bold d-flex align-items-center">
				<div class="flex-1">
					<div>Organization</div>
				</div>
			</div>
			<div class="card-body">
				<div class="mb-3">
					<label class="form-label">Product type</label>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Product type">
						<button class="btn btn-default">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				<button id="save" type="submit" class="btn btn-theme fs-13px fw-semibold">수정 완료</button>
			</div>
		</div>
		
		
	</div>
</div>