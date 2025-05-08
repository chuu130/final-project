const FetchUtils = {
  fetchForText: (url, options) => {
    return fetch(url, options)
      .then((resp) => {
        if (resp.ok) {
          return resp.text();
        } else {
          throw new Error(`상태코드 : ${resp.status}
                           에러메시지 : ${resp.statusText}`);
        }
      })
      .catch((err) => console.log(err));
  },
  fetchForJSON: (url, options) => {
    return fetch(url, options)
      .then((resp) => {
        if (resp.ok) {
          return resp.json();
        } else {
          throw new Error(`상태코드 : ${resp.status}
                           에러메시지 : ${resp.statusText}`);
        }
      })
      .catch((err) => console.log(err));
  },
};
// FetchUtils.fetchforText("주소",{}).then(text=>console.log(txt));
