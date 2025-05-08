package kr.or.ddit.franchise.franchisee.service;

/**
 * 호텔방 추가시 가맹점의 호텔방 개수 갱신하는 서비스
 * @author ahj
 *
 */
public interface HotelroomCntService {

	/**
	 * 가맹점 호텔 수를 갱신
	 * @param franchiseId
	 */
	public void modifyHotelCnt(String franchiseId);
}
