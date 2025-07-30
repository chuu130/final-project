package kr.or.ddit.commons.paging;

public interface PaginationRenderer {
	public String renderPagination(PaginationInfo paging, String  funcName);

	// 필요하다면 상속받아서 얼마든지 오버라이딩이 가능하다.
	public default String renderPagination(PaginationInfo paging) {
		return renderPagination(paging, null);
	}
}
