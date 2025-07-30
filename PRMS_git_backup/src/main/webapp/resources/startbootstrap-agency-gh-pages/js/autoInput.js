/**
 *
 */
document.addEventListener("DOMContentLoaded", ()=>{
	const autoInput = document.querySelector("#autoInput");
	const foundNm = document.querySelector(".foundNm"); //이름
	const foundTelno = document.querySelector(".foundTelno"); // 전화번호
	const foundEmail = document.querySelector(".foundEmail"); // 이메일
	const foundZip = document.querySelector(".foundZip"); // 우편번호
	const foundAdres1 = document.querySelector(".foundAdres1"); // 주소
	const foundAdres2 = document.querySelector(".foundAdres2"); // 상세주소
	const foundPlace = document.querySelector(".foundPlace"); // 창업희망장소
	const foundCn = document.querySelector(".foundCn"); // 창업상담내용


	autoInput.addEventListener("click", function(){
		foundNm.value = "장민";
		foundTelno.value = "010-1234-1234";
		foundEmail.value = "aa@naver.com";
		foundZip.value = "34907";
		foundAdres1.value = "대전 중구 계룡로 852";
		foundAdres2.value = "14동 1206호";
		foundPlace.value = "대전";
		foundCn.value = `안녕하세요. 저는 반려동물을 사랑하고, 이 분야에서 다양한 경험을 쌓아온 장민입니다. 최근 반려동물 용품 판매, 반려미용, 그리고 반려호텔을 결합한 종합 반려동물 서비스를 제공하는 창업을 고려하고 있습니다.\n
현재 반려동물 시장의 성장 가능성에 주목하고 있으며, 고객들이 한 곳에서 모든 서비스를 편리하게 이용할 수 있는 공간을 마련하고자 합니다. 특히, 반려동물의 건강과 안전을 최우선으로 생각하며, 최신 미용 기술과 친환경 용품을 제공하고자 합니다.\n
대전에서 창업하고 싶고 창업 과정에서 필요한 법적 절차, 자금 조달, 매장 위치 선정, 마케팅 전략 등 전반적인 사항에 대해 전문가의 조언을 받고 싶습니다. 특히, 세 가지 사업을 동시에 운영하는 데 필요한 초기 자본과 예상되는 운영 비용, 수익성 분석에 대해 자세히 알고 싶습니다. 또한, 반려동물 산업 내에서 성공적인 창업을 위한 팁이나 주의사항이 있다면 적극적으로 듣고 싶습니다.\n
창업 상담을 통해 구체적인 방향성을 정립하고, 사업 계획을 체계적으로 준비해 나가고 싶습니다.\n
답변 주시면 감사하겠습니다.`;
	});
});