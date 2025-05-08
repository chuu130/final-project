/**
 * 
 */

//const textAreaId = "noticeBbsCn";
//
//document.addEventListener("DOMContentLoaded", () => {
//
//	ClassicEditor
//		.create(document.getElementById(textAreaId))
//		.catch(error => {
//			console.error(error);
//		});

	document.querySelectorAll("[data-atch-file-id][data-file-sn]").forEach(el => {
		el.addEventListener("click", e => {
			e.preventDefault();
			let atchFileId = el.dataset.atchFileId;
			let fileSn = el.dataset.fileSn;
			FetchUtils.fetchForJSON(`/prms/main/masterNotice/atch/${atchFileId}/${fileSn}`, {
				method: "delete"
				, headers: {
					"accept": "application/json"
				}
			}).then(json => {
				if (json.success) {
					el.parentElement.remove();
				}
			});
		});
	});
