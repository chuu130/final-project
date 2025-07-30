package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.headquarter.master.mapper.CalendarMapper;
import kr.or.ddit.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarMapper mapper;

	@Override
	public int insertCalendar(CalendarVO calVO) {
		int cnt = mapper.insertCalendar(calVO);
		return cnt;
	}

	@Override
	public int updateCalendar(CalendarVO calVO) {
		int cnt = mapper.updateCalendar(calVO);
		return cnt;
	}

	@Override
	public int deleteCalendar(int calNo) {
		int cnt = mapper.deleteCalendar(calNo);
		return cnt;
	}

	@Override
	public List<CalendarVO> calendarList() {
		return mapper.calendarList();
	}

	@Override
	public int CheckCalendar(int calNo) {
		int cnt = mapper.CheckCalendar(calNo);
		return cnt;
	}

	@Override
	public CalendarVO selectcalendar(int calNo) {
		CalendarVO calvo = mapper.selectcalendar(calNo);
		if(calvo == null) {
			throw new PkNotFoundException(calvo.getCalNo());
		}
		return calvo;
	}


}
