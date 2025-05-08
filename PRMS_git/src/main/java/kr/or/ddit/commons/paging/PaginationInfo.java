package kr.or.ddit.commons.paging;

import java.util.HashMap;
import java.util.Map;

import lombok.Getter;

@Getter
public class PaginationInfo {
	private int totalRecord; 					// DB 조회
	private int page; 							// 사용자 요청 파라미터
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public void setPage(int page) {
		this.page = page;
	}


	private int recordCount;					// 임의 결정
	private int pageSize;						// 임의 결정

	// 기본생성자
	public PaginationInfo() {
		this(10, 5);
	}

	// 이 생성자를 사용했을 때, 한 화면에 보여줄 데이터 개수와 페이지 개수를 지정한다.
	public PaginationInfo(int recordCount, int pageSize) {
		this.recordCount = recordCount;
		this.pageSize = pageSize;
	}

	private SimpleCondition simpleCondition;
	public void setSimpleCondition(SimpleCondition simpleCondition) {
		this.simpleCondition = simpleCondition;
	}

	// 이 맵퍼는 카테고리분류조건을 넘길때
	private Map<String,Object> detailCondition = new HashMap<String, Object>();
	public void addDetailCondition(String searchName, Object searchValue) {
		detailCondition.put(searchName, searchValue);
	}
	public void setDetailCondition(Map<String, Object> detailCondition) {
		this.detailCondition = detailCondition;
	}
	//이런식으로 맵퍼에 담으면 이 맵퍼의 값도 다같이 simpleCondition안에 포함되서 넘길 수 있으므로
	//서비스 매퍼 건들일 필요없음 xml은 카테고리를 쓰려면 약간의 수정 필요 그냥 단일 검색조건만 있으면
	// xml마저도 바꿀 필요 없음.



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