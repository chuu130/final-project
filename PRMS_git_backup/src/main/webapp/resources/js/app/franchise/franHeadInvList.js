/**
 *
 */

document.addEventListener("DOMContentLoaded", () => {
	const contextPath = document.body.dataset.contextPath;
	const listBody = document.getElementById("list-body");
	const orderHistoryTab = document.querySelector("#newOrderTab");
	const totalCost = document.querySelector("#totalCost");
	const emerSubmit = document.getElementById('emerSubmit');
	const myFranchiseIdElement = document.getElementById('myFranchiseId');
	const searchform = document.getElementById('Bsearchform');
	const BsearchUI = document.querySelector('#BsearchUI');
	const pagingArea = document.querySelector(".Bpaging-area");

	//자신 가맹점 아이디
	let myFranchiseId = myFranchiseIdElement.dataset.myFranchiseId;

	//총액금액 초기화
	let total = 0;

	//지점을 선택할때 지점의 상품 리스트 비동기
	listBody.innerHTML = "";
	orderHistoryTab.innerHTML = "";
	totalCost.innerHTML = "0원";


	// 엔터키를 누르면 검색
	$("#searchWord").on("change", function(){
		BsearchUI.querySelectorAll("input[name]").forEach(function(input, index){
			let name = input.name;
			let value = $(input).val();
			searchform[name].value = value;
		});
		// 다시 서브밋 하면 page값 초기화
		searchform.page.value ="";
		searchform.requestSubmit();
	})

	$(".Bpaging-area").on("click", "a[data-page]", function(){
		let page = this.dataset.page;
		searchform.page.value = page;
		searchform.requestSubmit();
	});


	//비동기로 검색,페이징 리스트 뽑기
	searchform.addEventListener("submit", (e)=>{
		e.preventDefault();
		let formData = new FormData(e.target);
		let data = new URLSearchParams(formData).toString();

		fetch(`${contextPath}/main/franchisee/franHeadInvList.do?${data}`,{
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
			listBody.replaceChildren("");
			for(let i = 0; i < data.aiList.length; i++){
				listBody.insertAdjacentHTML('beforeend', `
					<div class="col-xxl-3 col-xl-4 col-lg-6 col-md-4 col-sm-6 pb-4" data-type="desserts" style="height: 380px;">
						<div class="rounded" style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);">
							<a href="#" class="pos-product">
								<div class="img" style="background-image: url(${data.aiList[i].prodImage})"></div>
								<div class="info">
									<div class="title truncate" style="height: 50px;">${data.aiList[i].prodSleNm}</div>
									<div class="desc">${data.aiList[i].prodDc}</div>
									<div class="price">${data.aiList[i].prodSlePcComma}원</div>
								</div>
							</a>
						</div>
					</div>
				`);
			}
			console.log("data.aiList.length", data.aiList.length)
			if(data.aiList.length === 0){
				listBody.innerHTML = `<div><h1>검색하신 상품이 없습니다. 다시 검색해주세요.</h1></div>`
				pagingArea.innerHTML = "";
			} else {
				//페이징 비동기
				pagingArea.innerHTML= data.pagingHTML;
			}


				//상품 클릭 이벤트 추가
			let products = listBody.querySelectorAll('.pos-product');
			products.forEach((product, i) =>{
				product.addEventListener("click", function(e) {
					e.preventDefault();
					addOrderHistory(data.aiList[i]);
				});
			});
		})
		.catch(err=>console.log(err));
	});
	searchform.requestSubmit();

	//orderHistoryTab에 상품 추가
	function addOrderHistory(product) {
		// 중복 상품 방지
		let existProduct = orderHistoryTab.querySelector(`.pos-order-product .h6[data-product-id="${product.prodId}"]`)
		if(existProduct) {
		    Swal.fire({
	            title: '이미 장바구니에 있는 상품입니다.',
	            text: '',
	            icon: 'error',
	            confirmButtonColor: '#3085d6'
	        });

			return;
		}

        let orderHtml = `
		<div class="pos-order">
            <div class="pos-order-product">
                <div class="img" style="background-image: url(${product.prodImage})"></div>
                <div class="flex-1">
                    <div class="h6 mb-1" data-product-id="${product.prodId}" data-product-price="${product.prodSlePc}">${product.prodSleNm}</div>
                    <div class="small mb-2">${product.prodDc}</div>
                    <div class="d-flex">
                        <a href="#" class="btn btn-secondary btn-sm btn-decrease"><i class="fa fa-minus"></i></a>
                        <input type="text" class="form-control w-50px form-control-sm mx-2 bg-white bg-opacity-25 bg-white bg-opacity-25 text-center" value="1">
                        <a href="#" class="btn btn-secondary btn-sm btn-increase"><i class="fa fa-plus"></i></a>
                    </div>
                </div>
            </div>
			<div class="pos-order-price d-flex flex-column">
				<div class="flex-1">개당 ${product.prodSlePcComma}원</div>
				<div class="text-end">
					<a href="#" class="btn btn-default btn-sm btn-delete"><i class="fa fa-trash"></i></a>
				</div>
			</div>
        `;
        orderHistoryTab.insertAdjacentHTML('beforeend', orderHtml);

		let deleteButtons = orderHistoryTab.querySelectorAll('.btn-delete');
		let decreaseButtons = orderHistoryTab.querySelectorAll('.btn-decrease');
        let increaseButtons = orderHistoryTab.querySelectorAll('.btn-increase');

		// 총 비용 업데이트 함수
		function updateTotalCost() {
		total = 0;
			orderHistoryTab.querySelectorAll('.pos-order').forEach(order => {
				let price = order.querySelector('.h6').dataset.productPrice;
				let qy = parseInt(order.querySelector('.form-control').value, 10);

				let commaRemovePrice = Number(price.replace(/,/g, ''));//콤마제거
				//총액계산
				total += commaRemovePrice * qy;

			});
		totalCost.textContent = `${total.toLocaleString()}원`;
		}

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
				if(input.value < 99){
					input.value = value + 1;
					updateTotalCost();
				}
			});
		});

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
			});
		});
		//첫 상품 클릭 후 총 비용 업데이트
		updateTotalCost();

	}

	//사용자의 input안에 1부터 99까지 입력 제한 함수
	orderHistoryTab.addEventListener('input', function(e) {
		if (e.target.matches('.form-control')) {
			let input = e.target;
			let value = input.value;

			// 숫자가 아닌 문자 제거
			value = value.replace(/[^0-9]/g, '');

			// 숫자가 1~99 범위 안에 있는지 확인
			if (value !== '' && (Number(value) < 1 || Number(value) > 99)) {
				value = value.slice(0, -1);
			}

			// 필드 값을 업데이트
			input.value = value;
		}
	});


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
				let fiOrderList = [];

				products.forEach(product => {
					let prodId = product.querySelector('.h6').dataset.productId;
			        let orderdetailQy = product.querySelector('.form-control').value;
			        let orderdetailPc = product.querySelector('.h6').dataset.productPrice;
					let commaRemoveOrderdetailPc = Number(orderdetailPc.replace(/,/g, ''));
					fiOrderList.push({
			            prodId: prodId,
			            orderdetailQy: orderdetailQy,
			            orderdetailPc: commaRemoveOrderdetailPc
		        	});
				});
				console.log("total", total);


				// 재고 신청정보를 담는 객체
				let invRequestInfo = {
					franchiseId: franchiseId,
					fireqAmount: total,
					fiOrderList: fiOrderList
				};

				// emerDtList가 null이면 실패
				if (fiOrderList === null || fiOrderList.length === 0) {
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
				let url = `${contextPath}/main/franchisee/franInsertInvReq.do`;
				let method = "POST";
				let headers = {
					'content-type' : "application/json",
					'accept' : "application/json"
				};
				let body = JSON.stringify(invRequestInfo);

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