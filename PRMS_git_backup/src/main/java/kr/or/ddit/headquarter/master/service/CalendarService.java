package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.CalendarVO;

public interface CalendarService {
	/**
	 * CalendarVO 이용해서 DB 데이터 등록
	 */
	public int insertCalendar(CalendarVO calVO);

	public int updateCalendar(CalendarVO calVO);

	public int deleteCalendar(int calNo);

	/**
	 * 캘린더 리스트
	 */
	public List<CalendarVO> calendarList();

	/**
	 * DB에 캘린더 유무 체크
	 */
	public int CheckCalendar(int calNo);

	/**
	 * calNo를 이용해서 데이터 출력
	 */
	public CalendarVO selectcalendar(int calNo);
}
