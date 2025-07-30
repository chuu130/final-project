document.addEventListener("DOMContentLoaded", ()=>{
	
	$("#myTable").DataTable({
		
		processing: true,
        serverSide: true,

		ajax : {
			'url' : 'dataTables',
			'type' : 'GET',	
			'daraSrc' : '',	
		},
		colums: [
			{"data": "rnum"},
			{"data": "cmmncode.cmmnCodeNm"},
			{"data": "admininvNm"},
			{"data": "admininvQy"},
			{"data": "partprod.partprodPc"},
			{"data": "partners.partnersCornm"}
		]            
	});

	
});