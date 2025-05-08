package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.franchise.franchisee.mapper.FranCalendarMapper;
import kr.or.ddit.vo.FranCalendarVO;

@Service
public class franCalendarServiceImpl implements franCalendarService{

	@Autowired
	private FranCalendarMapper mapper;

	@Override
	public List<FranCalendarVO> selectFranCalendarList() {
		return mapper.selectFranCalendarList();
	}

	@Override
	public int insertFranCalendar(FranCalendarVO francalVO) {
		int cnt = mapper.insertFranCalendar(francalVO);
		return cnt;
	}

	@Override
	public int checkFcalendar(int calNo) {
		int cnt = mapper.checkFcalendar(calNo);
		return cnt;
	}

	@Override
	public int deleteAll() {
		int cnt = mapper.deleteAll();
		return cnt;
	}

	@Override
	public FranCalendarVO selectFrancalendar(int calNo) {
		FranCalendarVO calVO = mapper.selectFrancalendar(calNo);
		if(calVO == null) {
			throw new PkNotFoundException(calVO.getCalNo());
		}
		return calVO;
	}

	@Override
	public int updatefrancal(FranCalendarVO fcalVO) {
		int cnt = mapper.updatefrancal(fcalVO);
		return cnt;
	}

	@Override
	public int deletefrancal(int calNo) {
		int cnt = mapper.deletefrancal(calNo);
		return cnt;
	}

	@Override
	public List<FranCalendarVO> selectFranCalendarListed(String franchiseId) {
		return mapper.selectFranCalendarListed(franchiseId);
	}



}
