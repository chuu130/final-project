package kr.or.ddit.market.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.EventDefaultMapper;
import kr.or.ddit.vo.def.EventDefaultVO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDefaultMapper mapper;

	@Override
	public int removeByPrimaryKey(String eventId) {
		return mapper.deleteByPrimaryKey(eventId);
	}

	@Override
	public int registerEvent(EventDefaultVO row) {
		return mapper.insert(row);
	}

	@Override
	public EventDefaultVO selectByeventId(String eventId) {
		return mapper.selectByPrimaryKey(eventId);
	}

	@Override
	public List<EventDefaultVO> selectAllEvent() {
		return mapper.selectAll();
	}

	@Override
	public int modifyByeventId(EventDefaultVO row) {
		return mapper.updateByPrimaryKey(row);
	}

}
