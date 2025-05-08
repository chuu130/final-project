

// 1. UI 가 랜더링된 이후
// 2. 데이터(json)를 비동기 요청
// 3. json 응답을 수신하고, [{propertyName, propertyValue, description}...]

const contextPath = document.body.dataset.contextPath;
const listBody = document.querySelector("#list-body");
document.addEventListener("DOMContentLoaded", () => {
  // request line
  let url = contextPath + "/case2/propList";
//  let url = `${contextPath}/case2/propList`;
  let method = "get";
  // request header
  let headers = {
    accept: "application/json",
  };

  let options = {
    method: method,
    headers: headers,
  };

	const singleUI = (prop) => {
		return `
	        <tr>
	            <td>${prop.propertyName}</td>
	            <td>${prop.propertyValue}</td>
	            <td>${prop.description}</td>
	        </tr>        
		`;
	}

//  fetch(url, options)
//    .then((resp) => {
//      if (resp.ok) {
//        return resp.json();
//      } else {
//        throw new Error(`상태코드 : ${resp.status}
//                에러메시지 : ${resp.statusText}`);
//      }
//    })
//    .then((jsonObj) => {
//      let propList = jsonObj.propList;
//
//      console.log(propList);
//
//      let data = "";
//
//      propList.forEach((prop) => {
//        data += `
//            <tr>
//                <td>${prop.propertyName}</td>
//                <td>${prop.propertyValue}</td>
//                <td>${prop.description}</td>
//            </tr>        
//        `;
//      });
//      listBody.innerHTML = data;
//    });


  fetch(url, options)
    .then((resp) => {
      if (resp.ok) {
        return resp.json();
      } else {
        throw new Error(`상태코드 : ${resp.status}
                에러메시지 : ${resp.statusText}`);
      }
	  // 구조분해문법(destructing)
    })
    .then(({propList}) => listBody.innerHTML = `${propList.map(singleUI).join("\n")}`)
	.catch(console.log);
});
