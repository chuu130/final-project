package kr.or.ddit.commons.paging;

public class ThemeType1PaginationRenderer implements PaginationRenderer {
//마켓 페이징 타입
	@Override
	public String renderPagination(PaginationInfo paging, String funcName) {

		int firstPage = paging.getFirstPage();
		int lastPage = paging.getLastPage();
		int pageSize = paging.getPageSize();
		int totalPage = paging.getTotalPage();
		int currentPage = paging.getPage();

		StringBuffer pagingHTML = new StringBuffer();
		String pattern = "<li><a %s href='javascript:;' data-page='%d'>%s</a></li>\n";
		String pattern2 = "<li><a class=\"next\" %s href='javascript:;' data-page='%d'>%s</a></li>\n";

		if(firstPage > pageSize) {
			pagingHTML.append(
					String.format(pattern2, "", firstPage - pageSize, "이전")
			);
		}

		for(int page = firstPage; page <= lastPage; page++) {

			if(page == currentPage) {
				pagingHTML.append(
						String.format(pattern, "class=\"active\"", page, page)
				);
			} else {
				pagingHTML.append(
						String.format(pattern, "", page, page)
				);
			}
		}

		if(lastPage < totalPage) {
			pagingHTML.append(
					String.format(pattern2, "", lastPage + 1, "다음")
			);
		}

		return pagingHTML.toString();
	}

}
