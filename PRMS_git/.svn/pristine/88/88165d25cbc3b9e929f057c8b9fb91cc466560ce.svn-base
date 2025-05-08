$(document).ready(function() {

	const contextPath = document.body.dataset.contextPath;

	$('#datepicker').datepicker({
	    autoclose: true,
	    dateFormat: "yy-mm-dd", // 날짜 형식
	    minDate: 0, // 오늘 날짜부터 선택 가능

	    onSelect: function(selectedDate) {
	        var franchiseId = $("#franchiseId").val(); // franchiseId 값 가져오기

	        // 선택된 날짜를 resForm에 설정
	        $('#resBeautyDe').val(selectedDate);

	        // 선택된 미용옵션 값 유지 및 반영
	        var selectedOptionCodeId = $('#optionsize li.option-slot.selected').data('value');
	        var selectedOptionPrice = $('#optionsize li.option-slot.selected').data('price');

	        if (selectedOptionCodeId) {
	            $('#resOption').val(selectedOptionCodeId);
	            $('#resOptionPrice').val(selectedOptionPrice);
	        }

	        // 선택된 슬롯 초기화
	        resetSelectedSlot(); // 날짜가 변경될 때 선택된 시간 슬롯 초기화

	        // AJAX 요청
	        $.ajax({
	            type: "POST",
	            url: `${contextPath}/market/member/beautyRes/date`, // 컨트롤러 URL
	            data: JSON.stringify({
	                resBeautyDe: selectedDate,         // 선택한 날짜
	                franchiseId: franchiseId    // franchiseId
	            }),
	            contentType: "application/json; charset=utf-8",
	            success: function(response) {
	                // 시간 슬롯 업데이트
	                updateTimeSlots(response, selectedDate);
	            },
	            error: function(xhr, status, error) {
	                // 에러 처리
	                console.log("오류 발생:", error);
	            }
	        });
	    }
	});


	function resetSelectedSlot() {
	    // 선택된 슬롯을 초기화하여 선택이 해제되도록 함
	    $('#optionsize li.time-slot').each(function() {
	        $(this).removeClass('selected'); // 선택된 클래스 제거
	        $(this).css({
	            "color": "#ccc", // 비활성화 색상으로 설정
	            "pointer-events": "none", // 클릭 이벤트 비활성화
	            "cursor": "default", // 커서 기본 상태로 변경
	            "background-color": "", // 배경색 초기화
	            "border": "" // 테두리 초기화 (필요한 경우)
	        });
	    });
	}

	resetSelectedSlot(); // 페이지 로드 시 모든 슬롯 비활성화


	function updateTimeSlots(response, selectedDate) {
	    // 서버로부터 받은 JSON 데이터 처리
	    var slots = {
	        "9:00": response.RES_HR1,
	        "10:00": response.RES_HR2,
	        "11:00": response.RES_HR3,
	        "13:00": response.RES_HR4,
	        "14:00": response.RES_HR5,
	        "15:00": response.RES_HR6,
	        "16:00": response.RES_HR7,
	        "17:00": response.RES_HR8,
	        "18:00": response.RES_HR9
	    };

	    var currentDate = new Date();
	    var selectedDateObj = new Date(selectedDate);

	    $('#optionsize li.time-slot').each(function() {
	        var timeSlot = $(this).text().trim();
	        var empNo = slots[timeSlot];
	        var slotHour = parseInt(timeSlot.split(':')[0]);

	        if ((selectedDateObj.toDateString() === currentDate.toDateString() && slotHour <= currentDate.getHours()) || empNo === "0") {
	            // 선택 불가능한 슬롯에 대한 스타일 및 이벤트 처리
	            $(this).attr('data-disabled', 'true').css({
	                "color": "#ccc", // 색상 회색으로 설정
	                "pointer-events": "none", // 클릭 이벤트 비활성화
	                "cursor": "default", // 커서 기본 상태로 변경
	                "background-color": "", // 배경색 초기화 (필요한 경우)
	                "border": "" // 테두리 초기화 (필요한 경우)
	            }).removeClass('selected');
	        } else {
	            // 선택 가능한 슬롯에 대한 스타일 및 이벤트 처리
	            $(this).attr('data-disabled', 'false').css({
	                "color": "", // 기본 색상으로 변경
	                "pointer-events": "auto", // 클릭 이벤트 활성화
	                "cursor": "pointer", // 커서를 포인터로 변경
	                "background-color": "", // 배경색 초기화
	                "border": "" // 테두리 초기화
	            });

	            // 클릭 이벤트 추가
	            $(this).off("click").on("click", function() {
	                if ($(this).attr('data-disabled') === 'false') {
	                    $('#optionsize li.time-slot').not('[data-disabled="true"]').removeClass('selected').css({
	                        "background-color": "", // 비활성화된 슬롯 제외한 슬롯들만 초기화
	                        "color": "", // 기본 색상으로 초기화
	                        "border": "" // 테두리 초기화
	                    });

	                    $(this).addClass('selected').css({
	                        "background-color": "#3e9172", // 선택된 상태의 배경색
	                        "color": "#fff", // 선택된 상태의 글자색
	                        "border": "1px solid #3e9172" // 선택된 상태의 테두리
	                    });

	                    $('#resBeautyTime').val(timeSlot);
	                    $('#empNo').val(empNo);
	                }
	            });
	        }
	    });

	    // 선택 불가능한 슬롯은 초기화 후에도 스타일이 유지되도록 설정
	    $('#optionsize li.time-slot[data-disabled="true"]').each(function() {
	        $(this).css({
	            "color": "#ccc", // 회색으로 고정
	            "pointer-events": "none", // 클릭 이벤트 비활성화
	            "cursor": "default" // 기본 커서로 유지
	        });
	    });
	}


    // 옵션 선택 시 이벤트 처리
    $('#optionsize li.option-slot').on('click', function() {
        $(this).addClass('selected').siblings().removeClass('selected');
        $('#resOption').val($(this).data('value'));
        $('#resOptionPrice').val($(this).data('price'));
        updateFinalPrice();
    });

    // 몸무게 선택 시 이벤트 처리
    $('#optionsize li.weight-slot').on('click', function() {
        $(this).addClass('selected').siblings().removeClass('selected');
        $('#petSe').val($(this).data('value'));
        updateFinalPrice();
    });

    function updateFinalPrice() {
        // 선택된 미용옵션의 가격 가져오기
        var selectedOptionPrice = $('#optionsize li.option-slot.selected').data('price') || 0;

        // 선택된 반려동물 몸무게의 가격 가져오기
        var selectedWeightPrice = $('#optionsize li.weight-slot.selected').data('price') || 0;

        // 두 가격의 합산 계산
        var totalPrice = parseInt(selectedOptionPrice) + parseInt(selectedWeightPrice);

        // 합산된 가격을 화면에 표시
		 if (totalPrice === 0) {
		        $('.final-price').text('총액');
		    } else {
		        $('.final-price').text('총액 ' + totalPrice.toLocaleString() + '원');
		    }
		 // 총액
		 $('#resBeautyPrice').val(totalPrice);

	 }



	        $('#submitBtn').on('click', function() {
            const form1 = document.getElementById("petForm");
            const form2 = document.getElementById("resForm");

            // 폼 요소가 모두 존재하는지 확인
            if (!form1 || !form2) {
                console.error("One or more forms not found");
                return;
            }

            const isForm1Valid = form1.checkValidity();
            const isForm2Valid = form2.checkValidity();

            // 폼에 유효성 검사 스타일을 추가
            if (!isForm1Valid) form1.classList.add('was-validated');
//                 if (!isForm2Valid) form2.classList.add('was-validated');
//                 if (!isForm3Valid) form3.classList.add('was-validated');
            if (!isForm1Valid || !isForm2Valid) {
                Swal.fire({
                    title: "모든 정보를 입력해주세요",
                    showClass: {
                        popup: 'animate__animated animate__fadeInUp animate__faster'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutDown animate__faster'
                    },
 					confirmButtonColor: '#3e9172'
                });

            } else {
                Swal.fire({
                    title: '예약하시겠습니까?',
                    text: '예약 전 주의사항을 꼭 읽어주세요!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3e9172',
                    cancelButtonColor: '#cecece',
                    confirmButtonText: '예약',
                    cancelButtonText: '취소'
                }).then(result => {
                    if (result.isConfirmed) {
                        // 각 폼의 데이터를 가져옵니다.
                        var petFormData = new FormData(form1);
                        var resFormData = new FormData(form2);

                        // 하나의 FormData 객체에 모든 데이터를 병합합니다.
                        var combinedFormData = new FormData();
                        for (var [key, value] of petFormData.entries()) {
                            combinedFormData.append(key, value);
                        }
                        for (var [key, value] of resFormData.entries()) {
                            combinedFormData.append(key, value);
                        }

                        // Ajax를 사용하여 데이터를 전송합니다.
                        fetch(`${contextPath}/market/member/beautyRes`, {
                            method: "POST",
                            body: combinedFormData
                        }).then(response => {
                            // 응답 처리 로직을 여기에 추가합니다.
                            if (response.ok) {
								Swal.fire({
								title: '예약이 완료되었습니다.',
								text:'',
								icon:'success',
								confirmButtonColor: '#3e9172'
								}).then(() => {
                                    let redirectUrl = `${contextPath}/market/member/${memNo}/beautyResDetail`;
                                    window.location.href = redirectUrl;
                                });
                            } else {
                              Swal.fire({
									title: '예약 중 오류가 발생했습니다.',
									text:'',
									icon:'error',
									confirmButtonColor: '#3e9172'
								});
                            }
                        }).catch(error => {
                            Swal.fire({
								title: '예약 중 오류가 발생했습니다.',
								text:'',
								icon:'error',
								confirmButtonColor: '#3e9172'
							});
                        });
                    }
                });
            }
        });


	/*const orderPrice = Number(document.querySelector("#orderPrice").innerHTML); // 주문금액
	let totalPriceTag = document.querySelector("#totalPrice"); // 총금액 태그

	const paymentBtn = document.querySelector("#paymentBtn"); // 결제버튼*/

	/* 결제 함수 */
	/*function request_pay(orderInfo) {

		  let status = null;

		  // 가맹점 식별코드로 Iamport 초기화 (나중에 서버에서 가져오도록 처리)
		  IMP.init('imp40838330');

		  // 상품상세 정보 (추가정보는 request_pay 관련 문서)
		  IMP.request_pay(
		  {
		    pg: orderInfo.pg,
		    pay_method: orderInfo.payMethod,
		    merchant_uid: orderInfo.newOrderId, //
		    name: orderInfo.prodNm,
		    amount: orderInfo.totalPrice,
		  },function (resp) {

			console.log(resp);

		   	if(resp.success) {

				let prodId = document.querySelector("#pro-content").dataset.prodId; // 상품정보
				let cdQy = Number(document.querySelector("#cdQy").innerHTML); // 구매수량

				let paidAmount = resp.paid_amount // 결제가격
				let pgProvider = resp.pg_provider; // PG사 정보
				let payMethod = resp.pay_method; // 페이메소드

				let payCompany = null;

				// 결제수단에 따라 결제사 정보를 구분한다.
				if(pgProvider == "kakaopay") payCompany = "kakaopay";
				else if(pgProvider == "kcp") payCompany = resp.card_name;

				//let memNo = document.querySelector("#memNo").innerHTML; // 구매자 정보
				let mechantUid = resp.merchant_uid; // 주문번호

				// 결제정보를 담은 객체
				let paymentInfo = {
					memNo:memNo,											// 구매자정보
					prodId:prodId, 											// 구매한상품아이디
					cdQy:cdQy, 												// 구매수량
					paidAmount:paidAmount,									// 결제가격
					pgProvider:pgProvider,									// PG사
					payMethod:payMethod,									// 페이메소드
					payCompany:payCompany,									// 결제회사
					mechantUid:mechantUid,									// 주문번호
					orderPrice:orderPrice									// 주문금액
				};

				console.log(paymentInfo);

				// 결제정보가 DB에 정상적으로 업데이트 되었다면, 결제완료페이지로 이동한다.
				let url = `${contextPath}/market/member/singlePurchasing/pay`;
				let method = "POST";
				let headers = {
					'content-type' : "application/json",
					'accept' : "application/json"
				};

				let body = JSON.stringify(paymentInfo);

				FetchUtils.fetchForJSON(url, {
					method:method,
					headers:headers,
					body:body
				}).then(({success}) => {

					// 결제정보가 업데이트 되었다면 결제 성공페이지로 이동한다.
					if(success) {
						location.href=`${contextPath}/market/member/singlePurchasing/success/${mechantUid}`
 					} else{
						Swal.fire({
							title: '결제 실패했습니다!',
							title: '관리자에게 문의해주세요.',
							icon:'warning',
						});
					}
					// 결제정보가 DB에 업데이트되지 않았다면, 환불한다.
					// 현재 페이지를 재접근한다. (주문번호 재생성을 위함)
				});

			} else {
				// 주문번호 중복시 발생
				if(imp_uid == null) {
					Swal.fire({
						title: '결제 실패했습니다(주문번호 중복시 발생!)',
						title: '관리자에게 문의해주세요',
						icon:'warning',
					});
				}
			}
		  }

		 );
	  }


	// 결제하기 버튼을 클릭했을 때
	// 해당 결제수단으로 결제를 진행한다.
	// 결제가 성공했다면, 결제내역, 쿠폰사용정보, 적립금사용정보 등을 서버로 전송한다.
	paymentBtn.addEventListener("click", () => {

		// 결제수단에서 선택된 정보를 가져온다.
		let selctedPay = document.querySelector("input[name=radio-group]:checked");
		let pg = selctedPay.id; // pg사
		let payMethod = selctedPay.dataset.payMethod; // pg사별 결제메소드

		let prodNm = document.querySelector("#prodNm").innerHTML; // 상품명
		let newOrderId = document.querySelector("#newOrderId").innerHTML; // 주문번호
		let totalPrice = Number(totalPriceTag.innerHTML); // 총합계

		// 결제정보를 담은 객체
		let orderInfo = {
			pg : pg,
			payMethod : payMethod,
			prodNm : prodNm,
			newOrderId : newOrderId,
			totalPrice : totalPrice
		};

		// 결제를 진행한다.
		request_pay(orderInfo);
	});*/
});