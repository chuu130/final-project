const domain = location.href.split("/")[2]; // 도메인
const alermContextPath = "/prms"; // 컨텍스트경로
const alermCountTag = document.querySelector("#alermCount"); // 알림개수
const alermListTag = document.querySelector("#alermList"); // 알림리스트
const empId = document.querySelector("#empId").innerHTML; // 로그인한 임직원정보


/* path 경로에 접속을 시도한다. */
const ws = new WebSocket(`ws://${domain}${alermContextPath}/prms-alerm`);

/* 접속에 성공하면 발생하는 이벤트 */
ws.onopen = (e) => {
	console.log("접송성공!");
}

/*  임직원 알람을 전송하는 함수 */
const sendEmpAlerm = async (alermVO) => {

// 		[알림객체 전송형태]
//		let alermVO = {
//			alermSenderId:"",
//			alermReciverId:"",
//			alermKind:"",
//			alermContent:""
//		}

	let jsonAlerm = JSON.stringify(alermVO);

	ws.send(jsonAlerm);

	// 비동기로 데이터베이스에 알림정보를 저장한다.
	let url = `${alermContextPath}/alerm/send`;
	let options = {
		method:"POST",
		headers: {
			"Content-type":"application/json"
		},
		body: jsonAlerm
	}

	let resp = await fetch(url, options);
	let jsonData = await resp.json();
	console.log(jsonData);
}



/* 알람리스트 UI */
const alermUI = (alerm) => {

		let alermTag;
		let alermKind = alerm.alermKind;

		if(alermKind.includes('발송') || alermKind.includes('반려')) {
			alermTag = `
				<a href="${alermContextPath}/main/franchisee/franInvReqList.do" class="d-flex align-items-center dropdown-item text-wrap" id="${alerm.alermNo}" onclick="readAlerm()">
					<div class="fs-20px bg-primary bg-opacity-15 w-40px h-40px rounded-pill d-flex align-items-center justify-content-center">
						<i class="fa fa-box fa-lg text-primary"></i>
					</div>
					<div class="flex-1 flex-wrap ps-3">
						<div>${alerm.alermContent}</div>
						<div class="small text-body text-opacity-50">${alerm.alermSendDt}</div>
					</div>
					<div class="ps-2 text-body text-opacity-25">
						<i class="fa fa-chevron-right"></i>
					</div>
				</a>
				`;
		} else if(alermKind.includes('긴급재고')) {
			alermTag = `
				<a href="${alermContextPath}/main/franchisee/franEmerFranInvApplyList.do" class="d-flex align-items-center dropdown-item text-wrap" id="${alerm.alermNo}" onclick="readAlerm()">
					<div class="fs-20px bg-primary bg-opacity-15 w-40px h-40px rounded-pill d-flex align-items-center justify-content-center">
						<i class="fa fa-box fa-lg text-primary"></i>
					</div>
					<div class="flex-1 flex-wrap ps-3">
						<div>${alerm.alermContent}</div>
						<div class="small text-body text-opacity-50">just now</div>
					</div>
					<div class="ps-2 text-body text-opacity-25">
						<i class="fa fa-chevron-right"></i>
					</div>
				</a>
			`;
		}

		return alermTag;
}


/* 알림클릭시 읽음처리로 변경한후, 페이지로 이동하는 함수 */
async function readAlerm() {
	event.preventDefault();
	let aTag = event.target.parentElement.parentElement;

	let loc = aTag.href;
	let alermNo = aTag.id;

//	console.log(loc);
//	console.log(alertNo);

	let alermVO = {
		alermNo:alermNo
	}

	let url = `${alermContextPath}/alerm/read`;

	let options = {
		method:"POST",
		headers:{
			"Content-type":"application/json"
		},
		body: JSON.stringify(alermVO)
	}


	let resp = await fetch(url, options);
	let jsonData = await resp.json();
	console.log(jsonData);


	// 해당 페이지로 이동
	location.href = loc;
}


/* 헤더의 알람정보에 반영하는 함수 */
const applyAlerm =  async () => {

	let alermVO = {
		alermReciverId:empId
	}

	let url = `${alermContextPath}/alerm/myAlerm`;
	let options = {
		method:"POST",
		headers: {
			"Content-type":"application/json"
		},
		body:JSON.stringify(alermVO)
	}

	let resp = await fetch(url, options);
	let myAlermJsonData = await resp.json();
	console.log(myAlermJsonData);

	let alermTags = myAlermJsonData.map(alermUI).join("\n");
//	console.log(alermTags);
//	console.log(myAlermJsonData.length);
	alermListTag.innerHTML = alermTags;
	alermCountTag.innerHTML = `(${myAlermJsonData.length})`;
}

// 유저의 알림을 반영한다.
applyAlerm();


/* 헤더의 알림창과 Swal로 표시하는 함수 */
const showAlerm = async (alermVO) => {

//	<h5>${alermVO.alermSenderId}</h5>
	let alermHtml = `
		<h6>${alermVO.alermContent}</h6>
	`;

	Swal.fire({
            title: alermVO.alermKind,
            html: alermHtml,
//            iconHtml: `<img src="${alermContextPath}/resources/startbootstrap-agency-gh-pages/img/petconomy.png" style="width: 50px; height: 50px;">`,
            position: 'top-end',
            showConfirmButton: true,
			showCancelButton: true,
            timer: 7000,
            toast: true,
            background: '#ffffff',
            customClass: {
//				icon: 'no-bordered',
                popup: 'colored-toast'
            },
			confirmButtonText: '이동',
			cancelButtonText: '닫기'
    }).then((result) => {

		if(result.isConfirmed) {
			let location = alermContextPath;

			if(alermVO.alermKind.includes('발송') || alermVO.alermKind.includes('반려')) {
				location += '/main/franchisee/franInvReqList.do';
			} else if(alermVO.alermKind.includes('긴급재고')) {
				location +=  '/main/franchisee/franEmerFranInvApplyList.do';
			}

			window.location.href = location;
		}
	});
}


/* 서버에서 메시지가 도착할 때 발생하는 이벤트 */
ws.onmessage = (e) => {
//	console.log(e.data);
	let alermVO = JSON.parse(e.data);

	// 알림정보를 화면에 표시한다.
	showAlerm(alermVO);

	// 알림창에 반영한다.
	applyAlerm();
}

/* 접속이 끊기면 발생하는 이벤트 */
ws.onclose = (e) => {
	console.log("접속종료!");
}

