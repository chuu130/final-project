/**
 *
 */
	const contextPath = document.body.dataset.contextPath;
	const JEJU = "제주특별자치도"
	const GANGWON = "강원특별자치도"
	const JEOLLABUK = "전북특별자치도"
	const SEJONG = "세종특별자치시"

	// 구별 점포 수 저장 객체
	let districtCounts = {};

	// 구 이름과 점포 수 배열 생성
	let districtLabels = Object.keys(districtCounts);
	let districtData = Object.values(districtCounts);


	//비동기로 점포수 가져옴
	let url3 = `${contextPath}/main/master/franchise/franchiseListInfo`;
	let headers3 = {
					"Content-Type":"application/json",
					accept:"application/json"
				};
	let options3 = {
		headers:headers3
	}

	const ctx = document.querySelector('#myChart');
	//만들위치, 설정값객체
	const jmChart =new Chart(ctx, {
	    type: 'bar',  // bar, line, pie, doughnut, radar 등등...
	    data: {
	        labels: [],
	        datasets: [
	            {
	                label: '전국 가맹점 수',
	                data: [],
	                borderWidth: 1,
	            }
	        ]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true,
					ticks: {
				            stepSize: 1,
				            min: 0
				    }
	            }
	        }
	    }
	});


	fetch(url3,options3).then((resp)=>{
		if(resp.ok){
			return resp.json();
		} else {
	          throw new Error(`상태코드 : ${resp.status} 에러메시지 : ${resp.statusText}`);
	    }
	}).then((fList) => {
		console.log("fList",fList);
		for (let i = 0; i < fList.length; i++) {
	      if (fList[i].cmmnCodeNm) {
	        let addressParts = fList[i].franchiseAdd1.split(' ');
			console.log("addressParts",addressParts);
	        let city = addressParts[0];  // 시도
			//특별자치도빼고 이름 앞 두글자 남기기
			if(city == JEJU||
				city == GANGWON||
				city == JEOLLABUK||
				city == SEJONG
			){
				city = city.substr(0, 2); // 조건 맞으면 앞 두글자만 남기기
			} else {
			    city = city; // 조건 안맞으면 유지
			}
	        // 시도별 점포 수 증가
	        if (!districtCounts[city]) {
	          districtCounts[city] = 0;
	        }
	        districtCounts[city] += 1;
	      }
	    }
		// 차트 업데이트
	    let districtLabels = Object.keys(districtCounts);
	    let districtData = Object.values(districtCounts);

	    jmChart.data.labels = districtLabels;
	    jmChart.data.datasets[0].data = districtData;
	    jmChart.update(); //랜더링 다시 그리기

	});

