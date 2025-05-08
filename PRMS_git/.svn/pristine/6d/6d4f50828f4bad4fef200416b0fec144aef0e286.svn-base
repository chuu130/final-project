package kr.or.ddit.franchise.franchisee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.FranCalendarVO;

@Mapper
public interface FranCalendarMapper {
	/**
	 * 프랜차이즈 캘린더 리스트
	 */
	public List<FranCalendarVO> selectFranCalendarList();

	/**
	 * 프랜차이즈 캘린더 등록
	 */
	public int insertFranCalendar(FranCalendarVO francalVO);

	/**
	 * 프랜차이즈 넘버로 데이터 체크
	 */
	public int checkFcalendar(int calNo);

	/**
	 * DB안에 있는 데이터 모두 삭제
	 */
	public int deleteAll();

	public FranCalendarVO selectFrancalendar(int calNo);

	public int updatefrancal(FranCalendarVO fcalVO);

	public int deletefrancal(int calNo);

	public List<FranCalendarVO> selectFranCalendarListed(String franchiseId);


}
