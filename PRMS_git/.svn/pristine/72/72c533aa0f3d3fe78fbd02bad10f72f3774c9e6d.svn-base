package kr.or.ddit.market.member.service;


import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.BeautyresDefaultVO;

public interface BeautyResService {
	/**
	 * 미용예약
	 * @param resInfo
	 */
	public String createBeautyRes(BeautyresDefaultVO resInfo);

	/**
	 * 회원번호로 미용예약리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<BeautyresDefaultVO> retrieveResListByMem(HashMap<String, Object> inputData);

	/**
	 * 예약번호로 예약정보 가져옴
	 * @param resBeautyNo
	 * @return
	 */
	public BeautyresDefaultVO retrieveResInfo(String resBeautyNo);

	/**
	 * 예약상태 '예약취소'로 변경
	 * @param resBeautyNo
	 */
	public void cancelBeautyRes(String resBeautyNo);

	/**
	 * 한시간 간격으로 예약상태 '이용완료'로 변경
	 */
	public void updateAllBeautyResStatus();

	/**
	 * 미용예약번호 중복 체크
	 */
	public int checkbeautyNo(String resBeautyNo);

	/**
	 * 가맹점Id로 가맹점의 미용 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<BeautyresDefaultVO> retrieveResListByFran(HashMap<String, Object> inputData);

	/**
	 * 가맹점Id로 가맹점의 '예약완료' 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<BeautyresDefaultVO> retrieveResListByFran1(HashMap<String, Object> inputData);

	/**
	 * 가맹점Id로 가맹점의 '이용완료' 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<BeautyresDefaultVO> retrieveResListByFran2(HashMap<String, Object> inputData);

	/**
	 * 가맹점Id로 가맹점의 '이용취소' 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<BeautyresDefaultVO> retrieveResListByFran3(HashMap<String, Object> inputData);

	/**
	 * 직원번호로 직원에 해당하는 미용 예약 리스트 가져옴
	 * @param inputData
	 * @return
	 */
	public List<BeautyresDefaultVO> retrieveResListByEmp(HashMap<String, Object> inputData);

	/**
	 * 미용예약 상세정보 조회
	 * @param resBeautyNo
	 * @return
	 */
	public BeautyresDefaultVO retrieveResInfoDetail(String resBeautyNo);

	/**
	 * 예약정보 가져옴
	 * @param petNo
	 * @return
	 */
	public BeautyresDefaultVO retrieveResByPetNo(String petNo);

	/**
	 * 미용예약 매출 등록
	 * @param resInfo
	 */
	public void createBeautyResSell(BeautyresDefaultVO resInfo);
	
	/**
	 * 미용예약 지출 등록(환불)
	 * @param resInfo
	 */
	public void createBeautyResExp(BeautyresDefaultVO resInfo);
	
	/**
	 * 미용리뷰 전체리스트
	 * @param resBeautyNo
	 * @return
	 */
	public List<BeautyresDefaultVO> selectBeautyReviewList(String resBeautyNo);
}
