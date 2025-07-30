document.addEventListener("DOMContentLoaded", () => {

	let cdQyListTag = document.querySelectorAll(".cdQy"); // 상품별 구매수량 리스트
	const prodQyPriceListTag = document.querySelectorAll(".prodQyPrice"); // 구매가격 태그

	/* 서버에서 받아온 상품금액과 구매수량을 곱하는 로직 (서버사이드 랜더링으로 데이터를 받아와서 이렇게 처리함..)*/
	for(let i = 0; i < prodQyPriceListTag.length; i++) {
		let prodQyPrice = Number(prodQyPriceListTag[i].innerHTML.replace(/,/g, '')) * Number(cdQyListTag[i].innerHTML);
		prodQyPriceListTag[i].innerHTML = prodQyPrice.toLocaleString();
	}

});