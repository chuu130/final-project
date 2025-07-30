package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;

public interface FranEmerFranInvService {

	/**
	 * 점장 긴급 재고신청 가맹점 재고조회
	 * @param what
	 * @return
	 */
	public List<InventoryDefaultVO> retrieveFranEmerFranInvList(HashMap<String, Object> inputData);

	/**
	 * 점장 근처 가맹점 리스트 조회
	 * @param franchiseId
	 * @return
	 */
	public List<FranchiseDefaultVO> retrieveFranFranchiseList(String franchiseId);
}
