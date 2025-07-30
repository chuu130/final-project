package kr.or.ddit.franchise.franchisee.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Mapper
public interface FranFranInvMapper {


	/**
	 * 점장 재고 조회 맵퍼
	 * @param inputData
	 * @return
	 */
	public List<InventoryDefaultVO> selectFranFranInvList(HashMap<String, Object> inputData);


	/**
	 * 페이징
	 * @param paging
	 * @param franchiseId
	 * @return
	 */
	public int selectTotalRecord(@Param("paging") PaginationInfo paging, @Param("franchiseId") String franchiseId);


	/**
	 * 점장 재고 폐기 맵퍼
	 * @param inventory
	 */
	public void updateFranInvDispose(InventoryDefaultVO inventory);


	/**
	 * 점장 재고 반품 / 점장쪽재고 맵퍼
	 * @param inventory
	 */
	public void updateFranInvReturn(InventoryDefaultVO inventory);


	/**
	 * 점장 재고 반품 / 본사쪽재고 맵퍼
	 * @param inventory
	 */
	public void updateAdminInvReturn(InventoryDefaultVO inventory);


	/**
	 * 점장 재고 반품 / 반품시 가맹점 매출 등록 맵퍼
	 * @param inventory
	 * @param franchiseId
	 */
	public void insertFranReturnSell(@Param("inventory") InventoryDefaultVO inventory, @Param("franchiseId") String franchiseId);


	/**
	 * 점장 재고 반품 / 반품시 본사 지출 등록 맵퍼
	 * @param inventory
	 */
	public void insertAdminReturnExp(InventoryDefaultVO inventory);
}
