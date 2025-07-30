/**
 *  관리자 공지사항 
 */
 

 //  공지사항 검색창
    const searchform = document.querySelector("#searchform");
	const searchType = document.querySelector("#searchType");

	// 검색창 엔터이벤트
	function keyDown(el,e){
		if(e.key == "Enter"){
			console.log("event발생el",el)
			console.log("event발생e",e)
			//searchform.searchType.value = searchType.value;
			searchform.searchWord.value = el.value;
			//console.log("searchType.value",searchType.value)
			console.log("el.value",el.value)
			searchform.submit();  
		}
	}
	
	// 돋보기 아이콘 클릭 이벤트
	function clickSearch() {
		const el = document.getElementById("inputContent");
		console.log("클릭이벤트발생")
		console.log("event발생el",el)
		searchform.searchWord.value = el.value;
	    console.log("el.value",el.value)
	 	searchform.submit();
	}