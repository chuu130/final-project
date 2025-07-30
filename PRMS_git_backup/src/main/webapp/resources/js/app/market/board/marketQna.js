/**
 * 마켓 질문게시판
 */


//  QNA 검색창
    const centersearchform = document.querySelector("#centersearchform");
	const searchSelectType = document.querySelector("#searchSelectType");

	// 검색창 엔터이벤트 폼 전송 방식 
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
	
	
	// 질문유형 분류 클릭 이벤트
    // 선택 영역만 넘겨서 type,word를 넘긴다
	document.querySelectorAll('#questionTabs .nav-link').forEach(tab => {
        tab.addEventListener('click', function (e) {
            e.preventDefault(); // 이동방지
            
            // 모든 탭 active 활성화 제거
            document.querySelectorAll('#questionTabs .nav-link')
            .forEach(t => t.classList.remove('active'));
            
            // 선택한 탭만 active
            this.classList.add('active');
            
            // type 속성 값과 클릭시 질문유형 텍스트 값 저장
             const type = this.getAttribute('data-type');
			 const word = type === "" ? "" : this.textContent.trim();
        
            console.log("searchType 질문 유형:", type);
            console.log("searchword 질문 유형:", word);

            centersearchform.searchType.value = type;
            centersearchform.searchWord.value = word;


            // 폼 제출
            centersearchform.submit();

        });
    });
            //updateQuestionList(type);
        
        
        // 질문 유형별 리스트 필터링
         function updateQuestionList(type) {
             console.log(`필터링: ${type} 유형 질문`);
            
              const form = document.getElementById('centersearchform');
              const url = form.getAttribute('action');

              console.log("form 확인 : ",form);
              console.log("url 확인 : ",url);

		}
            
            //비동기 쿼리 파라미터 만드는 방법
            // const params = new URLSearchParams();
            // params.append('searchType', type);
            // params.append('searchWord', '');
            // params.append('page', 1);
            // console.log("요청 URL:", `${url}?${params.toString()}`);
            
            //fetch로 서버에서 HTML 조각을 받아오는 방법
        //     fetch(`${url}?${params.toString()}`, {
        //         headers: {
        //             'X-Requested-With': 'XMLHttpRequest' // ajax요청
        //         }
        //     })
        //         .then(res => res.text())
        //         .then(html => {
        //             // 결과 값 html
        //            document.getElementById('questionTabList').innerHTML = html;
        //         })
        //          .catch(err => console.error('Fetch 실패:', err));
        // }
	
	
	
/*	나중에 비동기로 질문답변 리스트 한번에 뽑아오는방법

document.addEventListener('DOMContentLoaded', () => {
    서버에서 데이터를 가져옵니다.
    fetch('${cPath}/market/member/centerMarketList',{
    	headers: {
    		accept: "application/json"  //  헤더설정 / accept에 값들어왔는지 확인할것
    	}
    	
    })
        .then(response => response.json()) // JSON으로 변환
        .then(centerList => {
            Q&A 목록을 표시할 div를 가져옴
            const qnaListDiv = document.getElementById('qna-list');
            qnaListDiv.innerHTML = ''; // 기존 내용을 초기화

            const centerQnaList = data.centerQnaList; // 질문 리스트
            const answerList = data.answerList;       // 답변 리스트

            질문 리스트를 화면에 표시
           if (centerList.length > 0) {
            	centerList.forEach(item => {
                    const formattedDate = item.ctrBbsDe.join('-'); // 날짜 포맷팅
                    const QStyle = item.parentNo ? 'margin-left: 100px;' : 'margin-left: 0%;'; 
                    const QNumber = item.parentNo ? "" : item.ctrBbsNo;
                    
                    qnaListDiv.innerHTML += `
                    	 <div class="qna-item ${indentClass}">
                            <div>\${QNumber}\${item.parentNo?"↪" : ""}</div>
                            <a href="${cPath}/\${item.parentNo ? 'market/member/centeranswerDetail/' + item.parentNo : 'market/member/centerMarketDetail/' + item.ctrBbsNo}"\${QStyle}>
                            \${item.ctrBbsNm}
                        	</a>
                            <div>\${item.memNo}</div>
                            <div>\${formattedDate}</div>
                        </div>
                        <hr>`;
                });
            } else {
                qnaListDiv.innerHTML += '<p>문의글이 없습니다.</p>';
            }
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            document.getElementById('qna-list').innerHTML = '<p>데이터를 불러오는 데 실패했습니다.</p>';
        });
    
    
});	

	
*/	
	
	
	
	
	
	