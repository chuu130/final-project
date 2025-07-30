package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.EventDefaultMapper;
import kr.or.ddit.vo.def.EventDefaultVO;

@Service
public class EventListServiceImpl implements EventListService {
	@Autowired
	private EventDefaultMapper mapper;

	@Override
	public int deleteByPrimaryKey(String eventId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(EventDefaultVO row) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EventDefaultVO selectByPrimaryKey(String eventId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventDefaultVO> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(EventDefaultVO row) {
		// TODO Auto-generated method stub
		return 0;
	}

}
