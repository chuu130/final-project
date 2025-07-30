document.addEventListener("DOMContentLoaded", () => {

	$(".paging-area").on("click", "a[data-page]", function() {
		let page = this.dataset.page;
		let targetFormId = $(this).parents(".paging-area[data-target-form]").data("targetForm");
		if (targetFormId) {
			let targetForm = document.querySelector(targetFormId)
			targetForm.page.value = page;
			//			targetForm.requestSubmit();
		} else {
			searchform.page.value = page;
			searchform.requestSubmit();

		}
	});

	const $searchUI = $("#searchUI").on("click", "#searchBtn", function() {
		$searchUI.find(":input[name]").each(function(index, input) {
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();
	});

	const $enterkey = $(".enterkey").on("keydown", function(e) {
		if (e.key === "Enter") {
			$searchUI.find(":input[name]").each(function(index, input) {
				let name = this.name;
				let value = $(this).val();
				searchform[name].value = value;
			});
			searchform.requestSubmit();
		}
	})

	const $selectkey = $(".selectkey").on("change", function(e) {
		$searchUI.find(":input[name]").each(function(index, input) {
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();
	})
});