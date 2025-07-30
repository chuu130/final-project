document.addEventListener("DOMContentLoaded", ()=>{
	
	const listBody = $("#list-body");
	const pagingHtml = $(".paging-area");
	
	$(".dropdown-item").on("click", function(e){
		var name = this.dataset.value
		
		
		$.ajax({
			url : "adminProdList.do",
			data : {"name" : name},
			method : "POST",
			success : (data)=>{
				console.log(data);
				console.log(data.adminProdList);
				addprodList(data.adminProdList);
				console.log(data.name);
				console.log(data.pagingHTML);
				addpaging(data.pagingHTML);
				addbutton(data.name);
				$(".name").val(data.name);
				
			},
			error : (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		})
	});
	
	function addbutton(name){
		
		$("#dropdownMenuButton1").text(name);
		$(".searchType").val(name);
	};
	
	function addpaging(paging){
		pagingHtml.empty();
		console.log($(".name").val());
		pagingHtml.append(paging);
	};
	
	function addprodList(adminProdList){
		listBody.empty();
		
	
		
		adminProdList.forEach((prod)=>{
			prodList = `
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<img alt=""
												class="mw-100 mh-100 object-fit-cover rounded-1 my-n1"
												width="60" height="40" src="${prod.prodImage }">
											<div class="ms-3">
												<a href="/main/master/prodDetail.do?prodId=${prod.prodId }"
													class="text-body text-decoration-none">${prod.prodSleNm }</a>
											</div>
										</div>
									</td>
									<td class="align-middle">${prod.prodSlePc}</td>
									<td class="align-middle">${prod.cmmncode.cmmnCodeNm}</td>
								</tr>
			`;
			
			listBody.append(prodList);
		});
		
	};
});