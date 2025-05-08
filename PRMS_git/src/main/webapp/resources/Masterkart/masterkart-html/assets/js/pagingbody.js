document.addEventListener("DOMContentLoaded", () => {

	$(".paging-Area").on("click", "a[data-page]", function() {
		let page = this.dataset.page;
		searchForm.page.value = page;
		searchForm.requestSubmit();
	});

	const $searchUI = $("#searchUI").on("click", "#searchBtn" , function(){
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm[name].value = value;
		});
		searchForm.requestSubmit();
	});
});