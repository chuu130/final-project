package kr.or.ddit.franchise.staff.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.InventoryDefaultVO;

public interface StaffFranInvService {

	/**
	 * 직원 재고 조회 서비스
	 * @param inputData
	 * @return
	 */
	public List<InventoryDefaultVO> retrieveStaffFranInvList(HashMap<String, Object> inputData);
}
