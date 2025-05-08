package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.BeautyresDefaultVO;
import kr.or.ddit.vo.def.BeautytimeDefaultVO;

public interface BeautyTimeService {
	/**
	 * 가맹점ID와 날짜에 해당하는 모든 시간 슬롯 반환
	 * @param data
	 * @return
	 */
	public List<BeautytimeDefaultVO> retrieveBeautyTimeByDate(HashMap<String, String> data);
	/**
	 * 예약 가능한 슬롯을 직원ID와 함께 반환
	 * @param data
	 * @return
	 */
	public HashMap<String, String> checkAvailableSlots(HashMap<String, String> data, List<String> allEmpNos);

	/**
	 * 테이블에 존재하는 예약 날짜인지 확인 (존재하면 insert, 없으면 update필요)
	 * @param data
	 * @return
	 */
	public BeautytimeDefaultVO retrieveBeautyTime(HashMap<String, String> data);

	/**
	 * 새로운 예약 시간 생성
	 * @param resTime
	 */
	public void createBeautyTime(BeautytimeDefaultVO resTime);

	/**
	 * DB에 존재하는 예약시간 갱신
	 * @param resTime
	 */
	public void modifyBeautyTime(BeautytimeDefaultVO resTime);
}
