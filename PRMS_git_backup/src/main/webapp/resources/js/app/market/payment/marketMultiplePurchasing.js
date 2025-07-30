document.addEventListener("DOMContentLoaded", () => {

	const contextPath = document.body.dataset.contextPath;

	const orderPrice = Number(document.querySelector("#orderPrice").innerHTML.replace(/,/g, '')); // 주문금액
	let totalPriceTag = document.querySelector("#totalPrice"); // 총금액 태그

	let totalMileageDiscountTag = document.querySelector('#total-mileage-discount'); // 총적립금할인 합계 태그
	let memMlTag = document.querySelector("#memMl");// 보유적립금 입력태그
	const canMl = Number(document.querySelector("#canMl").innerHTML.replace(/,/g, '')); // 사용가능한 적립금금액

	const discountRadioGroup = document.querySelectorAll("input[name='discount-radio-group']"); // 적립금 선할인 라디오그룹
    const preDiscountPrice = Number(document.querySelector("#pre-discount-price").innerHTML.replace(/,/g, '')); // 선할인금액
	let prevMl = 0; // 이전에 입력한 적립금

	const mlApplyBtn = document.querySelector('#mlApplyBtn'); // 마일리지 적용버튼

	const myCouponList = document.querySelector("#my-coupon-list"); // 쿠폰리스트 태그
	let totalDiscountCouponPrice = document.querySelector("#total-discount-coupon-price"); // 쿠폰할인정보 태그
	let prevCounponDiscountPrice = 0; // 이전에 선택한 쿠폰의 할인금액

	const paymentBtn = document.querySelector("#paymentBtn"); // 결제버튼


	var myModal = new bootstrap.Modal(document.getElementById('addressListModal')); // 모달
	const changeAddressBtn = document.querySelector("#changeAddressBtn"); // 배송지 변경버튼
	const addInfo = document.querySelector("#addInfo");

	const sample6_postcode = document.querySelector("#sample6_postcode");
	const sample6_address = document.querySelector("#sample6_address");
	const sample6_detailAddress = document.querySelector("#sample6_detailAddress");


	let prodIdListTag = document.querySelectorAll(".prodId.pay"); // 상품아이디 리스트
	let cdQyListTag = document.querySelectorAll(".cdQy"); // 상품별 구매수량 리스트

	const prodQyPriceListTag = document.querySelectorAll(".new-price.prodQyPrice");


	/* 서버에서 받아온 상품금액과 구매수량을 곱하는 로직 (서버사이드 랜더링으로 데이터를 받아와서 이렇게 처리함..)*/
	for(let i = 0; i < prodQyPriceListTag.length; i++) {
		let prodQyPrice = Number(prodQyPriceListTag[i].innerHTML.replace(/,/g, '')) * Number(cdQyListTag[i].innerHTML);
		prodQyPriceListTag[i].innerHTML = prodQyPrice.toLocaleString();
	}


	/* 적립금 입력태그 콤마적용 이벤트 */
	memMlTag.addEventListener("keyup", (e) => {
		let value = e.target.value;
		value = Number(value.replaceAll(',', ''));
		if(isNaN(value)) {
		  memMlTag.value = 0;
		} else {
		   const formatValue = value.toLocaleString('ko-KR');
		   memMlTag.value = formatValue;
		}
	});


	/* 적립금 선할인을 수행하는 이벤트 */
	discountRadioGroup.forEach((discountRadio) => {
		discountRadio.addEventListener("change", (e) => {
			let current = e.currentTarget;

			// 총금액을 가져온다.
			let currentTotalPrice =  Number((totalPriceTag.innerHTML).replace(/,/g, ''));

			// 총적립금할인 합계 금액을 가져온다.
			let totalMileageDiscount = Number(totalMileageDiscountTag.innerHTML.replace(/,/g, ''));

			if(current.checked) {
				if(current.id == "pre-discount") { // 선적립금 할인이 선택될 때

					// 최소주문금액(1000원)을 충족시키지 못할경우
					if(currentTotalPrice - preDiscountPrice < 1000) {

						// 구매적립 라디오버튼을 선택한다.
						let afterDiscountRadioTag = document.querySelector("#after-discount");
						afterDiscountRadioTag.checked = true;

						// 오류 메시지를 출력한다.
						Swal.fire({
							title: '최소주문금액(1000원)을 맞춰주세요.',
							icon:'warning',
							confirmButtonColor: '#3E9172'
						});

						return;
					}

					// 총적립금할인 합계 금액에, 선적립금 할인 금액을 더한다.
					totalMileageDiscount += preDiscountPrice;

					// 총금액에서 선적립금 할인금액을 뺀다.
					currentTotalPrice -= preDiscountPrice;

				} else if(current.id == "after-discount") { // 구매적립이 선택될 때
					// 총적립금할인 합계 금액에, 선적립금 할인 금액을 뺀다.
					totalMileageDiscount -= preDiscountPrice;

					// 총금액에서 선적립금 할인금액을 더한다.
					currentTotalPrice += preDiscountPrice;
				}

				// 할인금액을 업데이트한다.
				totalMileageDiscountTag.innerHTML = totalMileageDiscount.toLocaleString();
				totalPriceTag.innerHTML = currentTotalPrice.toLocaleString();
			}
		});
	});

	/* 보유적립금 태그의 포커스를 잃을때 보유적립금을 사용하는 이벤트 */
	memMlTag.addEventListener("blur", () => {
		// 입력값을 가져온다.
		let inputMl = Number(memMlTag.value.replace(/,/g, ''));

		// 입력값이 사용가능한 적립금보다 많다면
		if(inputMl > canMl){
			// 입력값을 지운다.
			memMlTag.value = "";

			// 오류 메시지를 출력한다.
			Swal.fire({
				title: '적립가능한 금액을 초과했습니다.',
				text: '다시 입력해주세요.',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			});
			return;
		}

		// 정상적인 입력값이라면
		// 총금액을 가져온다.
		let currentTotalPrice =  Number(totalPriceTag.innerHTML.replace(/,/g, ''));

		// 기존 적립금 할인금액과 차액을 구한다.
		let disCountMl = inputMl - prevMl;


		// 총금액에서 적립금 할인금액을 제외했을 때 1000보다 작다면
		if(currentTotalPrice - disCountMl < 1000){

			// 적립금입력 태그에 이전 적립금으로 업데이트 한다.
			if(prevMl == 0) {
				memMlTag.value = "";
			} else {
				memMlTag.value = prevMl.toString();
			}

			// 오류 메시지를 출력한다.
			Swal.fire({
				title: '최소주문금액(1000원)을 맞춰주세요.',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			});
			return;
		}

		// 적립금할인 정보를 업데이트한다.
		let prevToatlMileageDiscountPrice = Number(totalMileageDiscountTag.innerHTML.replace(/,/g, ''));
		totalMileageDiscountTag.innerHTML = (inputMl - prevMl + prevToatlMileageDiscountPrice).toLocaleString();

		// 총금액을 업데이트 한다.
		currentTotalPrice -= disCountMl;
		totalPriceTag.innerHTML = currentTotalPrice.toLocaleString();

		// 입력값을 저장한다.
		prevMl = inputMl;
	});

	/* 적용버튼을 클릭했을시 보유적립금이 적용되는 이벤트 */
	mlApplyBtn.addEventListener('click', () => {
		// 입력값을 가져온다.
		let inputMl = Number(memMlTag.value.replace(/,/g, ''));

		// 입력값이 사용가능한 적립금보다 많다면
		if(inputMl > canMl){
			// 입력값을 지운다.
			memMlTag.value = "";

			// 오류 메시지를 출력한다.
			Swal.fire({
				title: '적립가능한 금액을 초과했습니다.',
				text: '다시 입력해주세요.',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			});
			return;
		}

		// 정상적인 입력값이라면
		// 총금액을 가져온다.
		let currentTotalPrice =  Number(totalPriceTag.innerHTML.replace(/,/g, ''));

		// 기존 적립금 할인금액과 차액을 구한다.
		let disCountMl = inputMl - prevMl;


		// 총금액에서 적립금 할인금액을 제외했을 때 1000보다 작다면
		if(currentTotalPrice - disCountMl < 1000){

			// 적립금입력 태그에 이전 적립금으로 업데이트 한다.
			if(prevMl == 0) {
				memMlTag.value = "";
			} else {
				memMlTag.value = prevMl.toString();
			}

			// 오류 메시지를 출력한다.
			Swal.fire({
				title: '최소주문금액(1000원)을 맞춰주세요.',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			});
			return;
		}

		// 적립금할인 정보를 업데이트한다.
		let prevToatlMileageDiscountPrice = Number(totalMileageDiscountTag.innerHTML.replace(/,/g, ''));
		totalMileageDiscountTag.innerHTML = (inputMl - prevMl + prevToatlMileageDiscountPrice).toLocaleString();

		// 총금액을 업데이트 한다.
		currentTotalPrice -= disCountMl;
		totalPriceTag.innerHTML = currentTotalPrice.toLocaleString();

		// 입력값을 저장한다.
		prevMl = inputMl;
	});



		/* 보유쿠폰을 사용하는 이벤트 */
		/* 쿠폰 셀렉트 이벤트 */
		myCouponList.addEventListener("change", function() {

			// 총금액을 가져온다.
			let currentTotalPrice =  Number(totalPriceTag.innerHTML.replace(/,/g, ''));

			// 이전에 선택한 쿠폰의 할인정보를 제외한다.
			currentTotalPrice += prevCounponDiscountPrice;

			// 선택한 쿠폰의 value를 가져온다.
//			let selectedValue = this.options[this.selectedIndex].value;
			let selectedValue = this.options[this.selectedIndex].id;

			// value가 없다면
			if(selectedValue == null || selectedValue == '' || selectedValue.trim() == '') {

				// 쿠폰할인정보를 없앤다.
				totalDiscountCouponPrice.innerHTML = "0";

				// 이전 쿠폰할인 정보를 제외한 값을 업데이트한다.
				totalPriceTag.innerHTML = currentTotalPrice;

				// 이전 쿠폰 할인금액을 0원으로 변경한다.
				prevCounponDiscountPrice = 0;

				return;
			}

			let newCounponDiscountPrice = 0; // 새로운 쿠폰할인금액

			// value 값에 따라, 쿠폰 할인금액을 구한다.
			if(selectedValue.includes("%")){ // % 할인일 경우

				// 주문금액을 기준으로 할인금액을 구한다.
				let percentNumber = Number(selectedValue.replace("%",""));
				newCounponDiscountPrice = Math.floor(orderPrice * percentNumber / 100);

				if(currentTotalPrice - newCounponDiscountPrice < 1000){

					// 이전 쿠폰할인 정보를 제외한 값을 업데이트한다.
					totalPriceTag.innerHTML = currentTotalPrice;

					// 이전 쿠폰 할인금액을 0원으로 변경한다.
					prevCounponDiscountPrice = 0;

					// 쿠폰선택정보를 변경한다.
					this.options[0].selected = true;

					Swal.fire({
						title: '최소주문금액(1000원)을 맞춰주세요.',
						icon:'warning',
						confirmButtonColor: '#3E9172'
					});

					return;
				}


			} else if(selectedValue.includes("원")){
				newCounponDiscountPrice = Number(selectedValue.replace("원",""));

				//  최소주문금액이 충족되지 않을 경우
				if(currentTotalPrice - newCounponDiscountPrice < 1000) {

					// 이전 쿠폰할인 정보를 제외한 값을 업데이트한다.
					totalPriceTag.innerHTML = currentTotalPrice.toLocaleString();

					// 이전 쿠폰 할인금액을 0원으로 변경한다.
					prevCounponDiscountPrice = 0;

					// 쿠폰선택정보를 변경한다.
					this.options[0].selected = true;

					Swal.fire({
						title: '최소주문금액(1,000원)을 맞춰주세요.',
						icon:'warning',
						confirmButtonColor: '#3E9172'
					});

					return;
				}
			}

			// 총금액을 업데이트 한다.
			currentTotalPrice -= newCounponDiscountPrice;
			totalPriceTag.innerHTML = currentTotalPrice.toLocaleString();

			// 쿠폰할인금액을 업데이트 한다.
			totalDiscountCouponPrice.innerHTML = newCounponDiscountPrice.toLocaleString();

			// 쿠폰사용 정보를 저장한다.
			prevCounponDiscountPrice = newCounponDiscountPrice;
		});


	/* 배송지 리스트를 출력하는 함수 */
	const addressUI = (address) => {

		return `
			<tr>
				<td>${address.memZip}</td>
				<td>${address.memAdres1}</td>
				<td>${address.memAdres2}</td>
				<td><input type="radio" name="address-group" class="address-group"></td>
			</tr>
		`
	};


	// 특정 배송지를 선택하면, 해당 배송지 정보를 입력창에 저장한다.
	changeAddressBtn.addEventListener("click", () => {

		let addListBody = document.querySelector("#add-list-body"); // 택배UI

		// 1. 모달에 회원의 배송지 리스트를 출력한다.
		// 1.1. 회원번호를 가져온다.
		// 1.2. 해당 회원의 배송지리스트를 가져온다.
		let memNoTag = document.querySelector("#memNo");
		let memNo = memNoTag.innerHTML;

		let url = `${contextPath}/market/member/commonPurchasing/addressList`;
		let method = "POST";

		let headers = {
			'accept' : "application/json",
			'content-Type': 'application/json'
		};

		let body = JSON.stringify({
			memNo:memNo
		});

		FetchUtils.fetchForJSON(url, {
			method:method,
			headers:headers,
			body:body
		}).then(({addressList}) => {

			let trTags = null;
			if(addressList && addressList.length > 0){
				trTags = addressList.map(addressUI).join("\n");
			} else {
				trTags = `
					<tr>
						<td colspan="">등록한 주소가 없습니다.</td>
					</tr>
				`
			}

			addListBody.innerHTML = trTags;
		 });


		// 2. 모달을 띄운다.
        myModal.show();
	});

	/* 변경하기 버튼 클릭 이벤트 */
	let addChangeBtn = document.querySelector("#add-change-btn");
	addChangeBtn.addEventListener("click", () => {

		// 선택한 주소 정보를 가져온다.
		let selectAddress = document.querySelector(".address-group:checked");

		// 선택한 주소가 없다면 오류메시지를 호출한다.
		if(!selectAddress) {
			Swal.fire({
				title: '주소를 선택해주세요.',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			});
		}


		// 주소정보를 변경한다.
		let chZip = selectAddress.parentElement.parentElement.children[0].innerHTML;
		let chAdres1 = selectAddress.parentElement.parentElement.children[1].innerHTML;
		let chAdres2 = selectAddress.parentElement.parentElement.children[2].innerHTML;

		sample6_postcode.value = chZip;
		sample6_address.value = chAdres1;
		sample6_detailAddress.value = chAdres2;

		// 배지를 없앤다.
		addInfo.innerHTML = "";


		// 모달창을 닫는다.
        myModal.hide();
	});



	/* 결제 함수 */
	function request_pay(orderInfo) {

		  let status = null;

		  // 가맹점 식별코드로 Iamport 초기화 (나중에 서버에서 가져오도록 처리)
		  IMP.init('imp.code');

		  // 상품상세 정보 (추가정보는 request_pay 관련 문서)
		  IMP.request_pay(
		  {
		    pg: orderInfo.pg,
		    pay_method: orderInfo.payMethod,
		    merchant_uid: orderInfo.newOrderId, //
//		    merchant_uid: `OR-${crypto.randomUUID()}`, // 테스트 주문번호
//		    merchant_uid: `OR3`, // 테스트 주문번호
		    name: orderInfo.prodNm,
		    amount: orderInfo.totalPrice,
//		    amount: 100, // 테스트 가격
		  },function (resp) {

			console.log(resp);

		   	if(resp.success) {

				// 상품아이디 리스트를 가져온다.
				let prodIdList = [];
				prodIdListTag.forEach(prodId => prodIdList.push(prodId.value));

				// 상품별 구매수량을 가져온다.
				let cdQyList = [];
				cdQyListTag.forEach(cdQy => cdQyList.push(Number(cdQy.innerHTML)));


				// 선적립 할인여부 정보를 가져온다.
				let preDiscountMoney = 0;
				let addSavings = Number(document.querySelector("#pre-discount-price").innerHTML.replace(/,/g, '')); // 구매적립금
				let preDiscountChk = document.querySelector("input[name='discount-radio-group']:checked").id
				// 선적립을 받으면, 누적적립금을 0원으로 만든다.
				if(preDiscountChk == "pre-discount") {
					preDiscountMoney = preDiscountPrice;
					addSavings = 0;
				}

				let memMlMoney = Number(memMlTag.value.replace(/,/g, '')); // 사용한 보유적립금

				let couponId = myCouponList.options[myCouponList.selectedIndex].value; // 쿠폰아이디
				let couponDiscountPrice = Number(totalDiscountCouponPrice.innerHTML.replace(/,/g, '')); // 쿠폰할인금액

				let totalMileageDiscountPrice = Number(totalMileageDiscountTag.innerHTML.replace(/,/g, '')); // 총적립금할인금액


				let paidAmount = resp.paid_amount // 결제가격
				let pgProvider = resp.pg_provider; // PG사 정보
				let payMethod = resp.pay_method; // 페이메소드

				let payCompany = null;

				// 결제수단에 따라 결제사 정보를 구분한다.
				if(pgProvider == "kakaopay") payCompany = "kakaopay";
				else if(pgProvider == "kcp") payCompany = resp.card_name;

				let memNo = document.querySelector("#memNo").innerHTML; // 구매자 정보
				let mechantUid = resp.merchant_uid; // 주문번호

				// 배송지 정보
				let zip = sample6_postcode.value;
				let address = sample6_address.value;
				let detailAddress = sample6_detailAddress.value;


				// 결제정보를 담은 객체
				let multiplePaymentInfo = {
					memNo:memNo,											// 구매자정보
					prodIdList:prodIdList, 											// 구매한상품아이디
					cdQyList:cdQyList, 												// 구매수량
					preDiscountMoney:preDiscountMoney, 						// 선할인 금액
					addSavings:addSavings,									// 구매적립 금액
					memMlMoney:memMlMoney,									// 보유적립금 사용금액
					totalMileageDiscountPrice:totalMileageDiscountPrice, 	// 총적립금할인금액
					couponId:couponId,										// 쿠폰아이디
					couponDiscountPrice:couponDiscountPrice,				// 쿠폰할인금액
					paidAmount:paidAmount,									// 결제가격
					pgProvider:pgProvider,									// PG사
					payMethod:payMethod,									// 페이메소드
					payCompany:payCompany,									// 결제회사
					mechantUid:mechantUid,									// 주문번호
					orderPrice:orderPrice,									// 주문금액
					zip:zip,												// 우편번호
					address:address,										// 주소
					detailAddress:detailAddress								// 상세배송지
				};

				console.log(multiplePaymentInfo);

				// 결제정보가 DB에 정상적으로 업데이트 되었다면, 결제완료페이지로 이동한다.
				let url = `${contextPath}/market/member/multiplePurchasing/pay`;
				let method = "POST";
				let headers = {
					'content-type' : "application/json",
					'accept' : "application/json"
				};

				let body = JSON.stringify(multiplePaymentInfo);

				FetchUtils.fetchForJSON(url, {
					method:method,
					headers:headers,
					body:body
				}).then(({success}) => {

					// 결제정보가 업데이트 되었다면 결제 성공페이지로 이동한다.
					if(success) {
						location.href=`${contextPath}/market/member/multiplePurchasing/success/${mechantUid}`
 					} else{
						Swal.fire({
							title: '결제 실패했습니다!',
							title: '관리자에게 문의해주세요.',
							icon:'warning',
							confirmButtonColor: '#3E9172'
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
						confirmButtonColor: '#3E9172'
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


		// 상품명을 지정한다.
		let prodNmList = document.querySelectorAll(".prodNm"); // 상품명 리스트
		let prodNm = prodNmList[0].innerHTML;
		let prodCount = prodNmList.length;
		prodNm += prodCount > 1 ? ` 외 ${prodCount}건` : "";


		let newOrderId = document.querySelector("#newOrderId").innerHTML; // 주문번호
		let totalPrice = Number(totalPriceTag.innerHTML.replace(/,/g, '')); // 총합계

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
	});

});