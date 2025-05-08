package kr.or.ddit.commons.paging;

public interface PaginationRendererOrder {
	public String renderPagination(PaginationInfoOrder paging, String  funcName);

	// 필요하다면 상속받아서 얼마든지 오버라이딩이 가능하다.
	public default String renderPagination(PaginationInfoOrder paging) {
		return renderPagination(paging, null);
	}
}
