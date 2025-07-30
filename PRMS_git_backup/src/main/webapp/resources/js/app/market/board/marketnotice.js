/**
 *  마켓 공지사항 
 */
 

 // 마켓 공지사항 검색창
    const centersearchform = document.querySelector("#centersearchform");
	const searchSelectType = document.querySelector("#searchSelectType");
	// 검색창 엔터이벤트
	function keyDown(el,e){
		if(e.key == "Enter"){
			console.log("event발생el",el)
			console.log("event발생e",e)
			centersearchform.searchType.value = searchSelectType.value;
			centersearchform.searchWord.value = el.value;

			console.log("el.value",el.value)
			console.log("searchSelectType 값",searchSelectType.value)
			
			console.log("centersearchform", centersearchform);
			console.log("현재 폼경로:", centersearchform.action);
			
			centersearchform.submit();  
		}
	}
	
	// 돋보기 아이콘 클릭 이벤트
	function clickSearch() {
		const el = document.getElementById("inputContent");
		console.log("클릭이벤트발생")
		console.log("event발생el",el)
		centersearchform.searchWord.value = el.value;
	    console.log("el.value",el.value)
	 	centersearchform.submit();
	}