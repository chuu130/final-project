document.addEventListener("DOMContentLoaded", ()=>{
	$('#modalDetail').on('show.bs.modal', function(e){
		var franId = $(e.relatedTarget).data('id');
		var franDe = $(e.relatedTarget).data('de');
		
		$.ajax({
			url : "franAduitCheckList",
			data : {"franId" : franId
					,"franDe" : franDe
			},
			method : "POST",
			success:(data)=>{
				console.log(data);
				showModal(data);
			},
			error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		});
	});
	
	function showModal(data){
		var checkList = '';
		$(".modal-body").empty();
		var checkClean = '';
		var checkReview = '';
		var checkStock = '';
		var checkKind = '';
		var checkJob = '';
		var checkSafety = '';
		var checkStore = '';
		if(data.checkClean == '10')checkClean = '매우 우수'; 
		else if(data.checkClean == '8') checkClean = '우수';
		else if(data.checkClean == '6') checkClean = '보통';
		else if(data.checkClean == '4') checkClean = '부족';
		else if(data.checkClean == '2') checkClean = '매우 부족';
		
		if(data.checkReview == '10')checkReview = '매우 우수'; 
		else if(data.checkReview == '8') checkReview = '우수';
		else if(data.checkReview == '6') checkReview = '보통';
		else if(data.checkReview == '4') checkReview = '부족';
		else if(data.checkReview == '2') checkReview = '매우 부족';
		
		if(data.checkStock == '10')checkStock = '매우 우수'; 
		else if(data.checkStock == '8') checkStock = '우수';
		else if(data.checkStock == '6') checkStock = '보통';
		else if(data.checkStock == '4') checkStock = '부족';
		else if(data.checkStock == '2') checkStock = '매우 부족';
		
		if(data.checkKind == '10')checkKind = '매우 우수'; 
		else if(data.checkKind == '8') checkKind = '우수';
		else if(data.checkKind == '6') checkKind = '보통';
		else if(data.checkKind == '4') checkKind = '부족';
		else if(data.checkKind == '2') checkKind = '매우 부족';
		
		if(data.checkJob == '10')checkJob = '매우 우수'; 
		else if(data.checkJob == '8') checkJob = '우수';
		else if(data.checkJob == '6') checkJob = '보통';
		else if(data.checkJob == '4') checkJob = '부족';
		else if(data.checkJob == '2') checkJob = '매우 부족';
		
		if(data.checkSafety == '10')checkSafety = '매우 우수'; 
		else if(data.checkSafety == '8') checkSafety = '우수';
		else if(data.checkSafety == '6') checkSafety = '보통';
		else if(data.checkSafety == '4') checkSafety = '부족';
		else if(data.checkSafety == '2') checkSafety = '매우 부족';
		
		if(data.checkStore == '10')checkStore = '매우 우수'; 
		else if(data.checkStore == '8') checkStore = '우수';
		else if(data.checkStore == '6') checkStore = '보통';
		else if(data.checkStore == '4') checkStore = '부족';
		else if(data.checkStore == '2') checkStore = '매우 부족';
		
		
		
		
		
		checkList = `
			<div class="row gx-2 align-items-center">
					<div class="col-sm-23 py-1 fs-15px">
						<div class="row mb-10px">
							<div class="col-4 fw-bold">가맹점명 :</div>
							<div class="col-8 text-body">${data.franchise.franchiseNm}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">청결도항목 :</div>
							<div class="col-8 text-body" id="checkClean">${checkClean}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">호텔 & 미용 리뷰 평가항목 :</div>
							<div class="col-8 text-body" id="checkReview">${checkReview}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">재고관리항목 :</div>
							<div class="col-8 text-body" id="checkStock">${checkStock}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">친절도항목 :</div>
							<div class="col-8 text-body" id="checkKind">${checkKind}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">직무이해도항목 :</div>
							<div class="col-8 text-body" id="checkJob">${checkJob}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">안전점검항목 :</div>
							<div class="col-8 text-body" id="checkSafety">${checkSafety}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">매장관리항목 :</div>
							<div class="col-8 text-body" id="checkStore">${checkStore}</div>
						</div>
					</div>
				</div>
		`;
		
		$(".modal-body").append(checkList);   
		
		let checkCleanText = $("#checkClean").text();
		let checkReviewText = $("#checkReview").text();
		let checkStockText = $("#checkStock").text();
		let checkKindText = $("#checkKind").text();
		let checkJobText = $("#checkJob").text();
		let checkSafetyText = $("#checkSafety").text();
		let checkStoreText = $("#checkStore").text();
		console.log(checkCleanText);
		if(checkCleanText == '매우 우수') $("#checkClean").attr('class', 'col-8 text-success');
		else if(checkCleanText == '우수') $("#checkClean").attr('class', 'col-8 text-success');
		else if(checkCleanText == '보통') $("#checkClean").attr('class', 'col-8 text-secondary');
		else if(checkCleanText == '부족') $("#checkClean").attr('class', 'col-8 text-warning');
		else if(checkCleanText == '매우 부족') $("#checkClean").attr('class', 'col-8 text-danger');
		
		if(checkReviewText == '매우 우수') $("#checkReview").attr('class', 'col-8 text-success');
		else if(checkReviewText == '우수') $("#checkReview").attr('class', 'col-8 text-success');
		else if(checkReviewText == '보통') $("#checkReview").attr('class', 'col-8 text-secondary');
		else if(checkReviewText == '부족') $("#checkReview").attr('class', 'col-8 text-warning');
		else if(checkReviewText == '매우 부족') $("#checkReview").attr('class', 'col-8 text-danger');
		
		if(checkStockText == '매우 우수') $("#checkStock").attr('class', 'col-8 text-success');
		else if(checkStockText == '우수') $("#checkStock").attr('class', 'col-8 text-success');
		else if(checkStockText == '보통') $("#checkStock").attr('class', 'col-8 text-secondary');
		else if(checkStockText == '부족') $("#checkStock").attr('class', 'col-8 text-warning');
		else if(checkStockText == '매우 부족') $("#checkStock").attr('class', 'col-8 text-danger');
		
		if(checkKindText == '매우 우수') $("#checkKind").attr('class', 'col-8 text-success');
		else if(checkKindText == '우수') $("#checkKind").attr('class', 'col-8 text-success');
		else if(checkKindText == '보통') $("#checkKind").attr('class', 'col-8 text-secondary');
		else if(checkKindText == '부족') $("#checkKind").attr('class', 'col-8 text-warning');
		else if(checkKindText == '매우 부족') $("#checkKind").attr('class', 'col-8 text-danger');
		
		if(checkJobText == '매우 우수') $("#checkJob").attr('class', 'col-8 text-success');
		else if(checkJobText == '우수') $("#checkJob").attr('class', 'col-8 text-success');
		else if(checkJobText == '보통') $("#checkJob").attr('class', 'col-8 text-secondary');
		else if(checkJobText == '부족') $("#checkJob").attr('class', 'col-8 text-warning');
		else if(checkJobText == '매우 부족') $("#checkJob").attr('class', 'col-8 text-danger');
		
		if(checkSafetyText == '매우 우수') $("#checkSafety").attr('class', 'col-8 text-success');
		else if(checkSafetyText == '우수') $("#checkSafety").attr('class', 'col-8 text-success');
		else if(checkSafetyText == '보통') $("#checkSafety").attr('class', 'col-8 text-secondary');
		else if(checkSafetyText == '부족') $("#checkSafety").attr('class', 'col-8 text-warning');
		else if(checkSafetyText == '매우 부족') $("#checkSafety").attr('class', 'col-8 text-danger');
		
		if(checkStoreText == '매우 우수') $("#checkStore").attr('class', 'col-8 text-success');
		else if(checkStoreText == '우수') $("#checkStore").attr('class', 'col-8 text-success');
		else if(checkStoreText == '보통') $("#checkStore").attr('class', 'col-8 text-secondary');
		else if(checkStoreText == '부족') $("#checkStore").attr('class', 'col-8 text-warning');
		else if(checkStoreText == '매우 부족') $("#checkStore").attr('class', 'col-8 text-danger');
		
		
		
	}
});