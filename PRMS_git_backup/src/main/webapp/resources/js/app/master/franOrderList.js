document.addEventListener("DOMContentLoaded", () => {

	const contextPath = document.body.dataset.contextPath;
	const orderListTag = document.querySelector("#orderList"); // 발주내역을 담을 태그
	const statusListTag = document.querySelectorAll(".nav-link"); // 발주상태 검색조건 태그
	const searchDataTag = document.querySelector("#searchData"); // 발주상품/가맹점검색 태그

	const pagingArea = document.querySelector(".Bpaging-area"); // 페이징 위치

	let searchData = ""; // 검색데이터
	let status = "P"; // 발주상태
	let page = 1; // 현재 페이지

	// 페이징 처리를위한 객체
	let searchDataVO = {
		searchData:searchData,
		status:status,
		page:page
	};

	/* 발주정보 */
	var orderDtModal = new bootstrap.Modal(document.getElementById('orderDtModal'),{focus:false}); // 주문상세 모달
	let orderDtTag = document.querySelector("#orderDt"); // 발주일
	let orderNumberTag = document.querySelector("#orderNumber"); // 발주번호
	let franchiseNmTag = document.querySelector("#franchiseNm"); // 가맹점명
	let franchiseTelTag = document.querySelector("#franchiseTel"); // 가맹점 전화번호
	let franchiseAddrTag = document.querySelector("#franchiseAddr"); // 가맹점 주소
	let franchiseEmailTag = document.querySelector("#franchiseEmail"); // 가맹점 이메일
	let orderProdDtTag = document.querySelector("#orderProdDt"); // 발주상품리스트
	let totalAmountTag = document.querySelector("#totalAmount");
	let sendBtnTag = document.querySelector("#sendBtn"); // 발송버튼
	let rejectBtnTag = document.querySelector("#rejectBtn"); // 반려버튼
	let franEmpIdTag = document.querySelector("#franEmpId");


	// const totalCountTag = document.querySelector("#totalCount"); // 총 발주건수 표시태그


	/* 알림정보 */
	const senderId = document.querySelector("#masterId").innerHTML;



	/* 오늘 발주현황을 반영하는 함수 */
	const applyTodayInvRequest = async () => {
		let jsonData = await axios.get(`${contextPath}/main/master/todayInvRequest`);
//		console.log(jsonData);

		let todayInvRequest = jsonData.data.todayInvRequest;
		console.log(todayInvRequest);


		let waitInvStatus = false;

		todayInvRequest.forEach((todayInvRequest) => {

			let fireqSttus = todayInvRequest.FIREQ_STTUS;
			let count = todayInvRequest.COUNT

			let statusCount = `${count}건`;

			if(fireqSttus == 'P') {
				waitInv.innerHTML = statusCount;
				waitInvStatus = true; // 승인대기 상태 변경
			} else if(fireqSttus == 'Y') {
				successInv.innerHTML = statusCount;
			} else if(fireqSttus == 'C') {
				cancelInv.innerHTML = statusCount;
			} else if(fireqSttus == 'N') {
				rejectInv.innerHTML = statusCount;
			}
		});

		// map을 통해 뽑아온 데이터 중,
		// 1개남은 데이터를 처리할 시, 승인대기 데이터를 조회하지 않아서 건수가 변경되지 않은문제 해결
		if(!waitInvStatus) {
			waitInv.innerHTML = `0건`;
		}
	}


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


	/* 가맹점 발주리스트 데이터를 tr태그로 생성하는 함수 */
	const makeOrderListTrTags = (franOrder) => {

		let fireqId = franOrder.fireqId; // 발주번호
		let fireqSttus = franOrder.fireqSttus; // 발주상태
		let fireqDe = franOrder.fireqDe;  // 발주신청일

		let franchise = franOrder.franchise; // 프렌차이즈 정보
		let fiOrderList = franOrder.fiOrderList; // 발주상세리스트

		let sb = new StringBuilder();

//		console.log("발주일 : ", fireqDe);
//		console.log("오늘날짜 : ", getTotdayYearMonthDay());

		// 오늘날짜 백그라운드 지정
		if(fireqDe == getTotdayYearMonthDay()) {
			sb.append(`<tr class="orderTrList" style="cursor:pointer; background-color:aliceblue;" data-fireq-id=${fireqId}>`);
		} else {
			sb.append(`<tr class="orderTrList" style="cursor:pointer;" data-fireq-id=${fireqId}>`);
		}
		sb.append(`<td class="text-center align-middle order-border">
					<button style="border:none; border-bottom:1px solid black; background-color:transparent" class="franOrderNumber">${fireqId}</button>
					</td>`);
		sb.append(`<td class="order-border">`);
		fiOrderList.forEach((fiOrder) => {
			let prod = fiOrder.prod;
			sb.append(`<div class="d-flex mb-1" style="align-items: center;"><img src="${prod.prodImage}" alt="상품이미지" width="50px" height="50px" />`);
			sb.append(`<p class="px-2 mb-0 align-middle">${prod.prodSleNm}(${fiOrder.orderdetailQy}개)</p></div>`);
		});
		sb.append(`</td>`);
		sb.append(`<td class="text-center align-middle order-border">${franOrder.fireqAmount.toLocaleString()}원</td>`);
		sb.append(`<td class="text-center align-middle order-border">${franchise.franchiseNm}</td>`);


		if(fireqSttus == 'P') { // 승인대기
			sb.append(`
			<td class="text-center align-middle order-border">
				<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
					<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 승인대기
				</span>
			</td>`
			);
		} else if(fireqSttus == 'Y') { // 승인완료
			sb.append(`
				<td class="text-center align-middle order-border">
					<span class="badge text-success bg-success bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
						<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 승인완료
					</span>
				</td>
			`);
		} else if(fireqSttus == 'C') { // 발주취소
			sb.append(`
				<td class="text-center align-middle order-border">
					<span class="badge text-secondary bg-secondary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
						<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 발주취소
					</span>
				</td>
			`);
		} else if(fireqSttus == 'N') { // 반려
			sb.append(`
				<td class="text-center align-middle order-border">
					<span class="badge text-danger bg-danger bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
						<i class="fa fa-circle fs-9px fa-fw me-5px"></i> 반려
					</span>
				</td>
			`);
		}

		sb.append(`<td class="text-center align-middle">${fireqDe}</td>`);
		sb.append(`</tr>`);

		return sb.toString();
	}


	/* 상품리스트를 출력하는 UI */
	const prodUI = (orderDt) => {

		let prod = orderDt.prod;
		let prodImage = prod.prodImage;
		let prodSleNm = prod.prodSleNm;
		let orderProdQy = orderDt.orderdetailQy;
		let prodSlePc = prod.prodSlePc;

		return `
			<tr>
				<td class="text-center"><img src="${prodImage}" alt="상품이미지" style="width:50px; height:50px"></td>
				<td class=" align-middle">${prodSleNm}</td>
				<td class="text-center align-middle">${orderProdQy}개</td>
				<td class="text-center align-middle">${prodSlePc.toLocaleString()}원</td>
				<td class="text-center align-middle">${(prodSlePc*orderProdQy).toLocaleString()}원</td>
			</tr>
		`;
	}


	/* 발주상세정보를 조회하는 함수 */
	const showFranOrderDt = async (franOrderNo) => {

		let url = `${contextPath}/main/master/franOrder/franOrderDt`;

		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};

		let options = {
			method:method,
			headers:headers,
			body:franOrderNo
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();

		console.log(jsonData);

		let franOrderDt = jsonData.franOrderDt;

		orderDtTag.innerHTML = franOrderDt.fireqDe;
		orderNumberTag.innerHTML = franOrderDt.fireqId;

		let franchise = franOrderDt.franchise;

		franchiseNmTag.innerHTML = franchise.franchiseNm;
		franchiseTelTag.innerHTML = franchise.franchiseTel;

		// 가맹점주소를 지정한다.
		let franchiseZip = franchise.franchiseZip;
		let franchiseAdd1 = franchise.franchiseAdd1;
		let franchiseAdd2 = franchise.franchiseAdd2;
		franchiseAddrTag.innerHTML = `(${franchiseZip})${franchiseAdd1} ${franchiseAdd2}`;


		franchiseEmailTag.innerHTML = franchise.franchiseEmail;

		// 발주상품 리스트를 표시한다.
		let orderDtList = franOrderDt.fiOrderList;
		let prodTrTags = orderDtList.map(prodUI).join('\n');
		orderProdDtTag.innerHTML = prodTrTags;

//		console.log(franOrderDt.fireqAmount);

		// 총금액을 표시한다.
		totalAmountTag.innerHTML = `${franOrderDt.fireqAmount.toLocaleString()}원`;


		// 승인대기 상태라면 발송, 반려버튼을 표시한다.
		// 아니면 버튼을 발송, 반려버튼을 삭제한다
		let = fireqSttus = franOrderDt.fireqSttus;

		if(fireqSttus == "P") {
			sendBtn.style.display = "block";
			rejectBtnTag.style.display = "block";
		} else {
			sendBtn.style.display = "none";
			rejectBtnTag.style.display = "none";
		}

		// 발주자 정보를 삽입한다.(히든)
		franEmpIdTag.innerHTML = franOrderDt.empId;


		// 발주상세 모달을 오픈한다.
		orderDtModal.show();
	}


	/* 전체가맹점 발주리스트를 가져오는 함수 */
	const showOrderList = async (searchDataVO) => {

		let url = `${contextPath}/main/master/franOrder/list`;
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
		console.log(jsonData);

		let franOrderList = jsonData.franOrderList;


		// UI를 뽑는다.
		let trTags = franOrderList.map(makeOrderListTrTags).join("\n");

//		console.log(trTags);

		// UI를 표시한다.
		orderListTag.innerHTML = trTags;

		// 페이지 UI를 표시한다.
		pagingArea.innerHTML= jsonData.pagingHTML;

		// 총건수를 표시한다.
		//totalCountTag.innerHTML = jsonData.totalCount;

		// 표시한 데이터 중, 발주번호를 기준으로 이벤트를 지정한다.(발주서 표시)
		let franOrderNumberTag = document.querySelectorAll(".franOrderNumber");
		franOrderNumberTag.forEach((franOrderTag) => {
			franOrderTag.addEventListener("click", (e) => {
				let franOrderNo = e.target.innerHTML;

				// 발주번호를 기준으로 가맹점 주문상세정보를 가져온 후, 모달로 표시한다.
				showFranOrderDt(franOrderNo);
			});
		});

		// 표시한 데이터 중, 레코드를 기준으로 이벤트를 지정한다. (발주서 표시)
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

				let franOrderNo = currTarget.dataset.fireqId;
//				console.log(franOrderNo);

				// 발주번호를 기준으로 가맹점 주문상세정보를 가져온 후, 모달로 표시한다.
				showFranOrderDt(franOrderNo);
			})
		});

		// 발주현황을 반영한다.
		applyTodayInvRequest();
	}

	/* 모든 가맹점의 발주리스트를 가져오는 함수 */
	const showAllOrderList = () => {

		searchDataVO['searchData'] = "";
		searchDataVO['status'] = "P";
		searchDataVO['page'] = 1;

		// 조건이 없는 주문정보를 화면에 보여준다.
		showOrderList(searchDataVO);
	}


	/* 페이지 클릭시 발생하는 이벤트 */
	pagingArea.addEventListener("click", (e) => {

		// 클릭한 페이지 정보를 저장한다.
		page = e.target.dataset.page;

		// 활성화되어있는 발주상태를 가져온다.
		let navText = document.querySelector(".nav-link.active").innerHTML;
		if(navText == "승인대기") {
			status = "P"
		} else if (navText == "승인완료") {
			status = "Y"
		} else if (navText == "발주취소") {
			status = "C"
		} else if (navText == "반려") {
			status = "N"
		}


		// 검색데이터를 가져온다.
		searchData = searchDataTag.value;

		searchDataVO['searchData'] = searchData;
		searchDataVO['status'] = status;
		searchDataVO['page'] = page;

		// 클릭한 페이지에 해당하는 발주정보를 화면에 보여준다.
		showOrderList(searchDataVO);
	});


	/* 발주상태에 변경시 검색 이벤트 */
	statusListTag.forEach((statusTag) => {
		statusTag.addEventListener("click", (e) => {

			// 클릭한 발주정보를 가져온다.
			let navText = e.target.innerHTML;
			if(navText == "승인대기") {
				status = "P"
			} else if (navText == "승인완료") {
				status = "Y"
			} else if (navText == "발주취소") {
				status = "C"
			} else if (navText == "반려") {
				status = "N"
			}

			// 검색조건을 가져온다.
			searchData = searchDataTag.value;

			// 페이지 정보를 1로 셋팅한다.
			page = 1;

			searchDataVO['searchData'] = searchData;
			searchDataVO['status'] = status;
			searchDataVO['page'] = page;

			// 클릭한 발주정보를 화면에 보여준다.
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


			// 발송상태값 비운다.
			status = "P";

			// 페이지 정보를 1로 셋팅한다.
			page = 1;

			searchDataVO['searchData'] = searchData;
			searchDataVO['status'] = status;
			searchDataVO['page'] = page;

			showOrderList(searchDataVO);

			// 화면의 발주상태를 전체로 변경한다.
			// 현재 활성화되어 있는 발주정보를 가져온다.
		 	let navStatusActive =  document.querySelector('.nav-link.active');

			// 해당 발주정보를 비활성화 한다.
			navStatusActive.classList.remove("active");

			// 전체 발주정보를 활성화한다.
			let allNavStatus = document.querySelector(".nav-link");
			allNavStatus.classList.add("active");
		}
	});


	/* 발주처리를 하는 함수 */
	const sendInvReqeustStatus = async (franOrderNo) => {

		let url = `${contextPath}/main/master/franOrder/sendInvReqeustStatus`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};

		let options = {
			method:method,
			headers:headers,
			body:franOrderNo
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();

		console.log(jsonData);

		// 발송성공했다면
		if(jsonData.success) {
			// UI에 반영한다. (해당 페이지 다시호출)
			let navText = document.querySelector('.nav-link.active').innerHTML;

			if(navText == "승인대기") {
				status = "P"
			} else if (navText == "승인완료") {
				status = "Y"
			} else if (navText == "발주취소") {
				status = "C"
			} else if (navText == "반려") {
				status = "N"
			}

			searchData = searchDataTag.value;

			searchDataVO['searchData'] = searchData;
			searchDataVO['status'] = status;
			searchDataVO['page'] = page;

			showOrderList(searchDataVO);

			// 성공 알림을 띄운다.
			Swal.fire({
				title: '성공',
				title: '발송처리가 완료되었습니다.',
				icon:'success',
				confirmButtonColor: '#3085d6'
			});

			// 모달에 발송버튼을 없앤다.
			sendBtn.style.display = "none";

			// 모달에 반려버튼을 없앤다.
			rejectBtnTag.style.display = "none";

			// 알림을 보낸다.
			let alermVO = {
				alermSenderId: senderId,
				alermReciverId: franEmpIdTag.innerHTML,
				alermKind: "발송알림",
				alermContent: `[${franOrderNo}]주문건이 발송처리 되었습니다.`
			}
			sendEmpAlerm(alermVO);

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
		let franOrderNo = orderNumberTag.innerHTML;
//		console.log(franOrderNo);

		Swal.fire({
			title: '발주 처리하시겠습니까?',
			icon:'question',

			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#cecece',
			confirmButtonText: '발송',
			cancelButtonText: '취소',
		}).then(result => {
			if(result.isConfirmed) {
				// 발송처리를 한다.
				sendInvReqeustStatus(franOrderNo);
			}
		});
	});


	/* 반려처리를 하는 함수 */
	const rejectReqeustStatus = async (franOrderNo,rejectReason) => {

		let url = `${contextPath}/main/master/franOrder/rejectInvRequest`;
		let method = "POST";
		let headers = {
			"Content-Type":"application/json",
			accept:"application/json"
		};

		let invRequest = {
			fireqId : franOrderNo,
			fireqRejCn : rejectReason
		}


		let options = {
			method:method,
			headers:headers,
			body:JSON.stringify(invRequest)
		}

		let resp = await fetch(url, options);
		let jsonData = await resp.json();

		console.log(jsonData);

		// 발송성공했다면
		if(jsonData.success) {
			// UI에 반영한다. (해당 페이지 다시호출)
			let navText = document.querySelector('.nav-link.active').innerHTML;

			if(navText == "승인대기") {
				status = "P"
			} else if (navText == "승인완료") {
				status = "Y"
			} else if (navText == "발주취소") {
				status = "C"
			} else if (navText == "반려") {
				status = "N"
			}

			searchData = searchDataTag.value;

			searchDataVO['searchData'] = searchData;
			searchDataVO['status'] = status;
			searchDataVO['page'] = page;

			showOrderList(searchDataVO);


			// 성공 알림을 띄운다.
			Swal.fire({
				title: '성공',
				title: '반려처리가 완료되었습니다.',
				icon:'success',
				confirmButtonColor: '#3085d6'
			});

			// 모달에 발송버튼을 없앤다.
			sendBtn.style.display = "none";

			// 모달에 반려버튼을 없앤다.
			rejectBtnTag.style.display = "none";

			// 알림을 보낸다.
			let alermVO = {
				alermSenderId: senderId,
				alermReciverId: franEmpIdTag.innerHTML,
				alermKind: "발송알림",
				alermContent: `[${franOrderNo}]주문건이 반려처리 되었습니다.`
			}
			sendEmpAlerm(alermVO);

		} else {
			// 실패 알림을 띄운다.
			Swal.fire({
				title: '실패',
				title: '반려처리에 실패했습니다',
				icon:'error',
				confirmButtonColor: '#3085d6'
			});
		}
	}

	/* 반려버튼 이벤트 */
	rejectBtnTag.addEventListener("click", () => {

		// 주문번호를 가져온다.
		let franOrderNo = orderNumberTag.innerHTML;
//		console.log(franOrderNo);

		Swal.fire({
			title:'반려 사유를 입력하세요',
			input:'text',
			inputPlaceholder:'반려사유 입력',
			confirmButtonColor: '#3085d6'
		}).then(({value})=> {

//			console.log(value); // 반려사유

			Swal.fire({
				title: '반려 처리하시겠습니까?',
				icon:'question',

				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#cecece',
				confirmButtonText: '반려',
				cancelButtonText: '취소',
			}).then(result => {
				if(result.isConfirmed) {
					 Swal.fire({
						confirmButtonColor: '#3085d6'
						});
					// 발송처리를 한다.
					rejectReqeustStatus(franOrderNo,value);
				}
			});

		});


	});


	// 모든 가맹점의 발주리스트를 가져온후, 화면에 표시한다.
	showAllOrderList();

	// 페이지 로딩시 발주현황을 반영한다.
	applyTodayInvRequest();

});