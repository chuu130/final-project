package kr.or.ddit.commons.paging;

public class RetailPaginationRenderer implements PaginationRenderer {
	@Override
	public String renderPagination(PaginationInfo paging, String funcName) {

		int firstPage = paging.getFirstPage();
		int lastPage = paging.getLastPage();
		int pageSize = paging.getPageSize();
		int totalPage = paging.getTotalPage();
		int currentPage = paging.getPage();

		StringBuffer pagingHTML = new StringBuffer();
		String active = "";
		String pattern = "<li class='page-item mb-sm-0 mb-1 %s'><a class='page-link' href='javascript:;' data-page='%d'>%s</a></li>";
		pagingHTML.append(
			"<div class=\"d-lg-flex align-items-center\">\n"
			+ "<div class=\"me-lg-auto text-md-left text-center mt-2 mt-lg-0 mb-2 mb-lg-0\"> </div><ul class=\"pagination mb-0 justify-content-center flex-wrap\">"
		);

		if(firstPage == 1) {
			pagingHTML.append(
					String.format(pattern, "disabled", firstPage - pageSize, "이전")
			);
		}

		if(firstPage > pageSize) {
			pagingHTML.append(
				String.format(pattern, "", firstPage - pageSize, "이전")
			);
		}

		for(int page = firstPage; page <= lastPage; page++) {

			if(page == currentPage) active = "active";
			else active = "";

			pagingHTML.append(
				String.format(pattern, active, page, page)
			);

		}

		if(lastPage < totalPage) {
			pagingHTML.append(
					String.format(pattern, "", lastPage + 1, "다음")
			);
		}

		if(lastPage == totalPage) {
			pagingHTML.append(
					String.format(pattern, "disabled", lastPage + 1, "다음")
			);
		}

		pagingHTML.append(
			"</ul>\n</div>"
	    );

		return pagingHTML.toString();
	}
}
