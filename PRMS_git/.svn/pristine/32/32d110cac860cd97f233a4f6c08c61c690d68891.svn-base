document.addEventListener("DOMContentLoaded", ()=>{
	
	const listBody = $("#list-body");
	$(".paging-area").on("click", "a[data-page]" , function(){
		let page = this.dataset.page;
		searchform.page.value = page;
		searchform.requestSubmit();
	});
	
	const $searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();
	});
	
	$(".dropdown-item").on("click", function(e){
		var name = this.dataset.value
		
		
		$.ajax({
			url : "adminInvList",
			data : {"name" : name},
			method : "POST",
			success : (data)=>{
				console.log(data);
				addprodList(data);
				console.log(data.name);
				addbutton(name);
				$(".name").val(data.name);
				
			},
			error : (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		})
	});
	function addbutton(name){
		$("#dropdownMenuButton1").text(name);
	};
	
	
	function addprodList(data){
		listBody.empty();
	
		
		data.forEach((inv)=>{
			invList = `
								<tr>
			       	 		<td class="dt-type-numeric dtfc-fixed-start dtfc-fixed-left mouse order-border-side"
										style="position: sticky; padding-left: 0px;"><a style="padding : 5px;"
										data-bs-toggle="modal" data-bs-target="#modalDetail" data-id="${inv.prodId }"><i
											class="fa fa-search fa-fw"></i></a></td>
			                <td class="order-border-right">${inv.prodId}</td>
			                <td class="order-border-right">${inv.cmmnCodeNm }</td>
			              	<td class="order-border-right">${inv.admininvNm}</td>
			                <td class="order-border-right">${inv.admininvQy}</td>
			                <td class="order-border-right">${inv.partprodPc}</td>
			                <td class="order-border-right">${inv.partnersCornm}</td>
			            </tr>
			`;
			
			listBody.append(invList);
		});
		
	};
	$('#search').click(function(e) {  
		console.log(e);
	    $("#dropdownMenuButton1").text(전체);
	});
		
	
	
	$('#modalDetail').on('show.bs.modal', function(e){
		var prodId = $(e.relatedTarget).data('id');
		console.log(prodId);
		
		$.ajax({
			url : "adminInvDetail.do",
			data : {"prodId" : prodId},
			method : "POST",
			success:(data)=>{
				console.log(data);
				showModal(data);
				saveModal(data);
			},
			error: (jqXHR, textStatus, errorThrown)=>{
						console.log("textStatus", textStatus);
			}
		});
	});
	
	function showModal(data){
		var prodList = '';
		$(".modal-body").empty();
		
			
		prodList=	'<div class="row gx-4 align-items-center">';
		prodList+=	'		<div class="col-sm-5 mb-3 mb-sm-0"> ';                                                            
		prodList+=	'			<div class="card bg-body">     ';                                                             
		prodList+=	'				<div class="card-body p-3">    ';                                                         
		prodList+=	'					<img alt="" src='+data[0].partprodImage+' class="mw-100 d-block">';          
		prodList+=	'				</div>                                                                                  ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'		</div>                                                                                          ';
		prodList+=	'		<div class="col-sm-7 py-1 fs-13px">                                                             ';
		prodList+=	'			<div class="row mb-10px">                                                                   ';
		prodList+=	'				<div class="col-4 fw-bold">상품코드:</div>                                              ';
		prodList+=	'				<div class="col-8 text-body">' + data[0].prodId + '</div>'; 
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'			<div class="row mb-10px">                                                                   ';
		prodList+=	'				<div class="col-4 fw-bold">상품이름:</div>                                              ';
		prodList+=	'				<div class="col-8 text-body">'+data[0].admininvNm +'</div>                                          ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'			<div class="row mb-10px">                                                                   ';
		prodList+=	'				<div class="col-4 fw-bold">카테고리:</div>                                              ';
		prodList+=	'				<div class="col-8 text-body">                                                           ';
		prodList+=	'					<span class="badge text-bg-theme py-6px px-2 fs-10px my-n1 fw-bold">'+data[0].cmmnCodeNm +'</span>    ';
		prodList+=	'				</div>                                                                                  ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'			<div class="row mb-10px">                                                                   ';
		prodList+=	'				<div class="col-4 fw-bold">입고단가:</div>                                              ';
		prodList+=	'				<div class="col-8 text-body">'+ data[0].partprodPc+'</div>                                               ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'			<div class="row mb-10px">                                                                   ';
		prodList+=	'				<div class="col-4 fw-bold">가격:</div>                                                  ';
		prodList+=	'				<div class="col-8 text-body">'+data[0].prodSlePc+'</div>                                               ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'			<div class="row mb-10px">                                                                   ';
		prodList+=	'				<div class="col-4 fw-bold">입고(수량)날짜:</div>                                                ';
		prodList+=	'				<div class="col-8 text-success date"></div>                                              ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'			<div class="row">                                                                           ';
		prodList+=	'				<div class="col-4 fw-bold">Stock:</div>                                                 ';
		prodList+=	'				<div class="col-8 text-body">                                                           ';
		prodList+=	'					<input type="text" name="재고수량" class="form-control form-control-sm w-100px" value='+data[0].admininvQy +  '>         ';
		prodList+=	'				</div>                                                                                  ';
		prodList+=	'			</div>                                                                                      ';
		prodList+=	'		</div>                                                                                          ';
		prodList+=	'	</div>                                                                                              ';
		    $(".modal-body").append(prodList);   
		
		const dateBody = $(".date");
		
		for(var i =0; i<data.length; i++){
			divTags = `
				<span>${data[i].warQy}개</span>
				<span>${data[i].warDe}</span>
				<br>
			`;
			
			dateBody.append(divTags);
		}                               
	
	}
	
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