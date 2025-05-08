document.addEventListener("DOMContentLoaded", () => {

	const contextPath = document.body.dataset.contextPath;
	const cartBtn = document.querySelector("#cartBtn");
//	const paymentBtn = document.querySelector("#paymentBtn");


	/* 장바구니 이벤트 */
	cartBtn.addEventListener("click", () => {

		// 상품아이디와 상품수량을 가져온다.
		let prodId = document.querySelector("#prodNm").dataset.prodId;
		let cdQy = document.querySelector("#cdQy").value;

		// 회원번호를 가져온다.
		let memNoTag = document.querySelector("#memNo");

		// 비회원이 장바구니에 담는다면
		if(!memNoTag){
			Swal.fire({
				title: '로그인 후 이용해주세요',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			}).then(result => {
				if(result.isConfirmed) {
					location.href = `${contextPath}/market/login`;
				}
			});
			return;
		}

		let memNo = memNoTag.innerHTML;

		// 서버에 데이터를 전송한다. (장바구니에 추가한다.)
		let url = `${contextPath}/market/prodDetail/addCart`;
		let method = "POST";
		let headers = {
				'content-type' : "application/json",
				'accept' : "application/json"
		};
		let body = JSON.stringify({
			prodId : prodId,
			cdQy : cdQy,
			memNo : memNo
		});

		FetchUtils.fetchForJSON(url, {
			method:method,
			headers:headers,
			body:body
		}).then(({serviceResult, cnt}) => {

			// 장바구니에 추가되었다면
			if(serviceResult == 'OK'){
				Swal.fire({
					title: '장바구니에 추가되었습니다. 이동하시겠습니까?',
					icon:'success',

					showCancelButton: true,
					confirmButtonColor: '#3E9172',
					cancelButtonColor: '#cecece',
					confirmButtonText: '이동',
					cancelButtonText: '닫기',
				}).then(result => {
						$.ajax({
							url : 'addCartCnt',
							type : 'POST',
							success:(data)=>{
								console.log(data);
								$(".ms-cart-count").html(data);
							},
							error: (jqXHR, textStatus, errorThrown)=>{
										console.log("textStatus", textStatus);
							}
						});
						/*
						$.ajax({
							url : 'cartListUpdate',
							type : 'POST',
							async : false,
							success:(data)=>{
								console.log(data);
								cartListUpdate(data);
							},
							error: (jqXHR, textStatus, errorThrown)=>{
										console.log("textStatus", textStatus);
							}
						});
						*/
					if(result.isConfirmed) {
						location.href =`${contextPath}/market/member/memberCart`;
					}
				});
			} else {
				Swal.fire({
					title: '장바구니에 해당상품이 담겨져 있습니다.',
					text:'나중에 다시 시도해주세요',
					icon:'error',
					confirmButtonColor: '#3E9172'
				})
			}
		});

	});
	/*
	const cartBody = $(".cartBody");

	function cartListUpdate(memCartList){
		cartBody.empty();

		memCartList.forEach((cart)=>{
			var cartProdPc = (cart.prod.prodSlePc * cart.cdQy).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			cartList = `
			li><a href="/prms/market/prodDetail/${cart.prodId }" class="ms-pro-img"><img
							src="${cart.prod.prodImage }" alt="product"></a>
						<div class="ms-pro-content">
							<a href="/prms/market/prodDetail/${cart.prodId }" class="cart-pro-title">${cart.prod.prodSleNm}</a>
							<span class="new-price">${cartProdPc}원</span>
							<c:set var="totalPc" value="${totalPc + cart.prod.prodSlePc * cart.cdQy}" />
							<div class="num">
								<span>수량</span> <input type="hidden" class="slePc"
									value="${cart.prod.prodSlePc }" /> <input type="hidden"
									class="memNo" value="${cart.memNo }" /> <input type="hidden"
									class="prodId" value="${cart.prodId }" /> <input type="hidden"
									class="admininvQy" value="${cart.adminInv.admininvQy }" />
									<div class="count">
									<a type="button"  class="btn btn-secondary btn-sm minus">-</a>
									 <input  style="width:50px; height: 30px;" class="text-center qty-input" type="text" id="qty" value="${cart.cdQy }" readonly="readonly">
									<a type="button"  class="btn btn-secondary btn-sm plus">+</a>
								</div>

							</div>
							<a class="remove" type="button" style="display: block; height: 30px;">×</a>
						</div></li>
			`;


			cartBody.append(cartList);
		})
	}
	*/

	/* 구매하기 버튼 이벤트*/
	let purchasingBtn = document.querySelector("#purchasingBtn");
	purchasingBtn.addEventListener("click", () => {

		// 회원번호를 가져온다.
		let memNoTag = document.querySelector("#memNo");

		// 비회원이 구매하기 버튼을 클릭한다면 막는다.
		if(!memNoTag){
			Swal.fire({
				title: '로그인 후 이용해주세요',
				icon:'warning',
				confirmButtonColor: '#3E9172'
			}).then(result => {
				if(result.isConfirmed) {
					location.href = `${contextPath}/market/login`;
				}
			});
			return;
		}

		// 구매가능 수량보다 많이 입력했다면 막는다.
		let admininvQy = document.querySelector("#admininvQy").innerHTML; // 구매가능 수량
		let cdQy = document.querySelector("#cdQy").value; // 입력한 수량

		if(Number(cdQy) > Number(admininvQy)) {
			Swal.fire({
				title:"구매가능수량을 확인해주세요",
				icon:"warning",
				confirmButtonColor: '#3E9172'
			});

			return;
		}

		// 상품아이디와 구매수량을 담아서 단건 구매페이지로 이동한다.
		let prodId = document.querySelector("#prodNm").dataset.prodId;
		location.href = `${contextPath}/market/member/singlePurchasing/${prodId}/${cdQy}`;
	});

	/*	// 리뷰등록하기 링크
		reviewBtn.addEventListener("click", () => {
		   	let prodId = document.querySelector("#prodNm").dataset.prodId;
		    location.href = `${contextPath}/market/member/reviewProdUI?prodId=${prodId}`;
		});
*/

		// 리뷰삭제하기
		$(document).ready(function() {
   		 $(document).on('click', 'delbtn', function() { // .delete-btn 클릭이벤트
        var reviewNo = $(this).data('review-id'); // 리뷰아이디
        var productId = $('#productId').val(); // 상품아이디값

		console.log("reviewId?",reviewId);
		console.log("productId?",productId);


        if (confirm('정말 이 리뷰를 삭제하시겠습니까?')) {
            $.ajax({
                url: '/market/member/${reviewNo}/delete',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    productId: productId,
                    reviewNo: reviewNo
                }),
                success: function(response) {
                    if (response === 'success') {
                        alert('리뷰가 성공적으로 삭제되었습니다.');
                        $(`[data-review-id="${reviewId}"]`).remove();
                    } else {
                        alert('리뷰 삭제에 실패했습니다.');
                    }
                },
                error: function() {
                    alert('리뷰 삭제 요청 처리 중 오류가 발생했습니다.');
                }
            });
        }
    });
});
    var $likeBtn =$('.icon.heart');

        $likeBtn.click(function(){
        	$likeBtn.toggleClass('active');
			// 상품아이디와 상품수량을 가져온다.
			let prodId = document.querySelector("#prodNm").dataset.prodId;

			// 회원번호를 가져온다.
			let memNoTag = document.querySelector("#memNo");

			// 비회원이 찜하기를 눌렀다면
			if(!memNoTag){
				Swal.fire({
					title: '로그인 후 이용해주세요',
					icon:'warning',
					confirmButtonColor: '#3E9172'
				}).then(result => {
					if(result.isConfirmed) {
						location.href = `${contextPath}/market/login`;
					}
				});
				return;
			}
			let memNo = memNoTag.innerHTML;


	        if($likeBtn.hasClass('active')){
	           $(this).find('img').attr({
	              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
	               alt:'찜하기 완료'
	                });
				Swal.fire({
						   title: '찜목록에 추가되었습니다.',
						   text: '',
						   icon: 'success',
						   confirmButtonColor: '#3E9172'
				})
	          	$.ajax({
					url : `${contextPath}/market/member/addWishList`,
					type : "POST",
					async : false,
					data : { "prodId" : prodId,
						"memNo" : memNo
					},
					success:(data)=>{
						console.log(data);
						$(".ms-wishlist-count").html(data);
					},
					error: (jqXHR, textStatus, errorThrown)=>{
								console.log("textStatus", textStatus);
					}

				});

				$.ajax({
					url : `${contextPath}/market/member/wishListUpdate`,
					type : "POST",
					data : { "memNo" : memNo
					},
					success:(data)=>{
						console.log(data);
						addWishList(data);
					},
					error: (jqXHR, textStatus, errorThrown)=>{
								console.log("textStatus", textStatus);
					}
				});

	         }else{
	            $(this).find('i').removeClass('fas').addClass('far')
		           $(this).find('img').attr({
		              'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
		              alt:"찜하기"
		           })
 					Swal.fire({
						   title: '찜목록에서 삭제되었습니다.',
						   text: '',
						   icon: 'error',
						   confirmButtonColor: '#3E9172'
				})
					$.ajax({
						url : `${contextPath}/market/member/memberWishListDelete`,
						type : "POST",
						async : false,
						data : { "prodId" : prodId,
							"memNo" : memNo
						},
						success:(data)=>{
							console.log(data);
							$(".ms-wishlist-count").html(data);
						},
						error: (jqXHR, textStatus, errorThrown)=>{
									console.log("textStatus", textStatus);
						}

					});

					$.ajax({
						url : `${contextPath}/market/member/wishListUpdate`,
						type : "POST",
						
						data : { "memNo" : memNo
						},
						success:(data)=>{
							console.log(data);
							addWishList(data);
						},
						error: (jqXHR, textStatus, errorThrown)=>{
									console.log("textStatus", textStatus);
						}
					});
	         }
	     })

	const wishBody = $(".wishBody");
	function addWishList(memWishList){
		wishBody.empty();

		memWishList.forEach((wish)=>{
			let wishProdPc = wish.prod.prodSlePc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			console.log(wish);
			console.log(wishBody);
			wishList = `
			<li><a href="/prms/market/prodDetail/${wish.prodId }" class="ms-pro-img"><img
							src="${wish.prod.prodImage }"
							alt="product"></a>
						<div class="ms-pro-content">
							<a href="/prms/market/prodDetail/${wish.prodId }" class="wish-pro-title">${wish.prod.prodSleNm }</a>
							<span class="wish-price"><span>${wishProdPc }원</span></span>
							<div class="ms-availability">
								<p class="stock avail"></p>
								<input type="hidden" class="memNo" value="${wish.memNo }" />
								<input type="hidden" class="prodId" value="${wish.prodId }" />
								<a href="javascript:void(0)" class="ms-btn-2 addCart">장바구니 추가</a>
							</div>
							<a href="javascript:void(0)" class="remove" id="wishRemove">×</a>
						</div>
					</li>
			`;

			wishBody.append(wishList);
		});
	}



});