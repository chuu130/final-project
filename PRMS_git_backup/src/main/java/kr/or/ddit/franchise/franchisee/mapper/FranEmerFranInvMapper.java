package kr.or.ddit.franchise.franchisee.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Mapper
public interface FranEmerFranInvMapper {

	/**
	 * 점장 근처 긴급 재고신청 가맹점 재고 조회 매퍼
	 * @param inputData
	 * @return
	 */
	public List<InventoryDefaultVO> selectFranEmerFranInvList(HashMap<String, Object> inputData);

	/**
	 * 페이징
	 * @param paging
	 * @param what
	 * @return
	 */
	public int selectTotalRecord(@Param("paging")PaginationInfo paging, @Param("what")String what, @Param("franchiseId")String franchiseId);

	/**
	 * 점장 근처 가맹점리스트 조회 매퍼
	 * @param franchiseId
	 * @return
	 */
	public List<FranchiseDefaultVO> selectFranFranchiseList(@Param("franchiseId") String franchiseId);

}
