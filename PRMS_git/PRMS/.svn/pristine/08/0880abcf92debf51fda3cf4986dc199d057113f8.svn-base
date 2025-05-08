/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	$(".paging-area").on("click", "a[data-page]", function(){
		let page = this.dataset.page;
		let targetFormId = $(this).parents(".paging-area[data-target-form]").data("targetForm");
		let targetForm;
		if (targetFormId) {
			targetForm = document.querySelector(targetFormId);
		}else{
			targetForm = searchform;
		}
		targetForm.page.value = page;
		targetForm.requestSubmit();
	});
//	searchUI.querySelector("#searchBtn")
	const $searchUI = $(".search-ui").on("click", ".search-btn", function(){
//		$(this).parent("#searchBtn") == $searchUI
		let targetFormId = $(this).parents(".search-ui[data-target-form]").data("targetForm");
		let targetForm;
		if (targetFormId) {
			targetForm = document.querySelector(targetFormId);
		}else{
			targetForm = searchform;
		}
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			targetForm[name].value = value;
		});
		targetForm.requestSubmit();
	});
});