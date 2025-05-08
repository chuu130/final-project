document.addEventListener("DOMContentLoaded", () => {

	const contextPath = document.body.dataset.contextPath;
	const orderListTag = document.querySelector("#orderList"); // 주문리스트를 담을 태그
	const statusListTag = document.querySelectorAll(".nav-link"); // 배송상태 검색조건 리스트 태그
	const searchDataTag = document.querySelector("#searchData"); // 상품/회원검색 태그

	const pagingArea = document.querySelector(".Bpaging-area"); // 페이징 위치

	let searchData = ""; // 검색데이터
	let dlvySttus = "입금확인"; // 배송상태
	let page = 1; // 현재 페이지

	// 페이징 처리를위한 객체
	let searchDataVO = {
		searchData:searchData,
		dlvySttus:dlvySttus,
		page:page
	};

	var orderDtModal = new bootstrap.Modal(document.getElementById('orderDtModal')); // 주문상세 모달
	const orderDtTag =  document.querySelector("#orderDt"); // 주문날짜
	const orderNumberTag = document.querySelector("#orderNumber"); // 주문번호
	const delveryTag = document.querySelector("#deliveryLi"); // 배송지
	const orderProdDtTag = document.querySelector("#orderProdDt"); // 상품리스트
	const orderPaydtTag = document.querySelector("#orderPayDt"); // 결제정보

	const memNmTag = document.querySelector("#memNm"); // 회원이름 태그
	const memTelnoTag = document.querySelector("#memTelno"); // 전화번호 태그

	const sendBtn = document.querySelector("#sendBtn"); // 발송버튼


//	const totalCountTag = document.querySelector("#totalCount"); // 총건수 표시태그

	const waitOrderTag = document.querySelector("#waitOrder");
	const deliveringTag = document.querySelector("#delivering");
	const successDeliveryTag = document.querySelector("#successDelivery");
	const cancelOrderTag = document.querySelector("#cancelOrder");


	/* 오늘 온라인 주문현황을 반영하는 함수 */
	const applyTodayOrderRequest = async () => {
		let jsonData = await axios.get(`${contextPath}/main/master/todayOnlineRequest`)
		console.log(jsonData);

		let totalOnlineRequest = jsonData.data.todayOnlineRequest;

		let waitOrderStatus = false;

		totalOnlineRequest.forEach((onlineRequest) => {

			let dlvySttus = onlineRequest.DLVY_STTUS;
			let count = `${onlineRequest.COUNT}건`;

			if(dlvySttus == "입금확인") {
				waitOrderTag.innerHTML = count;
				waitOrderStatus = true;
			} else if (dlvySttus == "배송중") {
				deliveringTag.innerHTML = count;
			} else if(dlvySttus == "배송완료") {
				successDeliveryTag.innerHTML = count;
			} else if(dlvySttus == "취소완료") {
				cancelOrderTag.innerHTML = count;
			}
		});

		// map을 통해 뽑아온 데이터 중,
		// 1개남은 데이터를 처리할 시, 입금확인 데이터를 조회하지 않아서 건수가 변경되지 않은문제 해결
		if(!waitOrderStatus) {
			waitOrderTag.innerHTML = `0건`;
		}
	}

	// 페이지 로딩시 오늘 온라인 주문현황을 반영한다.
	applyTodayOrderRequest();


	/* 오늘날짜를 구하는 함수 (format : 2024-09-04) */
	const getTotdayYearMonthDay = () => {

		let today = new Date();

		let year = today.getFullYear();
		let month = today.getMonth();
		let date = today.getDate();

		if(month < 10) month = `0${month + 1}`;
		if(date < 10) date = `0${date}`;

		return `${year}-${month}-${date}`;
	}


	/* StringBuilder 기능을 제공하는 클래스 */
	function StringBuilder(value) {
	    this.strings = new Array();
	    this.append(value);
	}

	StringBuilder.prototype.append = function (value) {
	    if (value) {
	        this.strings.push(value);
	    }
	}

	StringBuilder.prototype.clear = function () {
	    this.strings.length = 0;
	}

	StringBuilder.prototype.toString = function () {
	    return this.strings.join("");
	}


	/* 결제상세정보를 출력하는 UI */
	const orderPayDtUI = (payment) => {

		return `
			<tr>
				<th>주문금액</th>
				<td class="text-end align-middle">${(payment.payAmount + payment.payTotalDiscount).toLocaleString()}원</td>
			</tr>
			<tr>
				<th>적립금 할인</th>
				<td class="text-end align-middle text-danger">${payment.payMileageTotalDiscount.toLocaleString()}원</td>
			</tr>
			<tr>
				<th>쿠폰할인</th>
				<td class="text-end align-middle text-danger">${payment.payCouponDiscount.toLocaleString()}원</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td class="text-end align-middle">${payment.payAmount.toLocaleString()}원</td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td class="text-end align-middle">${payment.payCompany}</td>
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
				<td class="text-center align-middle"><img src="${prodImage}" alt="상품이미지" style="width:100px; height:100px"></td>
				<td class="text-center align-middle">${prodSleNm}</td>
				<td class="text-center align-middle">${orderProdQy}개</td>
				<td class="text-end align-middle">${(prodSlePc * orderProdQy).toLocaleString()}원</td>
			</tr>
		`;
	}

	/* 마켓회원의 주문리스트 데이터를 tr태그로 생성하는 함수 */
	const makeOrderListTrTags = (memOrderList) => {

		let orderDtList = memOrderList.orderDtList;
		let member = memOrderList.member;
		let delivery = memOrderList.delivery;
		let payment = memOrderList.payment;


		let sb = new StringBuilder();

//		console.log("주문날짜 : ", memOrderList.orderDe);
//		console.log("오늘날짜 : ", getTotdayYearMonthDay());

		// 오늘날짜 백그라운드 지정
		// class : 해당 주문정보 클릭시 주문서 모달을 출력하기위해 지정함.
		if(memOrderList.orderDe == getTotdayYearMonthDay()) {
			sb.append(`<tr class='orderTrList' style="cursor:pointer; background-color:aliceblue;" data-mem-order-number=${memOrderList.orderDtlsId}>`);
		} else {
			sb.append(`<tr class='orderTrList' style="cursor:pointer;" data-mem-order-number=${memOrderList.orderDtlsId}>`);
		}
		sb.append(`<td class="text-center align-middle order-border">
					<button style="border:none; border-bottom:1px solid black; background-color:transparent" class="memOrderNumber">${memOrderList.orderDtlsId}</button>
				   </td>`);
		sb.append(`<td class="align-middle order-border">`);
		orderDtList.forEach((orderDt) => {
			let prod = orderDt.prod;
			sb.append(`<div class="d-flex mb-1" style="align-items: center;"><img src="${prod.prodImage}" alt="상품이미지" width="50px" height="50px" />`)
			sb.append(`<p class="px-2 mb-0 align-middle">${prod.prodSleNm}(${orderDt.orderProdQy}개)</p></div>`);
		});
		sb.append(`</td>`);
		sb.append(`<td class="text-center align-middle order-border">${payment.payAmountComma}원</td>`);
		sb.append(`<td class="text-center align-middle order-border" data-mem-no="${member.memNo}">${member.memId}</td>`);
		sb.append(`<td class="text-center align-middle order-border">${memOrderList.orderDe}</td>`);
		if(delivery.dlvySttus == "입금확인") {
			sb.append(`<td class="text-center align-middle text-primary" style="font-weight: 700;">${delivery.dlvySttus}</td>`);
		} else if(delivery.dlvySttus == "배송중" || delivery.dlvySttus == "배송완료") {
			sb.append(`<td class="text-center align-middle text-success" style="font-weight: 700;">${delivery.dlvySttus}</td>`);
		} else {
			sb.append(`<td class="text-center align-middle text-danger" style="font-weight: 700;">${delivery.dlvySttus}</td>`);
		}

		sb.append("</tr>");

		return sb.toString();
	}

	/* 주문상세를 조회하는 함수 */
	const showMemOrderDt = async (memOrderNo) => {

		let url = `${contextPath}/main/master/marketOrder/memOrderDt`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};

//		let body = JSON.stringify(memOrderNo);

		let options = {
			method:method,
			headers:headers,
			body:memOrderNo
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();

//		console.log(jsonData);

		let memOrderDt = jsonData.memOrderDt;
		console.log(memOrderDt);

		// 주문번호를 출력한다.
		orderNumberTag.innerHTML = memOrderDt.orderDtlsId;

		// 주문일을 출력한다.
		orderDtTag.innerHTML = memOrderDt.orderDe;

		// 회원명을 출력한다.
		memNmTag.innerHTML = memOrderDt.member.memNm;

		// 전화번호를 출력한다.
		memTelnoTag.innerHTML = memOrderDt.member.memTelno;


		// 배송지 정보를 출력한다.
		let deliveryInfo  = memOrderDt.delivery
		let dlvyZip = deliveryInfo.dlvyZip
		let dlvyAdres1 = deliveryInfo.dlvyAdres1;
		let dlvyAdres2 = deliveryInfo.dlvyAdres2;

		let dlvyText = `(${dlvyZip})${dlvyAdres1} ${dlvyAdres2}`;

		delveryTag.innerHTML = dlvyText;

		// 주문상품 리스트를 출력한다.
		let orderDtList = memOrderDt.orderDtList;
		let prodTrTags =  orderDtList.map(prodUI).join('\n');
		orderProdDtTag.innerHTML = prodTrTags;

		// 결제정보를 출력한다.
		let payment = memOrderDt.payment;
		let paymentTrTag = orderPayDtUI(payment);
		orderPaydtTag.innerHTML = paymentTrTag;

		// 배송상태가 입금확인 이라면 발송버튼을 오픈한다.
		let dlvySttus = memOrderDt.delivery.dlvySttus;
		if(dlvySttus == "입금확인") {
			sendBtn.style.display = "block";
		} else {
			sendBtn.style.display = "none";
		}

		// 주문상세 모달을 오픈한다.
		orderDtModal.show();
	}


	/* 마켓회원의 주문리스트를 가져오는 함수 */
	const showOrderList = async (searchDataVO) => {

		let url = `${contextPath}/main/master/marketOrder/list`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};
		let body = JSON.stringify(searchDataVO);

		let options = {
			method:method,
			headers:headers,
			body:body
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();
		let memberOrderList = jsonData.memberOrderList;

//		console.log(allMemberOrderList);
		console.log(jsonData);

		// UI를 뽑는다.
		let trTags = memberOrderList.map(makeOrderListTrTags).join("\n");

//		console.log(trTags);

		// UI를 표시한다.
		orderListTag.innerHTML = trTags;

		// 페이지 UI를 표시한다.
		pagingArea.innerHTML= jsonData.pagingHTML;


		// 총건수를 표시한다.
//		totalCountTag.innerHTML = jsonData.totalCount;

		// 표시한 데이터 중, 주문번호를 기준으로 이벤트를 지정한다. (주문서 표시)
		let memOrderListTag = document.querySelectorAll(".memOrderNumber");
		memOrderListTag.forEach((memOrderTag) => {
			memOrderTag.addEventListener("click", (e) => {
				let memOrderNo = e.target.innerHTML;

				// 주문번호를 기준으로 회원의 주문상세정보를 가져온 후, 모달로 표시한다.
				showMemOrderDt(memOrderNo);
			});
		});

		// 표시한 데이터 중, 레코드를 기준으로 이벤트를 지정한다. (주문서 표시)
		let orderTrListTag = document.querySelectorAll(".orderTrList");
		orderTrListTag.forEach((orderTrTag) => {
			orderTrTag.addEventListener("click", (e) => {

				let currTarget = e.target;
				const trTag = document.createElement('tr');
//				console.log(trTag.tagName);
				while(trTag.tagName != currTarget.tagName){
//					console.log(currTarget.tagName);
					currTarget = currTarget.parentElement;
				}

				// tr태그에 저장되어있는 주문번호를 가져온다.
				let	memOrderNo = currTarget.dataset.memOrderNumber;

				// 주문번호를 기준으로 회원의 주문상세정보를 가져온 후, 모달로 표시한다.
				showMemOrderDt(memOrderNo);
			});
		});
	}

	/* 모든 마켓회원의 주문리스트를 가져오는 함수 */
	const showAllOrderList = () => {

		searchDataVO['searchData'] = "";
		searchDataVO['dlvySttus'] = "입금확인";
		searchDataVO['page'] = 1;

		// 조건이 없는 주문정보를 화면에 보여준다.
		showOrderList(searchDataVO);
	}


	/* 페이지 클릭시 발생하는 이벤트 */
	pagingArea.addEventListener("click", (e) => {
		// 클릭한 페이지 정보를 저장한다.
		page = e.target.dataset.page;
//		console.log(page);

		// 활성화 되어있는 배송정보를 가져온다.
		dlvySttus = document.querySelector('.nav-link.active').innerHTML;
//		console.log(dlvySttus);

		// 검색데이터를 가져온다.
		searchData = searchDataTag.value;

//		console.log(searchData);

		// 검색조건을 저장한다.
		searchDataVO['searchData'] = searchData;
		searchDataVO['dlvySttus'] = dlvySttus;
		searchDataVO['page'] = page;

		// 클릭한 페이지에 해당하는 주문정보를 화면에 보여준다.
		showOrderList(searchDataVO);
	});


	/* 배송상태에 변경시 검색 이벤트 */
	statusListTag.forEach((statusTag) => {
		statusTag.addEventListener("click", (e) => {

			// 클릭한 배송정보를 가져온다.
			dlvySttus = e.target.innerHTML;

			// 검색조건을 가져온다.
			searchData = searchDataTag.value;

			// 페이지 정보를 1로 셋팅한다.
			page = 1;

			searchDataVO['searchData'] = searchData;
			searchDataVO['dlvySttus'] = dlvySttus;
			searchDataVO['page'] = page;

			// 클릭한 주문정보를 화면에 보여준다.
			showOrderList(searchDataVO);
		});
	});


	/* 검색태그 이용시 발생하는 이벤트 */
	searchDataTag.addEventListener("keyup", (e) => {

		// 검색창에서 엔터키를 눌렀을 때
		if(e.keyCode == 13) {

			// 검색정보를 가져온다.
			searchData = e.target.value;

			// console.log(searchData);

//			// 공백입력 시 반환한다.
//			if(searchData.trim() == ""){
//				return;
//			}

			// 배송정보 값을 기본값으로 변경한다.
			dlvySttus = "입금확인";

			// 페이지 정보를 1로 셋팅한다.
			page = 1;

			searchDataVO['searchData'] = searchData;
			searchDataVO['dlvySttus'] = dlvySttus;
			searchDataVO['page'] = page;

			showOrderList(searchDataVO);

			// 화면의 배송상태를 입금확인으로 변경한다.
			// 현재 활성화되어 있는 배송정보를 가져온다.
		 	let dlvySttusActive =  document.querySelector('.nav-link.active');

			// 해당 배송정보를 비활성화 한다.
			dlvySttusActive.classList.remove("active");

			// 입금확인 배송정보를 활성화한다.
			let allDlvyTag = document.querySelector(".nav-link");
			allDlvyTag.classList.add("active");
		}
	});


	/* 발송처리를 하는 함수 */
	const sendDlvySttus = async (memOrderNo) => {

		let url = `${contextPath}/main/master/marketOrder/sendDlvySttus`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};

		let options = {
			method:method,
			headers:headers,
			body:memOrderNo
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();

//		console.log(jsonData);

		// 발송성공했다면
		if(jsonData.success) {
			// UI에 반영한다. (해당 페이지 다시호출)
			dlvySttus = document.querySelector('.nav-link.active').innerHTML;

			searchData = searchDataTag.value;

			searchDataVO['searchData'] = searchData;
			searchDataVO['dlvySttus'] = dlvySttus;
			searchDataVO['page'] = page;

			showOrderList(searchDataVO);

			// 오늘 온라인 주문정보에 반영한다.
			applyTodayOrderRequest();

			// 성공 알림을 띄운다.
			Swal.fire({
				title: '성공',
				title: '발송처리가 완료되었습니다.',
				icon:'success',
				confirmButtonColor: '#3085d6'
			});

			// 모달에 발송버튼을 없앤다.
			sendBtn.style.display = "none";

		} else {
			// 실패 알림을 띄운다.
			Swal.fire({
				title: '실패',
				title: '발송처리에 실패했습니다',
				icon:'error',
				confirmButtonColor: '#3085d6'
			});
		}
	}


	/* 발송버튼 이벤트 */
	sendBtn.addEventListener("click", () => {

		// 주문번호를 가져온다.
		let memOrderNo = orderNumberTag.innerHTML
//		console.log(memOrderNo);

		Swal.fire({
			title: '발송 처리하시겠습니까?',
			icon:'info',

			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#cecece',
			confirmButtonText: '발송',
			cancelButtonText: '취소',
		}).then(result => {
			if(result.isConfirmed) {
				// 발송처리를 한다.
				sendDlvySttus(memOrderNo);
			}
		});
	});


	// 마켓회원의 모든 주문리스트를 가져온다.
	showAllOrderList();
});