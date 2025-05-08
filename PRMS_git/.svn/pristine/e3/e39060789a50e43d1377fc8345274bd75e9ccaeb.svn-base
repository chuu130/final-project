document.addEventListener("DOMContentLoaded", () => {


	$(".plus").off().on("click", function(){
		let qty = $(this).parent("div").find("input").val();
		let admininvQy = $(".admininvQy").val();
			let memNo = $(this).parent("div").parent("div").find(".memNo").val();
			let prodId = $(this).parent("div").parent("div").find(".prodId").val();
		if(admininvQy > qty){
			$(this).parent("div").find("input").val(++qty);
			let slePc = $(this).parent("div").parent("div").find("input").val();

			let qtySlePc = qty * slePc;
			let qtySlePcComma = qtySlePc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			let price = $(this).parent("div").parent("div").parent("div").find(".new-price").text(qtySlePcComma +"원");
			let totalPrice = $(".totalPrice").val();
			let tp = parseInt(totalPrice) + parseInt(slePc);
			console.log(tp);
			$(".totalPrice").val(tp);
			let tpComma = tp.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(".total-price").text(tpComma + "원");
		}
		else{
			alert("재고가 없습니다.");
		}


		console.log(memNo, prodId);

		$.ajax({
			url : "memberCartUpdate",
			data : {"qty" : qty,
					"memNo" : memNo,
					"prodId" : prodId},
			method : "POST",
			success:(data)=>{
				console.log(data);
			},
			error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		})


	});

	$(".minus").off().on("click", function(){
		let qty = $(this).parent("div").find("input").val();
		let slePc = $(this).parent("div").parent("div").find("input").val();
		let memNo = $(this).parent("div").parent("div").find(".memNo").val();
		let prodId = $(this).parent("div").parent("div").find(".prodId").val();
		if (qty >1){
			$(this).parent("div").find("input").val(--qty);
			let qtySlePc = qty * slePc;
			let qtySlePcComma = qtySlePc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			let price = $(this).parent("div").parent("div").parent("div").find(".new-price").text(qtySlePcComma + "원");

			let totalPrice = $(".totalPrice").val();
			let tp = parseInt(totalPrice) - parseInt(slePc);
			console.log(tp);
			$(".totalPrice").val(tp);
			let tpComma = tp.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(".total-price").text(tpComma + "원");
		}


		$.ajax({
			url : "memberCartUpdate",
			data : {"qty" : qty,
					"memNo" : memNo,
					"prodId" : prodId},
			method : "POST",
			success:(data)=>{
				console.log(data);
			},
			error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		})

	});


	$(".remove").off().on("click", function(){
		let memNo = $(".memNo").val();
		let prodId =  $(this).closest(".ms-product-inner").find(".prodId").val();
		console.log(memNo, prodId);
		Swal.fire({
			title: '장바구니 목록에서 삭제하시겠습니까?',
			icon: 'warning',

			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3E9172', // confrim 버튼 색깔 지정
			cancelButtonColor: '#cecece', // cancel 버튼 색깔 지정
			confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			reverseButtons: false, // 버튼 순서 거꾸로

		}).then(result => {
			// 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면

				Swal.fire({
						   title: '목록에서 삭제되었습니다.',
						   text: '',
						   icon: 'success',
						   confirmButtonColor: '#3E9172'
					}).then(result2 =>{
					if(result2.isConfirmed){
							$.ajax({
								url : "memberCartDelete",
								data : {"memNo" : memNo,
										"prodId" : prodId},
								method : "POST",
								success:(data)=>{
									console.log(data);
									location.reload();
								},
								error: (jqXHR, textStatus, errorThrown)=>{
											console.log("textStatus", textStatus);
								}
							})

					}
				});

			}
		});


	});




});