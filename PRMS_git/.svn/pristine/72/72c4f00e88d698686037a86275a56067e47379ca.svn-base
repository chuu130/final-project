/**
 *
 */
	const contextPath = document.body.dataset.contextPath;

	// 구별 점포 수 저장 객체
	let districtCounts = {};

	// 구 이름과 점포 수 배열 생성
	let districtLabels = Object.keys(districtCounts);
	let districtData = Object.values(districtCounts);


	//비동기로 점포수 가져옴
	let url1 = `${contextPath}/main/franchisee/franKakao.do`;
	let headers1 = {
					"Content-Type":"application/json",
					accept:"application/json"
				};
	let options1 = {
		headers:headers1
	}

	const ctx = document.querySelector('#myChart');
	//만들위치, 설정값객체
	const jmChart =new Chart(ctx, {
	    type: 'bar',  // bar, line, pie, doughnut, radar 등등...
	    data: {
	        labels: [],
	        datasets: [
	            {
	                label: '근처 가맹점 수',
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


	fetch(url1,options1).then((resp)=>{
		if(resp.ok){
			return resp.json();
		} else {
	          throw new Error(`상태코드 : ${resp.status} 에러메시지 : ${resp.statusText}`);
	    }
	}).then((fkList) => {
		for (let i = 0; i < fkList.length; i++) {
	      if (fkList[i].cmmnCodeNm) {
	        let addressParts = fkList[i].franchiseAdd1.split(' ');
	        let city = addressParts[0];  // 기본적으로 첫 번째 부분에 도시가 있다고 가정
	        let district = addressParts[1];  // 두 번째 부분에 구가 있다고 가정

	        // 구별 점포 수 증가
	        if (!districtCounts[district]) {
	          districtCounts[district] = 0;
	        }
	        districtCounts[district] += 1;
	      }
	    }
		// 차트 업데이트
	    let districtLabels = Object.keys(districtCounts);
	    let districtData = Object.values(districtCounts);

	    jmChart.data.labels = districtLabels;
	    jmChart.data.datasets[0].data = districtData;
	    jmChart.update(); //랜더링 다시 그리기

	});

