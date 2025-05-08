package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.HoteltimeDefaultMapper;
import kr.or.ddit.franchise.franchisee.mapper.HotelroomMapper;
import kr.or.ddit.vo.def.HotelroomDefaultVO;
import kr.or.ddit.vo.def.HoteltimeDefaultVO;

@Service
public class HotelTimeServiceImpl implements HotelTimeService {

	@Autowired
	HotelroomMapper roommapper;

	@Autowired
	HoteltimeDefaultMapper mapper;

	@Override
	public List<HotelroomDefaultVO> retrieveHotelroomByDate(HashMap<String, String> data) {
		return roommapper.selectHotelroomListByDate(data);
	}

	@Override
	public HoteltimeDefaultVO retrieveHotelTime(HashMap<String, String> data) {
		return mapper.selectHotelTime(data);
	}

	@Override
	public void createHotelTime(HoteltimeDefaultVO timeInfo) {
		mapper.insertHotelTime(timeInfo);
	}

	@Override
	public void modifyHotelTime(HoteltimeDefaultVO timeInfo) {
		mapper.updateHotelTime(timeInfo);
	}

}
