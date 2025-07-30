package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.HotelroomDefaultVO;
import kr.or.ddit.vo.def.HoteltimeDefaultVO;

public interface HotelTimeService {

	/**
	 * 체크인, 체크아웃날짜와 가맹점ID로 예약 가능한 방 정보 가져옴
	 * @param data
	 * @return
	 */
	public List<HotelroomDefaultVO> retrieveHotelroomByDate(HashMap<String, String> data);

	public HoteltimeDefaultVO retrieveHotelTime(HashMap<String, String> data);

	public void createHotelTime(HoteltimeDefaultVO timeInfo);

	public void modifyHotelTime(HoteltimeDefaultVO timeInfo);
}
