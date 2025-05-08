document.addEventListener("DOMContentLoaded", () => {

	const contextPath = document.body.dataset.contextPath;
	const refundUrl = `${contextPath}/market/member/commonPurchasing/refund`;

	const orderDtTag =  document.querySelector("#orderDt"); // 주문날짜
	const orderNumberTag = document.querySelector("#orderNumber"); // 주문번호
	const delveryTag = document.querySelector("#deliveryLi"); // 배송지
	const orderProdDtTag = document.querySelector("#orderProdDt"); // 상품리스트
	const orderPaydtTag = document.querySelector("#orderPayDt"); // 결제정보

	const orderDtBtnListTag = document.querySelectorAll(".orderDtBtn"); // 주문상세 버튼 리스트
	var orderDtModal = new bootstrap.Modal(document.getElementById('orderDtModal')); // 모달


	const dlvyStatusListTag = document.querySelectorAll(".text-primary.dlvyStatus"); // 배송상태 리스트
	const btnListTag = document.querySelectorAll(".d-flex.justify-content-end.gap-2.btnList"); // 버튼div리스트
	const delvSelBtnListTag = document.querySelectorAll(".ms-btn-1.delvSelBtn"); // 배송조회 버튼리스트
	let refundBtnListTag = document.querySelectorAll(".ms-btn-1.refundBtn"); // 환불하기 버튼리스트
	let reviewWritingBtnListTag = document.querySelectorAll(".ms-btn-1.reviewWritingBtn"); // 리뷰작성 버튼리스트

	let refundAmountListTag = document.querySelectorAll(".refundAmount"); // 환불금액 리스트 태그


	let cdQyListTag = document.querySelectorAll(".cdQy"); // 상품별 구매수량 리스트
	const prodQyPriceListTag = document.querySelectorAll(".prodQyPrice"); // 구매가격 태그


	const statusListTag = document.querySelectorAll(".nav-link"); // 배송상태 정보리스트 태크
	let dlvySttus = ""; // 배송상태
	let chDlvySttus = document.querySelector("#chDlvySttus").innerHTML; // 변경된 배송상태값


	/* 검색한 배송상태에따라 nav-link 활성화 처리하는 로직 (동기로 처리함)*/
	// 배송검색태그 리스트만큼 반복한다.
	statusListTag.forEach(statusListTag => {

		// 검색한 값과 동일하다면
		if(chDlvySttus == statusListTag.innerHTML) {

			// 현재 활성화되어 있는 배송정보를 가져온다.
			let dlvySttusActive =  document.querySelector('.nav-link.active');
			//	console.log(dlvySttusActive);

			// 해당 배송정보를 비활성화 한다.
			dlvySttusActive.classList.remove("active");

			// 검색한 배송정보를 활성화한다.
			statusListTag.classList.add("active");
		}
	});


	/* 서버에서 받아온 상품금액과 구매수량을 곱하는 로직 (서버사이드 랜더링으로 데이터를 받아와서 이렇게 처리함..)*/
	for(let i = 0; i < prodQyPriceListTag.length; i++) {
		let prodQyPrice = Number(prodQyPriceListTag[i].innerHTML.replace(/,/g, '')) * Number(cdQyListTag[i].innerHTML);
		prodQyPriceListTag[i].innerHTML = prodQyPrice.toLocaleString();
	}


	/* 배송상태에 해당하는 쿼리로 이동한다. */
	const searchStatus = (dlvySttus) => {
		let url = `${contextPath}/market/member/orderList/${dlvySttus}`;
		location.href=url;
	}

	/* 배송상태버튼을 클릭할 시 발생하는 이벤트 */
	statusListTag.forEach(statusListTag => {
		statusListTag.addEventListener("click", (e) => {
			 dlvySttus = e.target.innerHTML;

			 if(dlvySttus == "전체") {
				dlvySttus = "";
			 }

			 searchStatus(dlvySttus);
		});
	});


	/* 결제상세정보를 출력하는 UI */
	const orderPayDtUI = (payment) => {

		console.log(payment);

		return `
			<tr>
				<th>주문금액</th>
				<td class="text-end">${(payment.payAmount + payment.payTotalDiscount).toLocaleString()}원</td>
			</tr>
			<tr>
				<th>적립금할인</th>
				<td class="text-end text-danger">${payment.payMileageTotalDiscount.toLocaleString()}원</td>
			</tr>
			<tr>
				<th>쿠폰할인</th>
				<td class="text-end text-danger">${payment.payCouponDiscount.toLocaleString()}원</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td class="text-end">${payment.payAmount.toLocaleString()}원</td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td class="text-end">${payment.payCompany}</td>
			</tr>
		`;
	}

	/* 상품리스트를 출력하는 UI */
	const prodUI = (orderDt) => {

		let prod = orderDt.prod;
		let prodImage = prod.prodImage;
		let prodSleNm = prod.prodSleNm;
		let orderProdQy = orderDt.orderProdQy;
		let prodSlePc = prod.prodSlePc;

		return `
			<tr>
				<td class="text-center align-middle"><img src="${prodImage}" alt="상품이미지" style="width:50px; height:50px"></td>
				<td class="text-center align-middle">${prodSleNm}</td>
				<td class="text-center align-middle">${(prodSlePc).toLocaleString()}원</td>
				<td class="text-center align-middle">${orderProdQy}개</td>
				<td class="text-center align-middle">${(prodSlePc*orderProdQy).toLocaleString()}원</td>
			</tr>
		`
	}

	/* 주문상세정보를 비동기로 조회한 후, 화면에 출력하는 함수 */
	async function inputOrder(url,options) {
		let resp = await fetch(url,options);
		let jsonData = await resp.json();

		let memOrderDt = jsonData.memOrderDt;

		console.log(memOrderDt);

		// 주문번호를 출력한다.
		orderNumberTag.innerHTML = memOrderDt.orderDtlsId;

		// 주문일을 출력한다.
		orderDtTag.innerHTML = memOrderDt.orderDe;

		// 배송지 정보를 출력한다.
		let deliveryInfo  = memOrderDt.delivery;
		console.log(deliveryInfo);
		let dlvyZip = deliveryInfo.dlvyZip;
		let dlvyAdres1 = deliveryInfo.dlvyAdres1;
		let dlvyAdres2 = deliveryInfo.dlvyAdres2;

		let dlvyText = `(${dlvyZip})${dlvyAdres1} ${dlvyAdres2}`;

		delveryTag.innerHTML = dlvyText;

		// 주문상품 리스트를 출력한다.
		let orderDtList = memOrderDt.orderDtList;
		prodTrTags =  orderDtList.map(prodUI).join('\n');
		orderProdDtTag.innerHTML = prodTrTags;

		// 결제정보를 출력한다.
		let payment = memOrderDt.payment;
		let paymentTrTag = orderPayDtUI(payment);
		orderPaydtTag.innerHTML = paymentTrTag;

		orderDtModal.show();
	}

	/* 주문상세 버튼 이벤트 */
	orderDtBtnListTag.forEach((orderDtBtnTag) => {
		orderDtBtnTag.addEventListener("click", (e) => {

			// 주문번호를 가져온다.
			let orderNumber = {
				orderNumber:e.target.dataset.orderNumber
			};

			console.log(orderNumber);

			// 주문번호에 해당하는 상세정보를 가져온 후, 화면에 출력한다.
			let url = `${contextPath}/market/member/orderDt`;
			let method = "POST";
			let headers = {
				"Content-Type":"application/json",
				accept:"application/json"
			};
			let body = JSON.stringify(orderNumber);

			let options  = {
				method:method,
				headers:headers,
				body:body
			}

			inputOrder(url,options);
		});
	});


	/* 환불처리 함수 */
	async function cancelPay(options) {
		let resp = await fetch(refundUrl,options);
		let jsonData = await resp.json();

		if(jsonData.success){
			Swal.fire({
				title: '정상적으로 주문이 취소되었습니다.',
				icon:'success',
				confirmButtonColor: '#3E9172'
			}).then(result => { // TODO
				if(result.isConfirmed) {
					location.href="";
				}
			});
		} else {
			Swal.fire({
				title:'환불 실패했습니다.',
				text:'관리자에게 문의해주세요',
				icon:'error',
				confirmButtonColor: '#3E9172'
			});
		}
	}


	/* 환불하기 버튼 이벤트 */
	if(refundBtnListTag != null) {
		refundBtnListTag.forEach((refundBtnTag) => {
			refundBtnTag.addEventListener("click", (e) => {

				Swal.fire({
					title:'정말로 환불하시겠습니까?.',
					text:'주문한 모든상품이 환불처리 됩니다.',
					icon:'question',

					showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				    confirmButtonColor: '#3E9172', // confrim 버튼 색깔 지정
				    cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
				    confirmButtonText: '환불', // confirm 버튼 텍스트 지정
				    cancelButtonText: '취소', // cancel 버튼 텍스트 지정

				}).then(result => {
					if(result.isConfirmed) {
						let refundBtn = e.target;
						let btnListElement =  refundBtn.parentElement;
						let orderNumber = btnListElement.dataset.memOrder;
						let refundAmount = Number(btnListElement.dataset.refundAmount);

						let method = "POST";

						let headers = {
							"Content-Type":"application/json",
							"accept": "application/json"
						}

						let body = {
							merchant_uid:orderNumber,
							cancel_request_amount:refundAmount
						}

						let options  = {
							method:method,
							headers:headers,
							body: JSON.stringify(body)
						}

						cancelPay(options);
					}
				});

			})
		});
	}


/* 서버에서 리뷰정보 가져온후 비동기로 버튼정보 오픈 여부 */
	$(document).ready(function() {
	    $.ajax({
	        url: '/prms/market/member/reviewOrder',
	        method: 'get',
	        dataType: 'json',
	        success: function(reviews) {
	            // 리뷰 데이터가 배열인지 확인
	            if (Array.isArray(reviews)) {
	                console.log("reviews 값 ", reviews); // 리뷰 데이터 확인

	                $('.product-item').each(function() {
	                    var currentProdId = $(this).data('prod-id');
	                    var dlvySttus = $(this).data('dlvy-sttus');
	                    var hasReview = false;
						var memberNo = '';

	                    console.log("체크 1.currentProdId:", currentProdId);
	                    console.log("체크 2.dlvySttus:", dlvySttus);
	                    console.log("체크 3.hasReview 초기값:", hasReview);

	                    // 배송 상태가 '배송중' 또는 '배송완료'인 경우에만 처리
	                    if (dlvySttus === '배송중' || dlvySttus === '배송완료') {
	                        // 리뷰 배열을 순회하며 현재 상품의 리뷰 존재 여부 확인
	                        reviews.forEach(function(review) {
									console.log("4. 체크 review.prodId:------", review.prodId);
									console.log("5. currentProdId-----", currentProdId);
	                            if (String(review.prodId) === String(currentProdId)) { //prodId와 currentProdId 문자열이라 바꿔야 조회 가능함
	                                hasReview = true;
									memberNo = review.memNo; // 리뷰에서 memNo 추출
									reviewDelAt = review.reviewDelAt; // 리뷰에서 리뷰 삭제여부 추출
									console.log("체크 review 내역---", review);
	                            }
	                        });

	                        var reviewButtonHtml = '';
	                        if (!hasReview || reviewDelAt === 'Y') {
	                            reviewButtonHtml = '<button class="ms-btn-1 reviewBtn" onclick="location.href=\'/prms/market/member/reviewProdUI?prodId=' + currentProdId + '\'">후기작성</button>';
	                        } else {
	                            reviewButtonHtml = `<a href="/prms/market/member/${memberNo}/memreview" class="ms-btn-1 reviewBtn">리뷰보기</a>`;
	                        }

	                        $(this).find('.review-button').html(reviewButtonHtml);
	                    } else {
	                        $(this).find('.review-button').html('');
	                    }
	                });
	            } else {
	                console.error('배열이아닌 리뷰데이터:', reviews);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 오류:', status, error);
	        }
	    });
	});
});