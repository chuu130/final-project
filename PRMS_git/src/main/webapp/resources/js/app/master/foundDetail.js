/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	const contextPath = document.body.dataset.contextPath;
	const foundNo = document.querySelectorAll(".fLink");
	const listBody = document.querySelector("#list-body");

	//상담내용보기 모달
	let foundDetail = new bootstrap.Modal(document.getElementById('foundCn_modal'), {
	});

	foundNo.forEach(link => {
		link.addEventListener("click", (e) => {
			e.preventDefault();
			let fNo = link.dataset.no;
		fetch(`${contextPath}/main/master/foundCheckDetail.do?what=${fNo}`,{
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
			listBody.innerHTML = `
									<div style="margin: 50px auto; padding: 20px;">
										<div style="margin-bottom: 20px;">
											취업상담자: ${data.found.foundNm}
										</div>
										<div >
											취업상담내용:<textarea class="form-control" rows="20" cols="50" style="white-space: pre-wrap;">${data.found.foundCn}</textarea>
										</div>
									</div>
			`;
			foundDetail.show();
		})
		.catch(err=>console.log(err));
		});
	});
});