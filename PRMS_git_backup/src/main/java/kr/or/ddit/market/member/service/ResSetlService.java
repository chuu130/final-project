package kr.or.ddit.market.member.service;

import kr.or.ddit.vo.def.RessetlDefaultVO;

public interface ResSetlService {
	public void createBeautySetl(RessetlDefaultVO resSetlInfo);
	public void createHotelSetl(RessetlDefaultVO resSetlInfo);

	public void cancelBeautySetl(String resBeautyNo);
	public void cancelHotelSetl(String resHotelNo);
}
