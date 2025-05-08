package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.HotelresDefaultVO;

public interface HotelResService {
	/**
	 * 호텔 예약
	 * @param resInfo
	 */
	public String createHotelRes(HotelresDefaultVO resInfo);

	/**
	 * 회원번호로 회원의 호텔 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<HotelresDefaultVO> retrieveResListByMem(HashMap<String, Object> inputData);

	/**
	 * 예약상태 '예약취소'로 변경
	 * @param resHotelNo
	 */
	public void cancelHotelRes(String resHotelNo);

	/**
	 * 호텔예약 정보를 가져옴 (한 건)
	 * @param resHotelNo
	 * @return
	 */
	public HotelresDefaultVO retrieveResInfo(String resHotelNo);

	/**
	 * 가맹점Id로 가맹점의 모든 호텔예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<HotelresDefaultVO> retrieveResListByFran(HashMap<String, Object> inputData);

	/**
	 * 가맹점Id로 가맹점의 '예약완료' 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<HotelresDefaultVO> retrieveResListByFran1(HashMap<String, Object> inputData);

	/**
	 * 가맹점Id로 가맹점의 '이용완료' 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<HotelresDefaultVO> retrieveResListByFran2(HashMap<String, Object> inputData);

	/**
	 * 가맹점Id로 가맹점의 '예약취소' 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<HotelresDefaultVO> retrieveResListByFran3(HashMap<String, Object> inputData);

	/**
	 * 오후 12시마다 호텔이용 상태 '이용완료' 처리
	 */
	public void updateAllHotelResStatus();

	/**
	 * 레이트 체크아웃시 오후 10시마다 호텔이용 상태 '이용완료' 처리
	 */
	public void updateLateoutHotelResStatus();

	/**
	 * 호텔 예약 상세정보를 가져옴
	 * @param resHotelNo
	 * @return
	 */
	public HotelresDefaultVO retrieveResInfoDetail(String resHotelNo);

	public HotelresDefaultVO retrieveResByPetNo(String petNo);
	
	/**
	 * 호텔 예약 매출
	 * @param resInfo
	 */
	public void createHotelResSell(String resHotelNo);
	
	/**
	 * 호텔 예약 지출(환불)
	 * @param resInfo
	 */
	public void createHotelResExp(String resHotelNo);

}
