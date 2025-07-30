/**
 * 관리자 qna
 */



//  QNA 검색창
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
	
	
	

// 질문답변 같이 묶어서 불러오기 사용안하고 리스트 질문만 불러옴
// document.addEventListener('DOMContentLoaded', () => {
    // 서버에서 데이터를 가져오기
//     fetch('${cPath}/main/master/centerMasterList',{
//     	headers: {
//     		accept: "application/json"  //  헤더설정 / accept에 값들어왔는지 확인할것
//     	}
    	
//     })
//         .then(response => response.json()) // JSON으로 변환
//         .then(centerList => {
            // Q&A 목록을 표시할 div
//             const qnaListDiv = document.getElementById('qna-list');
//             qnaListDiv.innerHTML = ''; // 기존 내용을 초기화합니다.

//             const centerQnaList = data.centerQnaList; // 질문 리스트
//             const answerList = data.answerList;       // 답변 리스트

            // 질문 리스트를 화면에 표시
//             if (centerList.length > 0) {
//             	centerList.forEach(item => {
//                     const formattedDate = item.ctrBbsDe.join('-'); // 날짜 포맷팅
//                     qnaListDiv.innerHTML += `
//                     	<div style="display: flex;">
//                             <strong>\${item.parentNo?"답변:":"질문"}</strong>
//                             <p>\${item.ctrBbsNo}</p>
//                             <a href="${cPath}/\${item.parentNo ? 'main/master/answerDetail/' + item.parentNo : 'main/master/questDetail/' + item.ctrBbsNo}">
//                             \${item.ctrBbsNm}
//                         	</a>
//                             <p>\${item.memNo}</p>
//                             <p>\${formattedDate}</p>
//                         </div>
//                         <hr>`;
//                 });
//             } else {
//                 qnaListDiv.innerHTML += '<p>문의글이 없습니다.</p>';
//             }
//         })
//         .catch(error => {
//             console.error('Error fetching data:', error);
//             document.getElementById('qna-list').innerHTML = '<p>데이터를 불러오는 데 실패했습니다.</p>';
//         });
// 	});
		