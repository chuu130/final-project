package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.InventoryDefaultVO;

public interface FranFranInvService {

	/**
	 * 점장 재고 조회 메서드
	 * @param inputData
	 * @return
	 */
	public List<InventoryDefaultVO> retrieveFranFranInvList(HashMap<String, Object> inputData);

	/**
	 * 점장 재고 폐기 메서드
	 * @param inventory
	 */
	public void modifyFranInvDispose(InventoryDefaultVO inventory);

	/**
	 * 점장 재고 반품 / 점장쪽재고 메서드
	 * @param inventory
	 */
	public void modifyFranInvReturn(InventoryDefaultVO inventory);

	/**
	 * 점장 재고 반품 / 본사쪽재고 메서드
	 * @param inventory
	 */
	public void modifyAdminInvReturn(InventoryDefaultVO inventory);

	/**
	 * 점장 재고 반품 / 반품시 가맹점 매출 등록 메서드
	 * @param inventory
	 * @param franchiseId
	 */
	public void createFranReturnSell(InventoryDefaultVO inventory, String franchiseId);

	/**
	 * 점장 재고 반품 / 반품시 본사 지출 등록 메서드
	 * @param inventory
	 * @param franchiseId
	 */
	public void createAdminReturnExp(InventoryDefaultVO inventory);


}
