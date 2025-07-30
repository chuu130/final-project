document.addEventListener("DOMContentLoaded", ()=>{

	const contextPath = document.body.dataset.contextPath;

	const dataType = document.querySelectorAll("#cmmn");
	const navLink = document.querySelectorAll(".nav-link");
	const orderHistoryTab = document.querySelector("#newOrderTab");

	$(".nav-link").off().on("click", function(e){
		const filter = e.target.dataset.filter;
		const classs = e.target.classList;
		console.log(filter);
		console.log(classs);
		navLink.forEach((link)=>{
			console.log(link.classList);
			link.classList.remove("active");
		});
		classs.add("active");

		dataType.forEach((data)=>{
			console.log(data.dataset.type);
			if(filter === "all" || data.dataset.type.includes(filter)){
				data.style.removeProperty("display");

			}else{
				data.style.display = "none";
			}
		});
	});

	$(".nav-link i").on("click", function(e){
		 e.stopPropagation();

	});

	$(".pos-product").on("click", function(e){
		e.preventDefault();
		let franProdId = $(this).data('id');
		console.log(franProdId);

		$.ajax({
			url : "franchiseProdDetail",
			data : {"franProdId" : franProdId},
			method : "POST",
			success:(data)=>{
				console.log(data);
				addCart(data);

			},
			error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		});
	});



	$(".order").on("click", function(e){
		e.preventDefault();
	})

	function addCart(data){
		var franProd = '';
		var existproductId = orderHistoryTab.querySelector(`.pos-order-product .h6[data-product-id="${data.franprodId}"]`)
		if(existproductId) {
				  Swal.fire({
				            title: '이미 장바구니에 있는 상품입니다.',
				            text: '',
				            icon: 'error',
				            confirmButtonColor: '#3085d6', 
				        });

				return;
			}
		var franprodPc = data.franprodPc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

		franProd = '				<div class="pos-order">                                                                                                            ';
		franProd += '						<div class="pos-order-product">                                                                                            ';
		franProd += '							<div class="img"                                                                                                       ';
		franProd += '								style="background-image: url('+data.franprodImage+')"></div>                                                 ';
		franProd += '							<div class="flex-1">                                                                                                   ';
		franProd += '								<div class="h6 mb-1 prod" data-product-id="'+data.franprodId+'" data-product-nm="'+data.franprodNm+'">'+data.franprodNm+'</div>                                                                         ';
		franProd += '								<div class="small totalPc" value="'+data.franprodPc+'">'+franprodPc+'원</div>                                                                                    ';
		franProd += '								<div class="d-flex">                                                                                               ';
		franProd += '									<a href="#" class="btn btn-secondary btn-sm minus" onclick="return false" type="button"><i                                                                ';
		franProd += '										class="fa fa-minus"></i></a> <input type="text" name="qty"                                                       ';
		franProd += '										class="form-control w-50px form-control-sm mx-2 bg-white bg-opacity-25 bg-white bg-opacity-25 text-center" ';
		franProd += '										value="1"> <a href="#" type="button"                                                                                 ';
		franProd += '										class="btn btn-secondary btn-sm plus"  onclick="return false"><i class="fa fa-plus"></i></a>                                            ';
		franProd += '								</div>                                                                                                             ';
		franProd += '							</div>                                                                                                                 ';
		franProd += '						</div>                                                                                                                     ';
		franProd += '						<div class="pos-order-price d-flex flex-column posPirce">                                                                           ';
		franProd += '							<div class="flex-1 prodPc" value="'+data.franprodPc+'">'+franprodPc+'원</div>                                                                                       ';
		franProd += '							<div class="text-end">                                                                                                 ';
		franProd += '								<a href="#" class="btn btn-default btn-sm delete"><i                                                                      ';
		franProd += '									class="fa fa-trash"></i></a>                                                                                   ';
		franProd += '							</div>                                                                                                                 ';
		franProd += '						</div>                                                                                                                     ';
		franProd += '					</div>                                                                                                                         ';

		   //$("#newOrderTab").append(franProd);
		   orderHistoryTab.insertAdjacentHTML('beforeend', franProd);
			totalCost();

			const plusBtn = orderHistoryTab.querySelectorAll(".plus");
			const minusBtn = orderHistoryTab.querySelectorAll(".minus");
			const deleteBtn = orderHistoryTab.querySelectorAll(".delete");
			const prodTotalPc = orderHistoryTab.querySelectorAll(".totalPc");

			deleteBtn.forEach((deletes)=>{
				$(deletes).off("click").on("click", function(e){
				console.log(e);
				const prod = $(this).closest(".pos-order");

					var tags = `
										<div
											class="pos-order-confirmation text-center d-flex flex-column justify-content-center confirm">
											<div class="mb-1">
												<i class="fa fa-trash fs-20px lh-1 text-body text-opacity-25"></i>
											</div>
											<div class="mb-2">목록에서 삭제하시겠습니까?</div>
											<div>
												<a href="#" class="btn btn-danger btn-sm width-100px yes" onclick="return false">네</a>
												<a href="#"
													class="btn btn-default btn-sm width-100px no" onclick="return false">아니오</a>
											</div>
										</div>

						`;
						$(tags).appendTo(prod);

						const noBtn = document.querySelectorAll(".no");
						const yesBtn = document.querySelectorAll(".yes");

						noBtn.forEach((no)=>{
							no.addEventListener("click", function(){
								$(this).closest(".confirm").remove();
								totalCost();
							});
						});

						yesBtn.forEach((yes)=>{
							yes.addEventListener("click", function(){
								$(this).closest(".pos-order").remove();
								totalCost();
							});
						});
						totalCost();
				});
			});



			minusBtn.forEach(minus=>{
				$(minus).off("click").on("click", function(e){
					e.preventDefault();
					let qty = $(this).parent('div').find('input[name=qty]').val();
					let pc = $(this).closest(".pos-order").children(".posPirce").find(".prodPc").attr("value");
					if(qty >1 ){
						$(this).closest(".pos-order").find('input[name=qty]').val(--qty);
						let total = pc * qty;
						let totalcom = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						console.log(total);
						$(this).closest(".flex-1").find(".totalPc").html(totalcom+"원");
						$(this).closest(".flex-1").find(".totalPc").attr("value", total);
						totalCost();
					}
				});
			});




			plusBtn.forEach((plus)=>{
				$(plus).off("click").on("click", function(e){

					e.preventDefault();
					let qty = $(e.target).closest(".pos-order").find('input[name=qty]').val();
					let pc = $(this).closest(".pos-order").children(".posPirce").find(".prodPc").attr("value");
					$(e.target).closest(".pos-order").find('input[name=qty]').val(++qty);

					let total = pc * qty;
					let totalcom = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					$(this).closest(".flex-1").find(".totalPc").html(totalcom+"원");
					$(this).closest(".flex-1").find(".totalPc").attr("value", total);
					totalCost();
				});
			});

			function totalCost(){
				let addTotalPc = 0;
				orderHistoryTab.querySelectorAll(".pos-order").forEach((order)=>{
					let totalPc = parseInt($(order).find(".totalPc").attr("value"));
					console.log($(order).find(".totalPc").attr("value"));

					addTotalPc += totalPc;
				});
				console.log(addTotalPc);
				let addTotalPcComma = addTotalPc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$(".total").text(addTotalPcComma +"원");
				$("#total").val(addTotalPc);
			}



	}


			$('.payment').on('click', function(e){
				var total = $("#total").val();
				var prodPcList = document.querySelectorAll(".prodPc");
				var prodTotalPcList = document.querySelectorAll(".totalPc");
				var prodList = document.querySelectorAll(".prod");
				var qtyList = document.querySelectorAll("input[name=qty]");
				var modalBody = $(".modal-pos-product");
				modalBody.empty();

				var prodId = new Array();
				var prodNm = new Array();
				var prodQty = new Array();
				var prodPc = new Array();
				var prodTotalPc = new Array();

				for(var i=0; i<prodList.length; i++){
					prodId.push($(prodList[i]).data('product-id'));
					prodNm.push($(prodList[i]).data('product-nm'));
					prodQty.push($(qtyList[i]).val());
					prodPc.push($(prodPcList[i]).attr("value"));
					prodTotalPc.push($(prodTotalPcList[i]).attr("value"));
				}

				console.log(prodId);
				console.log(prodQty);
				console.log(total);
				console.log(prodPc);
				console.log(prodTotalPc);

/*
				prodList.forEach((event)=>{
					prodId = $(event).text();
					var prodQty = $(event).parent("div").find("input[name=qty]").val();
					var prodImg = $(event).closest(".pos-order-product").find(".img").css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
					var modalTags = `
						<div class="modal-pos-product-info flex column">
							<div class="flex fs-10 fw-semibold">${prodId}    </div>
							<div class="flex text-body text-opacity-50 mb-2">${prodQty } </div>
							<div class="flex fs-3 fw-bold mb-3">${total}</div>
						</div>
					`;
					modalBody.append(modalTags);

				});
				*/
				var totalComma = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

				let posPayInfo = {
					prodId:prodId,
					prodQty:prodQty,
					prodNm:prodNm,
					total:total,
					prodPc:prodPc,
					prodTotalPc:prodTotalPc
				};

				let data = JSON.stringify(posPayInfo);
				console.log(data);
				console.log(posPayInfo);
				if(prodId.length !== 0 ){
					Swal.fire({
				 	   title: '결제 하시겠습니까?',
					   text: '총금액은 '+totalComma+'원 입니다.',
					   icon: 'info',

					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		    		   cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
					   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

					   reverseButtons: false, // 버튼 순서 거꾸로

					}).then(result => {
					   // 만약 Promise리턴을 받으면,
					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					       Swal.fire({
				            title: '결제가 완료되었습니다.',
				            text: '',
				            icon: 'success',
				            confirmButtonColor: '#3085d6', // Success 메시지의 확인 버튼 색상 변경
				        }).then(result2 =>{
								if(result2.isConfirmed){
								   	$.ajax({
										url : `${contextPath}/franchise/franchisePosPayment`,
										data: JSON.stringify(posPayInfo),
					            		contentType : 'application/json; charset=utf-8',
										method : "POST",
										success:(franNo)=>{
											console.log(franNo);
											location.href=`${contextPath}/franchise/franchisePos`
											//history.go(0);
										},
										error: (jqXHR, textStatus, request, error)=>{
												console.log("jqXHR", jqXHR);
												console.log("textStatus", textStatus);
												alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
										}
									});

								}
							});s
					   }
					});
			    } else {
			        Swal.fire({
			            title: '장바구니에 상품이 없습니다',
			            text: '상품을 담아주세요',
			            icon: 'warning',
			            confirmButtonColor: '#3085d6' // 경고 메시지의 확인 버튼 색상 변경
			        });
			    }
			});

	function saveModal(data){
		var prodId = data.prodId;
		var admininvQy = $("input[name=stock]").val();
		console.log(prodId, admininvQy);


		$("#save").click(function(){

			$.ajax({
				url : "updateAdminInvQy.do",
				data : {"prodId" : prodId,
						"admininvQy" : $("input[name=stock]").val()},
				type : "POST",
				success:(data)=>{
					console.log(data);
					location.reload();

				},
				error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
				}
			});
		});
	}



});