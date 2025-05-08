package kr.or.ddit.commons.paging;

public class DefaultPaginationRenderer implements PaginationRenderer {
	@Override
	public String renderPagination(PaginationInfo paging, String funcName) {
		
		int firstPage = paging.getFirstPage();
		int lastPage = paging.getLastPage();
		int pageSize = paging.getPageSize();
		int totalPage = paging.getTotalPage();
		int currentPage = paging.getPage();
		
		StringBuffer pagingHTML = new StringBuffer();
		String pattern = "<a href='javascript:;' data-page='%d'>%s</a>\n";
		
		if(firstPage > pageSize) {
			pagingHTML.append(
					String.format(pattern, firstPage - pageSize, "이전")
			);
		}
		
		for(int page = firstPage; page <= lastPage; page++) {
			
			if(page == currentPage) {
				pagingHTML.append(
						String.format(pattern, page, "[" + page + "]")
				);
			} else {
				pagingHTML.append(
						String.format(pattern, page, page)
				);
			}
		}
		
		if(lastPage < totalPage) {
			pagingHTML.append(
					String.format(pattern, lastPage + 1, "다음")
			);
		}
		
		return pagingHTML.toString(); 
	}

}
