package kr.or.ddit.commons.paging;

public class ThemeType2PaginationRendererOrder implements PaginationRendererOrder {

	@Override
	public String renderPagination(PaginationInfoOrder paging, String funcName) {

//		<li class="page-item mb-sm-0 mb-1 disabled"><a class="page-link">Previous</a></li>
//		<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">1</a></li>
//		<li class="page-item mb-sm-0 mb-1 active"><a class="page-link" href="#">2</a></li>
//		<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">3</a></li>
//		<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">4</a></li>
//		<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">5</a></li>
//		<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">6</a></li>
//		<li class="page-item mb-sm-0 mb-1"><a class="page-link" href="#">Next</a></li>


		int firstPage = paging.getFirstPage();
		int lastPage = paging.getLastPage();
		int pageSize = paging.getPageSize();
		int totalPage = paging.getTotalPage();
		int currentPage = paging.getPage();

		StringBuffer pagingHTML = new StringBuffer();
		String pattern = "<li class=\"page-item mb-sm-0 mb-1 %s\"><a class=\"page-link\" href='javascript:;' data-page='%d'>%s</a></li>\n";
//		String pattern2 = "<li><a class=\"next\" %s href='javascript:;' data-page='%d'>%s</a></li>\n";

		if(firstPage > pageSize) {
			pagingHTML.append(
					String.format(pattern, "", firstPage - pageSize, "이전")
			);
		}

		for(int page = firstPage; page <= lastPage; page++) {

			if(page == currentPage) {
				pagingHTML.append(
						String.format(pattern, "active", page, page)
				);
			} else {
				pagingHTML.append(
						String.format(pattern, "", page, page)
				);
			}
		}

		if(lastPage < totalPage) {
			pagingHTML.append(
					String.format(pattern, "", lastPage + 1, "다음")
			);
		}

		return pagingHTML.toString();
	}

}
