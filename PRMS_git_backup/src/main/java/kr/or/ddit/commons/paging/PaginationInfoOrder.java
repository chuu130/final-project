package kr.or.ddit.commons.paging;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.vo.SearchDataVO;
import lombok.Getter;

@Getter
public class PaginationInfoOrder {
	private int totalRecord; 					// DB 조회
	private int page; 							// 사용자 요청 파라미터

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public void setPage(int page) {
		this.page = page;
	}


	//온라인마켓 주문내역의 검색을 위함
	private SearchDataVO searchData;
	public void setSearchData(SearchDataVO searchData) {
		this.searchData = searchData;
	}


	private int recordCount;	// 한 화면에 보여줄 데이터 개수
	private int pageSize;		// 페이지 개수

	// 기본생성자
	public PaginationInfoOrder() {
		this(10, 5);
	}

	// 이 생성자를 사용했을 때, 한 화면에 보여줄 데이터 개수와 페이지 개수를 지정한다.
	public PaginationInfoOrder(int recordCount, int pageSize) {
		this.recordCount = recordCount;
		this.pageSize = pageSize;
	}


	// 이 맵퍼는 카테고리분류조건을 넘길때
	private Map<String,Object> detailCondition = new HashMap<String, Object>();
	public void addDetailCondition(String searchName, Object searchValue) {
		detailCondition.put(searchName, searchValue);
	}
	public void setDetailCondition(Map<String, Object> detailCondition) {
		this.detailCondition = detailCondition;
	}


//	private int totalPage;				// 연산 필요
//	private int firstPage;      		// 연산 필요
//	private int lastPage;       		// 연산 필요
//	private int firstRecord;           // 연산 필요
//	private int lastRecord;            // 연산 필요

	public int getTotalPage() {
		return  ((totalRecord-1)/recordCount) + 1;
	}
	public int getFirstPage() {
		 return ((page-1)/pageSize)*pageSize + 1;
	}
	public int getLastPage() {
		int lastPageNoOnPageList = getFirstPage()+pageSize-1;
		if(lastPageNoOnPageList>getTotalPage()){lastPageNoOnPageList=getTotalPage();}
		return lastPageNoOnPageList;
	}
	public int getFirstRecord() {
		return  getLastRecord() - (recordCount -1);
	}
	public int getLastRecord() {
		return page * recordCount;
	}


}