document.addEventListener("DOMContentLoaded", () => {
    console.log("DOMContentLoaded 이벤트 발생");

    const selectElement = document.querySelector("#openname");
    const franchiseopen = document.querySelector("#franchiseopen");

    if (!selectElement) {
        console.error("#openname 요소를 찾을 수 없습니다!");
        return;
    }

    // 초기 빈 UI를 표시하는 함수
    const initializeUI = () => {
        franchiseopen.innerHTML = `
                    <input type="hidden" id="sample6_no" name="foundNo">
                    <input type="hidden" id="sample6_cn" name="foundCn">
        <div class="row">
			<div class="col-xl-6">
            	<div class="form-group mb-3">
                	<label class="form-label label-text">가맹점주명</label>
                	<input type="text" id="sample6_name" name="foundNm" class="form-control" placeholder="가맹점주명" readonly>
            	</div>
            	<div class="form-group mb-3">
                	<label class="form-label label-text">연락처</label>
                    <input type="text" id="sample6_telno" name="foundTelno" class="form-control" placeholder="연락처" readonly>
                </div>
            	<div class="form-group mb-3">
                	<label class="form-label label-text">이메일</label>
                    <input type="text" id="sample6_email" name="foundEmail" class="form-control" placeholder="이메일" readonly>
            	</div>
            	<div class="form-group mb-3">
            		<label class="form-label label-text">참고항목</label>
                    <input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목">
            	</div>
            </div>
            <div class="col-xl-6">
            	<div class="form-group mb-3">
                	<label class="form-label label-text">우편번호</label>
					<div class="row">
                    	<input type="text" id="sample6_postcode" name="foundZip" class="form-control" placeholder="우편번호" style="width:70%;margin-right: 10px;" readonly>
                    	<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm" style="width:20%;">우편번호 찾기</button>
                    </div>
            	</div>
            	<div class="form-group mb-3">
                	<label class="form-label label-text">주소</label>
                    <input type="text" id="sample6_address" name="foundAdres1" class="form-control" placeholder="주소" readonly>
            	</div>
            	<div class="form-group mb-3">
                	<label class="form-label label-text">상세주소</label>
                    <input type="text" id="sample6_detailAddress" class="form-control" name="foundAdres2" placeholder="상세주소">
            	</div>
            </div>
		</div>
        `;
    };

    // 선택된 데이터로 UI를 업데이트하는 함수
    const updateUI = (data) => {
        const [foundNm, foundTelno, foundEmail, foundNo, foundCn] = data.split("|");
        document.getElementById("sample6_no").value = foundNo;
        document.getElementById("sample6_cn").value = foundCn;
        document.getElementById("sample6_name").value = foundNm;
        document.getElementById("sample6_telno").value = foundTelno;
        document.getElementById("sample6_email").value = foundEmail;
    };

    // 초기 빈 UI 표시
    initializeUI();

    selectElement.addEventListener("change", () => {
        console.log("선택된 값:", selectElement.value);
        if (selectElement.value) {
            // 선택된 값에 따라 UI 업데이트
            updateUI(selectElement.value);
        }
    });

	// 버튼 클릭 시 스윗 알럿
	var openBtn = document.querySelector("#openBtn");
	 openBtn.addEventListener("click", (e) => {
			Swal.fire({
				   title: '가맹점 개업을 승인하시겠습니까?',
				   text: '',
				   icon: 'warning',

				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소' // cancel 버튼 텍스트 지정

				}).then(result => {
				   // 만약 Promise리턴을 받으면,
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					   Swal.fire({
						   title: '가맹점 개업이 승인되었습니다.',
						   text: '',
						   icon: 'success',
						   confirmButtonColor: '#3085d6'
					}).then(()=>{
							OpenForm.requestSubmit();
						});
				   }
				});
			 });
});
