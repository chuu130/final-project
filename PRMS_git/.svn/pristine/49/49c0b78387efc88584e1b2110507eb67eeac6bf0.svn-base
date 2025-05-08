package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.HotelroomDefaultVO;

/**
 * 가맹점 호텔방 관리 서비스
 * @author ahj
 *
 */
public interface HotelroomService {

	/**
	 * 호텔방 추가
	 * @param hotelroom
	 */
	public void createHotelroom(HotelroomDefaultVO hotelroom);

	/**
	 * 특정 호텔방 상세조회
	 * @param hotelId
	 * @return
	 * @throws PkNotFoundException
	 */
	public HotelroomDefaultVO retrieveHotelroom(String hotelId) throws PkNotFoundException;

	/**
	 * 자점 호텔방 리스트 조회(페이징)
	 * @param inputData
	 * @return
	 */
	public List<HotelroomDefaultVO> retrieveHotelroomList(HashMap<String, Object> inputData);

	/**
	 * 호텔방 정보 수정
	 * @param hotelroom
	 */
	public void modifyHotelroom(HotelroomDefaultVO hotelroom);

	/**
	 * 호텔방 삭제
	 * @param hotelId
	 */
	public void deleteHotelroom(String hotelId);

	/**
	 * 호텔방 사용여부 오후 12시마다 실행
	 */
	public void updateHotelUseAt();
	public void updateHotelUseAt2();
	public void updateHotelUseAt3();
	public void updateHotelUseAt4();
	public void updateHotelUseAt5();
}
