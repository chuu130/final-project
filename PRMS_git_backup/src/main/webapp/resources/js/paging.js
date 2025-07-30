/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	$(".paging-area").on("click", "a[data-page]", function(){
		let page = this.dataset.page;
		searchform.page.value = page;
		searchform.requestSubmit();
	});
//	searchUI.querySelector("#searchBtn")
	const $searchUI = $("#searchUI").on("click", "#searchBtn", function(){
//		$(this).parent("#searchBtn") == $searchUI
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();
	});

	const $enterkey = $(".enterkey").on("keydown",".enterkey", function(e){
		if(e.key === "Enter"){
			$searchUI.find(":input[name]").each(function(index, input){
				let name = this.name;
				let value = $(this).val();
				searchform[name].value = value;
			});
			searchform.requestSubmit();
		}
	})

	const $selectkey = $(".selectkey").on("change",".selectkey", function(e){
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();
	})
});