document.addEventListener("DOMContentLoaded", ()=>{

	
	
	var hash = window.location.hash;
	const item = document.querySelectorAll(".menu-item");
	if(hash && window.location.hash.slice(1)){
		var $this = window.location.hash.slice(1);
		
		item.forEach((e)=>{
			if($this === e.id){
				$(e).addClass("active");
				$(e).parent("div").parent("div").addClass("expand");
				history.replaceState({}, null, location.pathname);
				
			}
			
		});
		
		
		
	}
	var inputHash = $("#hash").val();
	console.log(inputHash);
	if(inputHash ){
		item.forEach((e)=>{
			if(inputHash === e.id){
				console.log(e.id);
				$(e).addClass("active");
				$(e).parent("div").parent("div").addClass("expand");
				//history.replaceState({}, null, location.pathname);
				
			}
			
		});
	}
	
});