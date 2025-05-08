/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	const contextPath = document.body.dataset.contextPath;
	const emerDtNo = document.querySelectorAll(".fLink");
	const listBody = document.querySelector("#list-body");
	const debug = true; // 디버그 설정

	// 긴급재고신청 상세목록 모달
	let emerDetail = new bootstrap.Modal(document.getElementById('emerDt_modal'), {

	});

	emerDtNo.forEach(link => {
		link.addEventListener("click", (e) => {
			if(debug){
				console.log("e",e);
			}
			e.preventDefault();
			let eNo = link.dataset.no;
		fetch(`${contextPath}/main/franchisee/franEmerFranInvApplyDetail.do?what=${eNo}`,{
			method:"get",
			headers: {
				accept: "application/json"
			}
		}).then(resp=>{
			if(resp.ok){
				return resp.json();
			} else {
				throw new Error(`상태코드: ${resp.status}, ${resp.statusText}`);
			}
		}).then(data=> {
			if(debug){
				console.log("data",data);
			}
			let emerDtList = "";
			for(let i = 0; i < data.edList.length; i++ ){
				emerDtList += '<tr>\n';
				emerDtList += `<td>${data.edList[i].edetailNo}</td>\n`;
				if(data.edList[i].franprodImage === ""){
					emerDtList += `<td>사진없음</td>\n`;
				} else {
					emerDtList += `<td><img src="${data.edList[i].franprodImage}" class="rounded" style="width: 50px; height: 50px;"></td>\n`;
				};
				emerDtList += `<td class="text-start">${data.edList[i].franprodNm}</td>\n`;
				emerDtList += `<td>${data.edList[i].edetailQy}개</td>\n`;
				emerDtList += `<td class="text-end">${data.edList[i].edetailPcComma}원</td>\n`;
				emerDtList +='</tr>\n';
			}
			listBody.innerHTML = emerDtList;
			emerDetail.show();
		})
		.catch(err=>console.log(err));
		});
	});
});