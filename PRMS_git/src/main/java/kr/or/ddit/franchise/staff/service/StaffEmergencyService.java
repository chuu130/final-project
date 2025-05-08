package kr.or.ddit.franchise.staff.service;

import kr.or.ddit.vo.def.EmergencyDefaultVO;

public interface StaffEmergencyService {

	/**
	 * 직원 긴급재고신청 메소드
	 * @param emergnecy
	 */
	void createStaffEmer(EmergencyDefaultVO emergnecy);

}
