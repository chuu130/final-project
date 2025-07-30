package kr.or.ddit.franchise.staff.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;

public interface StaffEmerFranInvService {

	/**
	 * 직원 긴급 재고신청 가맹점 재고조회
	 * @param what
	 * @return
	 */
	public List<InventoryDefaultVO> retrieveStaffEmerFranInvList(HashMap<String, Object> inputData);

	/**
	 * 직원 근처 가맹점 리스트 조회
	 * @param franchiseId
	 * @return
	 */
	public List<FranchiseDefaultVO> retrieveStaffFranchiseList(String franchiseId);
}
