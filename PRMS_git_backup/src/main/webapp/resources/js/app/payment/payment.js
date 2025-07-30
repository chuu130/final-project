document.addEventListener("DOMContentLoaded", () => {
	  const contextPath = document.body.dataset.contextPath;
	  let payUrl = `${contextPath}/payment/ready`;
	  let payCancelUrl = `${contextPath}/payment/cancel`;


	 //결제버튼을 클릭했을 때 이벤트
	  $("#btn-pay").click(function() {
			 request_pay();
	  });


	  // 결제 로직
	  function request_pay() {

		  // 가맹점 식별코드로 Iamport 초기화 (나중에 서버에서 가져오도록 처리)
		  IMP.init('imp40838330');

		  // 상품상세 정보 (추가정보는 request_pay 관련 문서)
		  IMP.request_pay(
		  {
		    pg: "html5_inicis",
		    pay_method: "card",
//		    merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
		    merchant_uid: `o0013`, // 주문번호 직접생성
		    name: "테스트 상품",
		    amount: 100,
		    buyer_email: "fqenfnqeofjneqouf@gmail.com",
		    buyer_name: "홍길동",
		    buyer_tel: "010-4242-4242",
		    buyer_addr: "서울특별시 강남구 신사동",
		    buyer_postcode: "01181",
		  },

		  function (response) {
		    // 결제 종료 시 호출되는 콜백 함수
		    // response.imp_uid 값으로 결제 단건조회 API를 호출하여 결제 결과를 확인하고,
		    // 결제 결과를 처리하는 로직을 작성합니다.
		   console.log(response);
		  }

		);
	  }


	 // 환불처리 이벤트
	 $("#btn-pay-cancel").click(function() {
		cancelPay();
	 });

	 function cancelPay() {
	    jQuery.ajax({
	      "url": payCancelUrl,
	      "type": "POST",
	      "contentType": "application/json",
	      "data": JSON.stringify({
	        "merchant_uid": "o0002", // 예: ORD20180131-0000011
	        "cancel_request_amount": 100, // 환불금액
	        "reason": "테스트 결제 환불", // 환불사유
	        // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
	        "refund_holder": "홍길동",
	        // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
	        "refund_bank": "88",
	        // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
	        "refund_account": "56211105948400"
	      }),
	      "dataType": "json"
	  	});
 	 }


});


