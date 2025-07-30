/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
    const cPath = document.body.dataset.contextPath;
    const modalBody = document.getElementById("modalBody");
    const Detail = document.querySelectorAll(".Detail");
    const ingoBtn = document.getElementById("ingoBtn");

        ingoBtn.addEventListener("click", () => {
			var warQy = document.querySelector("#warQy").value;
			var prodId = document.querySelector("#prodId").value;
			console.log(warQy);
			console.log(prodId);

			Swal.fire({
				   title: '상품입고를 하시겠습니까?',
				   text: '',
				   icon: 'warning',

				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				   confirmButtonText: '입고', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소' // cancel 버튼 텍스트 지정

				}).then(result => {
				   // 만약 Promise리턴을 받으면,
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					   Swal.fire({
						   title: '상품 입고가 완료었습니다.',
						   text: '',
						   icon: 'success',
						   confirmButtonColor: '#3085d6'
					}).then(()=>{
							 $.ajax({
				                url: `${cPath}/main/master/partprodinup`, // AJAX 요청 URL
				                method: "POST",
								data : {
									warQy : warQy,
									prodId : prodId
								},
								dataType: "json",
				                success: function(release) {
									location.href = `${cPath}/main/master/adminInvList.do`;
								},
								error: function(xhr, status, error) {
				                    console.error("AJAX 요청 실패:", error);
				                }

							});

						});
				   }
				});
			 });

    Detail.forEach(modalTag => {
        modalTag.addEventListener("click", (e) => {
            const prodId = e.currentTarget.dataset.prodId; // 클릭된 요소의 data-order-no 값을 가져옵니다.
            console.log(prodId);

            $.ajax({
                url: `${cPath}/main/master/${prodId}/wardetail`, // AJAX 요청 URL
                method: "GET",
				dataType: "json",
                success: function(release) {
					var pc = release.partprodPc;
					const cn1 = pc.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    // 응답 데이터로 모달 내용 업데이트
                    modalBody.innerHTML = `
				<div class="row gx-4 align-items-center">
					<div class="col-sm-5 mb-3 mb-sm-0">
						<div class="card bg-body">
							<div class="card-body p-3">
								<img alt="" src="${release.partprodImage}"
									class="mw-100 d-block">
							</div>
						</div>
					</div>
					<div class="col-sm-7 py-1 fs-13px">
						<div class="row mb-10px">
							<div class="col-4 fw-bold">상품번호:</div>
							<div class="col-8 text-body">${release.prodId}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">상품이름:</div>
							<div class="col-8 text-body">${release.partprodNm}</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">카테고리:</div>
							<div class="col-8 text-body">
								<span
									class="badge text-bg-theme py-6px px-2 fs-10px my-n1 fw-bold">${release.partprodSe}</span>
							</div>
						</div>
						<div class="row mb-10px">
							<div class="col-4 fw-bold">입고단가:</div>
							<div class="col-8 text-body">${cn1}</div>
						</div>
						<div class="row">
							<div class="col-4 fw-bold">입고수량:</div>
							<div class="col-8 text-body">
								<input type="number" class="form-control form-control-sm w-100px" id="warQy" name="warQy"
										value="">
								<input type="hidden" id="prodId" name="prodId" value="${release.prodId}">
							</div>
						</div>
					</div>
				</div>
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