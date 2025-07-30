/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	const contextPath = document.body.dataset.contextPath;
	const invReqNo = document.querySelectorAll(".fLink");
	const listBody = document.querySelector("#list-body");
	const debug = true; // 디버그 설정

	// 발주신청 상세목록 모달
	let invReqDetail = new bootstrap.Modal(document.getElementById('fiOrder_modal'), {

	});

	invReqNo.forEach(link => {
		link.addEventListener("click", (e) => {
			if(debug){
				console.log("e",e);
			}
			e.preventDefault();
			let iNo = link.dataset.no;
		fetch(`${contextPath}/main/franchisee/franInvReqDetail.do?what=${iNo}`,{
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
			let fiOrderList = "";
			for(let i = 0; i < data.foList.length; i++ ){
				fiOrderList += `
					<tr>
						<td class="text-center align-middle">${data.foList[i].orderdetailNo}</td>
						<td class="text-center align-middle"><img src="${data.foList[i].prod.prodImage}" class="rounded" style="width: 50px; height: 50px;"></td>
						<td class="text-center align-middle">${data.foList[i].prod.prodSleNm}</td>
						<td class="text-center align-middle">${data.foList[i].orderdetailQy}개</td>
						<td class="text-center align-middle">${data.foList[i].orderdetailPcComma}원</td>
					</tr>
				`;
			}
			listBody.innerHTML = fiOrderList;
			invReqDetail.show();
		})
		.catch(err=>console.log(err));
		});
	});
});