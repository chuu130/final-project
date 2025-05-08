/**
 *
 */

document.addEventListener("DOMContentLoaded", () => {
	const contextPath = document.body.dataset.contextPath;
	const listBody = document.getElementById("list-body");
	const franchise = document.querySelector("#franId");
	const orderHistoryTab = document.querySelector("#newOrderTab");
	const totalCost = document.querySelector("#totalCost");
	const emerSubmit = document.getElementById('emerSubmit');
	const myFranchiseIdElement = document.getElementById('myFranchiseId');
	const searchform = document.getElementById('Bsearchform');
	const BsearchUI = document.querySelector('#BsearchUI');
	const pagingArea = document.querySelector(".Bpaging-area");
	const debug = false; // 전체 디버깅 설정

	//총액금액 초기화
	let total = 0;

	// 엔터키를 누르면 검색
	$("#searchWord").on("keydown", function(e){
		//엔터키코드 13
		if(e.keyCode === 13) {
			e.preventDefault();
			BsearchUI.querySelectorAll("input[name]").forEach(function(input, index){
				let name = input.name;
				let value = $(input).val();
				searchform[name].value = value;
			});
			searchform.requestSubmit();
		}
	})

	//페이징 클릭
	$(".Bpaging-area").on("click", "a[data-page]", function(){
		let page = this.dataset.page;
		searchform.page.value = page;
		searchform.requestSubmit();
	});



	//비동기 중복 방지
	let isFetching = false;

	//자신 가맹점 아이디
	let myFranchiseId = myFranchiseIdElement.dataset.myFranchiseId;
	// 상대 가맹점 아이디
	let emerReqstId = null;

	// 지점 선택시 비동기 폼
	function Bform() {

		if (isFetching) return; // 요청 중일경우 컷
		isFetching = true; // 요청 컷 설정

		// 상대 가맹점 아이디
		emerReqstId = franchise.options[franchise.selectedIndex].value;
		if(debug) {
			console.log("emerReqstId",emerReqstId);
		}


		if(!emerReqstId){
			listBody.innerHTML = "<h4>지점을 선택해주세요.</h4>";
			isFetching = false; // 요청 컷 해제
			return;
		}

		let formData = new FormData(searchform);
		let data = new URLSearchParams(formData).toString();

		fetch(`${contextPath}/main/franchisee/franEmerFranInvList.do?${data}&&what=${emerReqstId}`,{
			headers: {
				accept: "application/json"
			}
		}).then(resp => {
			if(resp.ok){
				return resp.json();
			} else {
				throw new Error(`상태코드: ${resp.status}, ${resp.statusText}`);
			}
		}).then(data=>{
			listBody.innerHTML = "";
			if (data.fiList.length === 0 ){
				listBody.innerHTML += `<h4>재고 없음</h4>`;
				pagingArea.innerHTML = "";
			} else {
				for(let i = 0; i < data.fiList.length; i++){
					listBody.innerHTML += `
						<div class="col-xxl-3 col-xl-4 col-lg-6 col-md-4 col-sm-6 pb-4" data-type="desserts" style="height: 380px;"">
							<div class="rounded" style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);">
								<a href="#" class="pos-product">
									<div class="img" style="background-image: url(${data.fiList[i].franprodImage})"></div>
									<div class="info">
										<div class="title truncate" style="height: 50px;">${data.fiList[i].franprodNm}</div>
										<div class="desc">수량: ${data.fiList[i].fivQy}</div>
										<div class="price">${data.fiList[i].franprodPc}원</div>
									</div>
								</a>
							</div>
						</div>
					`;
				}
				//페이징 비동기
				pagingArea.innerHTML= data.pagingHTML;
			}

				//상품 클릭 이벤트 추가
			let products = listBody.querySelectorAll('.pos-product');
			products.forEach((product, i) =>{
				product.addEventListener("click", function(e) {
					e.preventDefault();
					addOrderHistory(data.fiList[i]);
				});
			});
		})
		.catch(err=>console.log(err))
		.finally(() => {
            isFetching = false; // 요청 완료 후 플래그 해제
        });
	}

	//검색 폼 submit 이벤트 등록
	function initializeForm() {
		searchform.removeEventListener("submit", handleForm); // 기존 폼 제거
        searchform.addEventListener("submit", handleForm); // 새 폼 등록
	}

	function handleForm(e) {
        e.preventDefault();
        Bform();
    }



	//지점을 선택할때 지점의 상품 리스트
	franchise.addEventListener("change", function(){
		listBody.innerHTML = "";
		orderHistoryTab.innerHTML = "";
		totalCost.innerHTML = "0원";

		//비동기 다시 불러올때 페이지, 검색어 값 초기화
		searchform.page.value ="";
		searchform.searchWord.value = "";
		document.getElementById('searchWord').value = "";

		initializeForm();// submit 폼 초기화
		Bform();

	});


	//orderHistoryTab에 상품 추가
	function addOrderHistory(product) {
		// 중복 상품 방지
		let existProduct = orderHistoryTab.querySelector(`.pos-order-product .h6[data-product-id="${product.fivId}"]`)
		if(existProduct) {
			Swal.fire({
						title: '이미 장바구니에 있는 상품입니다.',
						text:'',
						icon:'error',
						confirmButtonColor: '#3085d6'
			});
			return;
		}

        let orderHtml = `
		<div class="pos-order">
            <div class="pos-order-product">
                <div class="img" style="background-image: url(${product.franprodImage})"></div>
                <div class="flex-1">
                    <div class="h6 mb-1" data-product-id="${product.fivId}" data-product-price="${product.franprodPc}">${product.franprodNm}</div>
                    <div class="small mb-2">수량: ${product.fivQy}</div>
                    <div class="d-flex">
                        <a href="#" class="btn btn-secondary btn-sm btn-decrease"><i class="fa fa-minus"></i></a>
                        <input type="text" class="form-control w-50px form-control-sm mx-2 bg-white bg-opacity-25 bg-white bg-opacity-25 text-center" value="1" data-max-qy="${product.fivQy}">
                        <a href="#" class="btn btn-secondary btn-sm btn-increase"><i class="fa fa-plus"></i></a>
                    </div>
                </div>
            </div>
			<div class="pos-order-price d-flex flex-column">
				<div class="flex-1">개당 ${product.franprodPc}원</div>
				<div class="text-end">
					<a href="#" class="btn btn-default btn-sm btn-delete"><i class="fa fa-trash"></i></a>
				</div>
			</div>
        `;
        orderHistoryTab.insertAdjacentHTML('beforeend', orderHtml);

		let deleteButtons = orderHistoryTab.querySelectorAll('.btn-delete');
		let decreaseButtons = orderHistoryTab.querySelectorAll('.btn-decrease');
        let increaseButtons = orderHistoryTab.querySelectorAll('.btn-increase');



		// 삭제버튼함수
		deleteButtons.forEach(button => {
			$(button).off("click").on("click", function(e){
				e.preventDefault();
				this.closest('.pos-order').remove();
				updateTotalCost();
			});
		});

		// 수량추가버튼함수
		increaseButtons.forEach(button => {
			$(button).off("click").on("click", function(e){
				e.preventDefault();
				let input = this.closest('.pos-order').querySelector('.form-control');
				let value = parseInt(input.value, 10);
				let maxQy = parseInt(input.getAttribute('data-max-qy'), 10);
				if(input.value < maxQy){
					input.value = value + 1;
					updateTotalCost();
				}
			})
		})

		// 수량빼기버튼함수
		decreaseButtons.forEach(button => {
			$(button).off("click").on("click", function(e){
				e.preventDefault();
				let input = this.closest('.pos-order').querySelector('.form-control');
				let value = parseInt(input.value, 10);
				if(input.value > 1){
					input.value = value - 1;
					updateTotalCost();
				}
			})
		})
		//첫 상품 클릭 후 총 비용 업데이트
		updateTotalCost();
	}

	// 총 비용 업데이트 함수
	function updateTotalCost() {
		total = 0;
		orderHistoryTab.querySelectorAll('.pos-order').forEach(order => {
			let price = order.querySelector('.h6').dataset.productPrice;
			let qy = parseInt(order.querySelector('.form-control').value, 10);
			if(debug) {
				console.log("price",price);
				console.log("qy",qy);
			}
			let commaRemovePrice = Number(price.replace(/,/g, ''));//콤마제거
			if(debug) {
				console.log("콤마 제거된 가격 (commaRemovePrice):", commaRemovePrice);
			}
			//총액계산
			total += commaRemovePrice * qy;
		});
		if(debug){
			console.log("total",total);
		}
	totalCost.textContent = `${total.toLocaleString()}원`;
	}

	// 긴급재고추가 fetch
	emerSubmit.addEventListener("click", function(e){
		e.preventDefault();
		Swal.fire({
		   title: '신청 하시겠습니까?',
		   text: '',
		   icon: 'warning',

		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
		   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   	if(result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				// 자기 가맹점
				let franchiseId = myFranchiseId;

				// 상품 정보
				let products = orderHistoryTab.querySelectorAll('.pos-order');
				let emerDtList = [];

				products.forEach(product => {
					let fivId = product.querySelector('.h6').dataset.productId;
			        let edetailQy = product.querySelector('.form-control').value;
			        let edetailPc = product.querySelector('.h6').dataset.productPrice;
					let commaRemoveEdetailPc = Number(edetailPc.replace(/,/g, ''));
					emerDtList.push({
			            fivId: fivId,
			            edetailQy: edetailQy,
			            edetailPc: commaRemoveEdetailPc
		        	});
				});
				console.log("total", total);

				// 긴급재고 신청정보를 담는 객체
				if(debug){
					console.log("emerReqstId",emerReqstId);
				}
				let emergencyInfo = {
					franchiseId: franchiseId,
					emerReqst: emerReqstId,
					emerAmount: total,
					emerDtList: emerDtList
				};

				// emerDtList가 null이면 실패
				if (emerDtList === null || emerDtList.length === 0) {
				    Swal.fire({
				        title: '신청 실패했습니다.',
				        text: '다시 시도해주십시오.',
				        icon: 'error',
						confirmButtonColor: '#3085d6'
				    });
				    // 요청을 보내지 않고 함수를 종료
				    return;
				}

				// 비동기로 인서트 요청
				let url = `${contextPath}/main/franchisee/franInsertEmer.do`;
				let method = "POST";
				let headers = {
					'content-type' : "application/json",
					'accept' : "application/json"
				};
				let body = JSON.stringify(emergencyInfo);

				fetch(url, {
					method:method,
					headers:headers,
					body:body
				}).then((resp) => {
			        if (resp.ok) {
						Swal.fire({
							title: '신청이 완료되었습니다.',
							text:'',
							icon:'success',
							confirmButtonColor: '#3085d6'
						}).then(()=>{
							totalCost.innerHTML = "0원";
							orderHistoryTab.innerHTML = "";
							return resp.json();
						});

						fetch(`${contextPath}/main/franchisee/yourEmpId.do?reqFranchiseId=${emerReqstId}`, {
							headers: headers
						}).then((resp) =>{
							if(resp.ok){
								return resp.text();
							}
						}).then((otherFranId)=>{
							console.log("textData",otherFranId);
							let franNm = document.querySelector("#franNm").innerHTML;

							// 알림을 보낸다.
							let alermVO = {
								alermSenderId: empId,
								alermReciverId: otherFranId,
								alermKind: "긴급재고알림",
								alermContent: `[${franNm}]에서 긴급재고요청이 들어왔어요!`
							}
							sendEmpAlerm(alermVO);
						})
			        } else {
						Swal.fire({
							title: '신청 실패했습니다.',
							text:'다시 시도해주십시오.',
							icon:'error',
							confirmButtonColor: '#3085d6'
						})
						throw new Error(`상태코드 : ${resp.status}
			                           에러메시지 : ${resp.statusText}`);
					}
				}).catch((err) => console.log(err));
			}
		});
	});
});