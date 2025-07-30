package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import kr.or.ddit.vo.FranCalendarVO;

public interface franCalendarService {
	/**
	 * 프랜차이즈 캘린더 리스트
	 */
	public List<FranCalendarVO> selectFranCalendarList();

	/**
	 * 프랜차이즈 캘린더 등록
	 */
	public int insertFranCalendar(FranCalendarVO francalVO);

	public int checkFcalendar(int calNo);

	/**
	 * DB안에 있는 데이터 모두 삭제
	 */
	public int deleteAll();

	public FranCalendarVO selectFrancalendar(int calNo);

	public int updatefrancal(FranCalendarVO fcalVO);

	public int deletefrancal(int calNo);

	/**
	 * 해당 프랜차이즈의 캘린더 리스트
	 */
	public List<FranCalendarVO> selectFranCalendarListed(String franchiseId);



}
