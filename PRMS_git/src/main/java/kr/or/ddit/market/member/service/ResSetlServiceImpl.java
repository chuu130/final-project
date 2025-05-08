package kr.or.ddit.market.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.RessetlDefaultMapper;
import kr.or.ddit.vo.def.RessetlDefaultVO;

@Service
public class ResSetlServiceImpl implements ResSetlService {

	@Autowired
	RessetlDefaultMapper mapper;

	@Override
	public void createBeautySetl(RessetlDefaultVO resSetlInfo) {
		mapper.insertBeautyResSetlInfo(resSetlInfo);
	}

	@Override
	public void createHotelSetl(RessetlDefaultVO resSetlInfo) {
		mapper.insertHotelResSetlInfo(resSetlInfo);
	}

	@Override
	public void cancelBeautySetl(String resBeautyNo) {
		mapper.updateBeautyResSetl(resBeautyNo);
	}
	@Override
	public void cancelHotelSetl(String resHotelNo) {
		mapper.updateHotelResSetl(resHotelNo);
	}


}
