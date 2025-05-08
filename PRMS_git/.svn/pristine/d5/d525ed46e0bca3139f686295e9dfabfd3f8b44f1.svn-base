/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
    const cPath = document.body.dataset.contextPath;
    const modalBody = document.getElementById("modalBody");
    const prodDetail = document.querySelectorAll(".prodDetail");
    const relBtn = document.querySelectorAll(".relBtn");

	 relBtn.forEach(releaseTag => {
        releaseTag.addEventListener("click", (e) => {
			const orderNo = e.currentTarget.dataset.orderNo; // 클릭된 요소의 data-order-no 값을 가져옵니다.
            console.log(orderNo);
			Swal.fire({
				   title: '상품출고를 하시겠습니까?',
				   text: '',
				   icon: 'warning',

				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				   confirmButtonText: '출고', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소' // cancel 버튼 텍스트 지정

				}).then(result => {
				   // 만약 Promise리턴을 받으면,
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					   Swal.fire({
						   title: '상품 출고가 완료었습니다.',
						   text: '',
						   icon: 'success',
						   confirmButtonColor: '#3085d6'
					}).then(()=>{
							 $.ajax({
				                url: `${cPath}/main/master/release/${orderNo}`, // AJAX 요청 URL
				                method: "GET",
				                success: function(release) {
									location.href = `${cPath}/main/master/releaseList.do`;
								},
				                error: function(xhr, status, error) {
				                    console.error("AJAX 요청 실패:", error);
				                }
				            });

						});
				   }
				});
			 });
	});

    prodDetail.forEach(modalTag => {
        modalTag.addEventListener("click", (e) => {
            const orderNo = e.currentTarget.dataset.orderNo; // 클릭된 요소의 data-order-no 값을 가져옵니다.
            console.log(orderNo);

            $.ajax({
                url: `${cPath}/main/master/${orderNo}/detail`, // AJAX 요청 URL
                method: "GET",
                dataType: "json",
                success: function(release) {
                    // 응답 데이터로 모달 내용 업데이트
					var pc = release.releasePc;
					const cn1 = pc.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var date = release.releaseDe;
					const date2 = date.toString().replaceAll(",", "-");
                    modalBody.innerHTML = `
				<div class="row gx-4 align-items-center">
					<div class="col-sm-5 mb-3 mb-sm-0">
						<div class="card bg-body">
							<div class="card-body p-3">
								<img alt="" src="${release.prod.partprodImage}"
									class="mw-100 d-block">
							</div>
						</div>
					</div>
					<div class="col-sm-7 py-1 fs-13px">
						<div class="row mb-10px">
							<div class="col-4 fw-bold">발주신청가맹점이름:</div>
							<div class="col-8 text-body">${release.franchise.franchiseNm}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">상품이름:</div>
							<div class="col-8 text-body">${release.prod.partprodNm}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">카테고리:</div>
							<div class="col-8 text-body">
								<span
									class="badge text-bg-theme py-6px px-2 fs-10px my-n1 fw-bold">${release.prod.partprodSe}</span>
							</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">발주신청일자:</div>
							<div class="col-8 text-body">${date2}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">출고단가:</div>
							<div class="col-8 text-body">${cn1}원</div>
						</div>
						<div class="row">
							<div class="col-4 fw-bold">출고수량:</div>
							<div class="col-8 text-body">
								<input type="text" class="form-control form-control-sm w-100px" name="stock"
									value="${release.releaseQy}" readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-bs-dismiss="modal"
					class="btn btn-default fs-13px fw-semibold w-100px">취소</a>
			</div>
                    `;
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        });
    });
});